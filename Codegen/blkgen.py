import numpy as np
import time

def headnotes(filename):
    localdate = time.strftime('%Y/%m/%d',time.localtime())
    localtime = time.strftime('%H:%M',time.localtime())
    hn_list = []
    hn_list.append('''// *********************************************************************************
// Project Name : SOM''')
    hn_list.append('// Create Time  : '+localdate+' '+localtime)
    hn_list.append('// File Name    : '+filename)
    hn_list.append('// Module Name  : '+filename[:-3])
    hn_list.append('''// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------''')
    hn_list.append('// '+localdate+'    '+'Zongpc'+'          1.0                     First Create')
    hn_list.append('// '+localtime)
    hn_list.append('// *********************************************************************************')
    hn = ''
    for hn_part in hn_list:
        hn = hn+hn_part+'\n'
    return hn[:-1]

def module_declare(som_size_num,som_size_layer,pipestage_nums,data_width,bidirection_mode,filename):
    md_list = []
    md_list.append('module'+' '+filename[:-3])
    md_list.append('#(')
    md_list.append('parameter  size_num   = '+str(som_size_num)+',')
    md_list.append('parameter  data_width = '+str(data_width)+',')
    md_list.append('parameter  tag_width  = $clog2(size_num)'+',')
    md_list.append('parameter  layers     = '+str(som_size_layer)+',')
    md_list.append('parameter  pipestage  = '+str(pipestage_nums))
    md_list.append(')(')
    md_list.append('''    input                                 clk_i,
    input                                 rst_i,

    input [tag_width+data_width-1:0]      data_in[0:size_num-1],
    output logic[data_width-1:0]          data_out_reg[0:size_num-1],
    input [size_num/2-1:0]                ctrl_in[0:layers-1],
    output [size_num/2-1:0]               status_out[0:layers-1],''')
    if bidirection_mode == 0:
        pass
    else :
        md_list.append('    input [pipestage-1:0]                 dirc_sel,//1:left->right; 0:right->left')
    md_list.append('''    input [pipestage-1:0]                 mode_sel//0:according to tag; 1:according to value
);''')
    md = ''
    for md_part in md_list:
        md = md+md_part+'\n'
    return md[:-1]

def variable_declare(som_size_exp,pipestage):
    vd_list = []
    vdi_list = []
    vdo_list = []
    vdr_list = []
    vd_list.append('    localparam pack_width = data_width + tag_width;\n')
    for i in range(som_size_exp):
        for j in range(i+1):
            vd_list.append('    logic [pack_width-1:0]                '+'data_'+str(i)+'_'+str(j)+'_i[0:size_num-1];'+'\n'\
                +'    logic [pack_width-1:0]                '+'data_'+str(i)+'_'+str(j)+'_o[0:size_num-1];')
            vdi_list.append('data_'+str(i)+'_'+str(j)+'_i')
            vdo_list.append('data_'+str(i)+'_'+str(j)+'_o')
            vdr_list.append('data_'+str(i)+'_'+str(j)+'_reg')
            if pipestage[i][j]:
                vd_list.append('    logic [pack_width-1:0]                '+'data_'+str(i)+'_'+str(j)+'_reg'+'[0:size_num-1];')
    vd_list.append('\n    integer i,j;')
    vd = ''
    for vd_part in vd_list:
        vd = vd+vd_part+'\n'
    print(vdi_list)
    print(vdo_list)
    return vd[:-1],vdi_list,vdo_list,vdr_list

