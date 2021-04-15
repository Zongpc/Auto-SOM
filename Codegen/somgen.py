import numpy as np
import blkgen as bg

#----size----
som_size_num = 32
som_size_exp = int(np.log2(som_size_num))
som_size_layer = int((som_size_exp+1)*(som_size_exp)/2)
data_width = 8

#----property----
pipe_interval = som_size_layer #the interval of each pipestage 
pipestage_flat = np.zeros(som_size_layer,dtype = int)
pipestage = np.zeros((som_size_exp,som_size_exp),dtype = int)
pipestage_nums = 0
for i in range(0,som_size_layer,pipe_interval):
    pipestage_flat[i] = 1 #default mode is uniform
    pipestage_nums = pipestage_nums + 1
i_sum = 0
for i in range(som_size_exp):
    i_sum = i_sum + i
    for j in range(i+1):
        pipestage[i][j] = pipestage_flat[i_sum+j] #transform the flatten pipestage description to shrinking matrix

bidirection_mode = 0 # 0:one directon(default) left->right;
                     # 1:two directions
                     # 2:one directon(default) right->left;

#----generate the main verilog file----
if bidirection_mode == 0:
    filename = 'som'+str(som_size_num)+'_'+str(pipestage_nums)+'p'+'.sv'
elif bidirection_mode == 1:
    filename = 'som'+str(som_size_num)+'_'+str(pipestage_nums)+'p'+'_'+str(bidirection_mode)+'b'+'.sv'
else :
    filename = 'som'+str(som_size_num)+'_'+str(pipestage_nums)+'p'+'_'+str(bidirection_mode)+'b'+'.sv'

f = open(filename,'w')
hn = bg.headnotes(filename)
md = bg.module_declare(som_size_num,som_size_layer,pipestage_nums,data_width,bidirection_mode,filename)
vd,vdi_list,vdo_list,vdr_list = bg.variable_declare(som_size_exp,pipestage)
f.write(hn)
f.write('\n')
f.write(md)
f.write('\n')
f.write(vd)
f.write('\n')
i_sum = 0
pipestage_cnt = 0
id_pairs = np.zeros((som_size_num,2),dtype = int)
cb_list = []
unit_id_list = np.zeros(int(som_size_num/2),dtype = int)
unit_id_list_ir = np.zeros(int(som_size_num/2),dtype = int)
in_id_list_a = np.zeros(int(som_size_num/2),dtype = int)
in_id_list_b = np.zeros(int(som_size_num/2),dtype = int)
out_id_list_a = np.zeros(int(som_size_num/2),dtype = int)
out_id_list_b = np.zeros(int(som_size_num/2),dtype = int)
in_id_list_a_ir = np.zeros(int(som_size_num/2),dtype = int)
in_id_list_b_ir = np.zeros(int(som_size_num/2),dtype = int)
out_id_list_a_ir = np.zeros(int(som_size_num/2),dtype = int)
out_id_list_b_ir = np.zeros(int(som_size_num/2),dtype = int)
for i in range(som_size_exp):
    i_sum = i_sum + i
    for j in range(i+1):
        layer_id_flat = i_sum + j
        if j == 0:
            i_sub = i - 1
            j_sub = i - 1
        else:
            i_sub = i
            j_sub = j - 1
        if pipestage[i][j] :
            pipestage_cnt = pipestage_cnt + 1
        if i == 0 or j == (som_size_exp-1):
            msel_id = pipestage_cnt - 1
            for k in range(int(som_size_num/2)):
                unit_id_list[k] = k
                unit_id_list_ir[k] = k
                in_id_list_a[k] = k*2
                in_id_list_b[k] = k*2+1
            out_id_list_a = in_id_list_a
            out_id_list_b = in_id_list_b
            in_id_list_a_ir = in_id_list_a
            in_id_list_b_ir = in_id_list_b
            out_id_list_a_ir = in_id_list_a
            out_id_list_b_ir = in_id_list_b
        else:
            unit_id_list,msel_id,in_id_list_a,in_id_list_b,out_id_list_a,out_id_list_b = bg.inout_id(som_size_num,i_sub,j_sub,pipestage_cnt)
            unit_id_list_ir,msel_id_ir,out_id_list_a_ir,out_id_list_b_ir,in_id_list_a_ir,in_id_list_b_ir = bg.inout_id(som_size_num,i,j,pipestage_cnt)
        id_pairs = bg.id_settle(som_size_num,in_id_list_a,in_id_list_b,out_id_list_a,out_id_list_b,in_id_list_a_ir,in_id_list_b_ir)
        lu = bg.layer_unitblk(i,j,layer_id_flat,vdi_list,vdo_list,unit_id_list,msel_id,in_id_list_a,in_id_list_b)
        cb_list.append(bg.connection_blk(som_size_num,som_size_exp,som_size_layer,i,j,layer_id_flat,bidirection_mode,pipestage,pipestage_flat,msel_id,
            id_pairs,vdi_list,vdo_list,vdr_list))
        f.write(lu)
        f.write('\n')
cb = ''
for cb_part in cb_list:
    cb = cb+cb_part+'\n'
f.write(cb)
f.write('endmodule')
f.close()