#--------------------------inout index settle--------------------------#
def inout_id(som_size_num,layer_i,layer_j,pipestage_cnt):
    msel_id = pipestage_cnt-1
    shuffle_act = 0 #0:butterfly connection; 1:shuffle connection
    if layer_i == layer_j:
        if 2**(layer_j+1) == som_size_num:
            group_size = int(1)
        else:
            group_size = int(2**(layer_i+1))
            shuffle_act = 1
    else:
        group_size = int(2**(layer_i-layer_j))
    unit_id_list = np.zeros(int(som_size_num/2),dtype = int)
    in_id_list_a = np.zeros(int(som_size_num/2),dtype = int)
    in_id_list_b = np.zeros(int(som_size_num/2),dtype = int)
    out_id_list_a = np.zeros(int(som_size_num/2),dtype = int)
    out_id_list_b = np.zeros(int(som_size_num/2),dtype = int)
    print(unit_id_list)
    for group_id in range(int((som_size_num/2)/group_size)):
        for unit_id in range(group_size):
            unit_base = group_id*group_size
            unit_id_list[unit_id+unit_base] = unit_id+unit_base
            in_id_list_a[unit_id+unit_base] = (unit_id+unit_base)*2
            in_id_list_b[unit_id+unit_base] = (unit_id+unit_base)*2+1
            if group_size == 1:
                    out_id_list_a[unit_id+unit_base] = unit_id+unit_base*2
                    out_id_list_b[unit_id+unit_base] = unit_id+unit_base*2+1
            else:
                if shuffle_act:
                    if unit_id < int(group_size/2):
                        out_id_list_a[unit_id+unit_base] = unit_id*4+unit_base*2
                        out_id_list_b[unit_id+unit_base] = unit_id*4+unit_base*2+2
                    else:
                        out_id_list_a[unit_id+unit_base] = (unit_id-int(group_size/2))*4+unit_base*2+1
                        out_id_list_b[unit_id+unit_base] = (unit_id-int(group_size/2))*4+unit_base*2+3
                else:
                    if unit_id < int(group_size/2):
                        out_id_list_a[unit_id+unit_base] = unit_id*2+unit_base*2
                        out_id_list_b[unit_id+unit_base] = unit_id*2+unit_base*2+group_size
                    else:
                        out_id_list_a[unit_id+unit_base] = unit_id*2+unit_base*2-group_size+1
                        out_id_list_b[unit_id+unit_base] = unit_id*2+unit_base*2+1
    print(unit_id_list)
    return unit_id_list,msel_id,in_id_list_a,in_id_list_b,out_id_list_a,out_id_list_b

def id_settle(som_size_num,in_id_list_a,in_id_list_b,out_id_list_a,out_id_list_b,in_id_list_a_ir,in_id_list_b_ir):
    id_pairs = np.zeros((som_size_num,3),dtype = int)
    for i in range(int(som_size_num/2)):
        id_pairs[2*i][0] = in_id_list_a[i]
        id_pairs[2*i+1][0] = in_id_list_b[i]
        id_pairs[2*i][1] = out_id_list_a[i]
        id_pairs[2*i+1][1] = out_id_list_b[i]
    id_pairs = id_pairs[np.argsort(id_pairs[:,1])]
    for i in range(int(som_size_num/2)):
        id_pairs[2*i][2] = in_id_list_a_ir[i]
        id_pairs[2*i+1][2] = in_id_list_b_ir[i]
    return id_pairs

#--------------------------layer_unit_block_generate--------------------------#
def layer_comment(layer_i,layer_j):
    lc = '    //***************************layer_'+str(layer_i)+'_'+str(layer_j)+'*******************************//'
    return lc

def unit_inst(layer_i,layer_j,layer_id_flat,unit_id,msel_id,port_in_a,port_in_b,port_out_a,port_out_b):
    layer_id_a = '_'+str(layer_i)+'_'+str(layer_j)          #the layer idx with '_'
    unit_id_a = '_'+str(unit_id)        #the unit idx with '_'
    unit_id_b = '['+str(unit_id)+']'    #the unit idx with '[]'
    unit_ctrl_id = '['+str(layer_id_flat)+']'+unit_id_b
    unit_int_tmp = int(unit_id/(2**layer_i))
    if unit_int_tmp%2 == 0:
        uinst = '    sw_unit_u2d #(data_width,tag_width) sw_unit'+layer_id_a+unit_id_a+\
            '(mode_sel['+str(msel_id)+'],ctrl_in'+unit_ctrl_id+','+port_in_a+','+port_in_b+','+port_out_a+\
            ','+str(port_out_b)+',status_out'+str(unit_ctrl_id)+');'
    else:
        uinst = '    sw_unit_d2u #(data_width,tag_width) sw_unit'+layer_id_a+unit_id_a+\
            '(mode_sel['+str(msel_id)+'],ctrl_in'+unit_ctrl_id+','+port_in_a+','+port_in_b+','+port_out_a+\
            ','+str(port_out_b)+',status_out'+str(unit_ctrl_id)+');'
    return uinst

def layer_unitblk(layer_i,layer_j,layer_id_flat,vdi_list,vdo_list,unit_id_list,msel_id,
    in_id_list_a,in_id_list_b):
    sn_in,sn_out = vdi_list[layer_id_flat],vdo_list[layer_id_flat]
    lu_list = []
    lu_list.append(layer_comment(layer_i,layer_j))
    for unit_id in unit_id_list:
        port_in_a = sn_in+'['+str(in_id_list_a[unit_id])+']'
        port_in_b = sn_in+'['+str(in_id_list_b[unit_id])+']'
        port_out_a = sn_out+'['+str(in_id_list_a[unit_id])+']'
        port_out_b = sn_out+'['+str(in_id_list_b[unit_id])+']'
        lu_list.append(unit_inst(layer_i,layer_j,layer_id_flat,unit_id,msel_id,
            port_in_a,port_in_b,port_out_a,port_out_b))
    lu = ''
    for lu_part in lu_list:
        lu = lu+lu_part+'\n'
    return lu

#--------------------------layer_connection_generate--------------------------#
def connection_comment(layer_i,layer_j):
    cc = '    //***************************connection_'+str(layer_i)+'_'+str(layer_j)+'*******************************//'
    return cc

def assign_blk(som_size_num,som_size_layer,bidirection_mode,pipestage_flat,layer_id_flat,msel_id,id_pairs,vdi_list,vdo_list,vdr_list):
    asb_list = []
    if pipestage_flat[layer_id_flat]:
        sn_out_l2r = vdr_list[layer_id_flat]
    else:
        sn_out_l2r = vdo_list[layer_id_flat-1]
    if layer_id_flat == (som_size_layer-1):
        sn_out_r2l = 'data_out_reg'
    elif pipestage_flat[layer_id_flat+1]:
        sn_out_r2l = vdr_list[layer_id_flat+1]
    else:
        sn_out_r2l = vdo_list[layer_id_flat+1]
    sn_in = vdi_list[layer_id_flat]
    if bidirection_mode == 0:
        for i in range(som_size_num):
            asb_list.append('    assign '+sn_in+'['+str(id_pairs[i][1])+'] = '+sn_out_l2r+'['+str(id_pairs[i][0])+'];')
    elif bidirection_mode == 1:
        for i in range(som_size_num):
            asb_list.append('    assign '+sn_in+'['+str(id_pairs[i][1])+'] = dirc_sel['+str(msel_id)+'] ? '+sn_out_r2l+'['+str(id_pairs[i][2])+'] : '
            +sn_out_l2r+'['+str(id_pairs[i][0])+'];')
    else :
        for i in range(som_size_num):
            asb_list.append('    assign '+sn_in+'['+str(id_pairs[i][1])+'] = '+sn_out_r2l+'['+str(id_pairs[i][2])+'];')
    asb = ''
    for asb_part in asb_list:
        asb = asb+asb_part+'\n'
    return asb

def always_blk(som_size_exp,layer_i,layer_j,layer_id_flat,vdo_list,vdr_list):
    alb = ''
    if layer_j == (som_size_exp-1): 
        sn_reg = 'data_out_reg'
    else:
        sn_reg = vdr_list[layer_id_flat]
    if layer_i == 0 and layer_j == 0:
        sn_wire = 'data_in'
    else:
        sn_wire = vdo_list[layer_id_flat]
    alb = '    always_ff @(posedge clk_i or posedge rst_i) begin\n'+\
        '        if(rst_i)begin'+'\n'+'            for (i=0; i<size_num; i=i+1)begin\n'+\
        '                '+sn_reg+'[i] <= {pack_width{1\'b0}};\n'+\
        '            end\n'+'        end else begin\n'+'            for (i=0; i<size_num; i=i+1)begin\n'+\
        '                '+sn_reg+'[i] <= '+sn_wire+'[i];\n'+'            end\n'+\
        '        end\n    end\n'
    return alb

def connection_blk(som_size_num,som_size_exp,som_size_layer,layer_i,layer_j,layer_id_flat,bidirection_mode,pipestage,pipestage_flat,
    msel_id,id_pairs,vdi_list,vdo_list,vdr_list):
    cb_list = []
    cb_list.append(connection_comment(layer_i,layer_j))
    if pipestage[layer_i][layer_j] or layer_j == (som_size_exp-1):
        cb_list.append(always_blk(som_size_exp,layer_i,layer_j,layer_id_flat,vdo_list,vdr_list))
    cb_list.append(assign_blk(som_size_num,som_size_layer,bidirection_mode,pipestage_flat,layer_id_flat,msel_id,id_pairs,vdi_list,vdo_list,vdr_list))
    cb = ''
    for cb_part in cb_list:
        cb = cb + cb_part + '\n'
    return cb


                  

                    


            



            


    




    