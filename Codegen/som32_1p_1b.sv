// *********************************************************************************
// Project Name : SOM
// Create Time  : 2020/11/08 22:41
// File Name    : som32_1p_1b.sv
// Module Name  : som32_1p_1b
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2020/11/08    Zongpc          1.0                     First Create
// 22:41
// *********************************************************************************
module som32_1p_1b
#(
parameter  size_num   = 32,
parameter  data_width = 8,
parameter  tag_width  = $clog2(size_num),
parameter  layers     = 15,
parameter  pipestage  = 1
)(
    input                                 clk_i,
    input                                 rst_i,

    input [tag_width+data_width-1:0]      data_in[0:size_num-1],
    output logic[data_width-1:0]          data_out_reg[0:size_num-1],
    input [size_num/2-1:0]                ctrl_in[0:layers-1],
    output [size_num/2-1:0]               status_out[0:layers-1],
    input [pipestage-1:0]                 dirc_sel,//1:left->right; 0:right->left
    input [pipestage-1:0]                 mode_sel//0:according to tag; 1:according to value
);
    localparam pack_width = data_width + tag_width;

    logic [pack_width-1:0]                data_0_0_i[0:size_num-1];
    logic [pack_width-1:0]                data_0_0_o[0:size_num-1];
    logic [pack_width-1:0]                data_0_0_reg[0:size_num-1];
    logic [pack_width-1:0]                data_1_0_i[0:size_num-1];
    logic [pack_width-1:0]                data_1_0_o[0:size_num-1];
    logic [pack_width-1:0]                data_1_1_i[0:size_num-1];
    logic [pack_width-1:0]                data_1_1_o[0:size_num-1];
    logic [pack_width-1:0]                data_2_0_i[0:size_num-1];
    logic [pack_width-1:0]                data_2_0_o[0:size_num-1];
    logic [pack_width-1:0]                data_2_1_i[0:size_num-1];
    logic [pack_width-1:0]                data_2_1_o[0:size_num-1];
    logic [pack_width-1:0]                data_2_2_i[0:size_num-1];
    logic [pack_width-1:0]                data_2_2_o[0:size_num-1];
    logic [pack_width-1:0]                data_3_0_i[0:size_num-1];
    logic [pack_width-1:0]                data_3_0_o[0:size_num-1];
    logic [pack_width-1:0]                data_3_1_i[0:size_num-1];
    logic [pack_width-1:0]                data_3_1_o[0:size_num-1];
    logic [pack_width-1:0]                data_3_2_i[0:size_num-1];
    logic [pack_width-1:0]                data_3_2_o[0:size_num-1];
    logic [pack_width-1:0]                data_3_3_i[0:size_num-1];
    logic [pack_width-1:0]                data_3_3_o[0:size_num-1];
    logic [pack_width-1:0]                data_4_0_i[0:size_num-1];
    logic [pack_width-1:0]                data_4_0_o[0:size_num-1];
    logic [pack_width-1:0]                data_4_1_i[0:size_num-1];
    logic [pack_width-1:0]                data_4_1_o[0:size_num-1];
    logic [pack_width-1:0]                data_4_2_i[0:size_num-1];
    logic [pack_width-1:0]                data_4_2_o[0:size_num-1];
    logic [pack_width-1:0]                data_4_3_i[0:size_num-1];
    logic [pack_width-1:0]                data_4_3_o[0:size_num-1];
    logic [pack_width-1:0]                data_4_4_i[0:size_num-1];
    logic [pack_width-1:0]                data_4_4_o[0:size_num-1];

    integer i,j;
    //***************************layer_0_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_0(mode_sel[0],ctrl_in[0][0],data_0_0_i[0],data_0_0_i[1],data_0_0_o[0],data_0_0_o[1],status_out[0][0]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_1(mode_sel[0],ctrl_in[0][1],data_0_0_i[2],data_0_0_i[3],data_0_0_o[2],data_0_0_o[3],status_out[0][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_2(mode_sel[0],ctrl_in[0][2],data_0_0_i[4],data_0_0_i[5],data_0_0_o[4],data_0_0_o[5],status_out[0][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_3(mode_sel[0],ctrl_in[0][3],data_0_0_i[6],data_0_0_i[7],data_0_0_o[6],data_0_0_o[7],status_out[0][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_4(mode_sel[0],ctrl_in[0][4],data_0_0_i[8],data_0_0_i[9],data_0_0_o[8],data_0_0_o[9],status_out[0][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_5(mode_sel[0],ctrl_in[0][5],data_0_0_i[10],data_0_0_i[11],data_0_0_o[10],data_0_0_o[11],status_out[0][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_6(mode_sel[0],ctrl_in[0][6],data_0_0_i[12],data_0_0_i[13],data_0_0_o[12],data_0_0_o[13],status_out[0][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_7(mode_sel[0],ctrl_in[0][7],data_0_0_i[14],data_0_0_i[15],data_0_0_o[14],data_0_0_o[15],status_out[0][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_8(mode_sel[0],ctrl_in[0][8],data_0_0_i[16],data_0_0_i[17],data_0_0_o[16],data_0_0_o[17],status_out[0][8]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_9(mode_sel[0],ctrl_in[0][9],data_0_0_i[18],data_0_0_i[19],data_0_0_o[18],data_0_0_o[19],status_out[0][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_10(mode_sel[0],ctrl_in[0][10],data_0_0_i[20],data_0_0_i[21],data_0_0_o[20],data_0_0_o[21],status_out[0][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_11(mode_sel[0],ctrl_in[0][11],data_0_0_i[22],data_0_0_i[23],data_0_0_o[22],data_0_0_o[23],status_out[0][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_12(mode_sel[0],ctrl_in[0][12],data_0_0_i[24],data_0_0_i[25],data_0_0_o[24],data_0_0_o[25],status_out[0][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_13(mode_sel[0],ctrl_in[0][13],data_0_0_i[26],data_0_0_i[27],data_0_0_o[26],data_0_0_o[27],status_out[0][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_14(mode_sel[0],ctrl_in[0][14],data_0_0_i[28],data_0_0_i[29],data_0_0_o[28],data_0_0_o[29],status_out[0][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_15(mode_sel[0],ctrl_in[0][15],data_0_0_i[30],data_0_0_i[31],data_0_0_o[30],data_0_0_o[31],status_out[0][15]);

    //***************************layer_1_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_0(mode_sel[0],ctrl_in[1][0],data_1_0_i[0],data_1_0_i[1],data_1_0_o[0],data_1_0_o[1],status_out[1][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_1(mode_sel[0],ctrl_in[1][1],data_1_0_i[2],data_1_0_i[3],data_1_0_o[2],data_1_0_o[3],status_out[1][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_2(mode_sel[0],ctrl_in[1][2],data_1_0_i[4],data_1_0_i[5],data_1_0_o[4],data_1_0_o[5],status_out[1][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_3(mode_sel[0],ctrl_in[1][3],data_1_0_i[6],data_1_0_i[7],data_1_0_o[6],data_1_0_o[7],status_out[1][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_4(mode_sel[0],ctrl_in[1][4],data_1_0_i[8],data_1_0_i[9],data_1_0_o[8],data_1_0_o[9],status_out[1][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_5(mode_sel[0],ctrl_in[1][5],data_1_0_i[10],data_1_0_i[11],data_1_0_o[10],data_1_0_o[11],status_out[1][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_6(mode_sel[0],ctrl_in[1][6],data_1_0_i[12],data_1_0_i[13],data_1_0_o[12],data_1_0_o[13],status_out[1][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_7(mode_sel[0],ctrl_in[1][7],data_1_0_i[14],data_1_0_i[15],data_1_0_o[14],data_1_0_o[15],status_out[1][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_8(mode_sel[0],ctrl_in[1][8],data_1_0_i[16],data_1_0_i[17],data_1_0_o[16],data_1_0_o[17],status_out[1][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_9(mode_sel[0],ctrl_in[1][9],data_1_0_i[18],data_1_0_i[19],data_1_0_o[18],data_1_0_o[19],status_out[1][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_10(mode_sel[0],ctrl_in[1][10],data_1_0_i[20],data_1_0_i[21],data_1_0_o[20],data_1_0_o[21],status_out[1][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_11(mode_sel[0],ctrl_in[1][11],data_1_0_i[22],data_1_0_i[23],data_1_0_o[22],data_1_0_o[23],status_out[1][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_12(mode_sel[0],ctrl_in[1][12],data_1_0_i[24],data_1_0_i[25],data_1_0_o[24],data_1_0_o[25],status_out[1][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_13(mode_sel[0],ctrl_in[1][13],data_1_0_i[26],data_1_0_i[27],data_1_0_o[26],data_1_0_o[27],status_out[1][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_14(mode_sel[0],ctrl_in[1][14],data_1_0_i[28],data_1_0_i[29],data_1_0_o[28],data_1_0_o[29],status_out[1][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_15(mode_sel[0],ctrl_in[1][15],data_1_0_i[30],data_1_0_i[31],data_1_0_o[30],data_1_0_o[31],status_out[1][15]);

    //***************************layer_1_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_0(mode_sel[0],ctrl_in[2][0],data_1_1_i[0],data_1_1_i[1],data_1_1_o[0],data_1_1_o[1],status_out[2][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_1(mode_sel[0],ctrl_in[2][1],data_1_1_i[2],data_1_1_i[3],data_1_1_o[2],data_1_1_o[3],status_out[2][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_2(mode_sel[0],ctrl_in[2][2],data_1_1_i[4],data_1_1_i[5],data_1_1_o[4],data_1_1_o[5],status_out[2][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_3(mode_sel[0],ctrl_in[2][3],data_1_1_i[6],data_1_1_i[7],data_1_1_o[6],data_1_1_o[7],status_out[2][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_4(mode_sel[0],ctrl_in[2][4],data_1_1_i[8],data_1_1_i[9],data_1_1_o[8],data_1_1_o[9],status_out[2][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_5(mode_sel[0],ctrl_in[2][5],data_1_1_i[10],data_1_1_i[11],data_1_1_o[10],data_1_1_o[11],status_out[2][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_6(mode_sel[0],ctrl_in[2][6],data_1_1_i[12],data_1_1_i[13],data_1_1_o[12],data_1_1_o[13],status_out[2][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_7(mode_sel[0],ctrl_in[2][7],data_1_1_i[14],data_1_1_i[15],data_1_1_o[14],data_1_1_o[15],status_out[2][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_8(mode_sel[0],ctrl_in[2][8],data_1_1_i[16],data_1_1_i[17],data_1_1_o[16],data_1_1_o[17],status_out[2][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_9(mode_sel[0],ctrl_in[2][9],data_1_1_i[18],data_1_1_i[19],data_1_1_o[18],data_1_1_o[19],status_out[2][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_10(mode_sel[0],ctrl_in[2][10],data_1_1_i[20],data_1_1_i[21],data_1_1_o[20],data_1_1_o[21],status_out[2][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_11(mode_sel[0],ctrl_in[2][11],data_1_1_i[22],data_1_1_i[23],data_1_1_o[22],data_1_1_o[23],status_out[2][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_12(mode_sel[0],ctrl_in[2][12],data_1_1_i[24],data_1_1_i[25],data_1_1_o[24],data_1_1_o[25],status_out[2][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_13(mode_sel[0],ctrl_in[2][13],data_1_1_i[26],data_1_1_i[27],data_1_1_o[26],data_1_1_o[27],status_out[2][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_14(mode_sel[0],ctrl_in[2][14],data_1_1_i[28],data_1_1_i[29],data_1_1_o[28],data_1_1_o[29],status_out[2][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_15(mode_sel[0],ctrl_in[2][15],data_1_1_i[30],data_1_1_i[31],data_1_1_o[30],data_1_1_o[31],status_out[2][15]);

    //***************************layer_2_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_0(mode_sel[0],ctrl_in[3][0],data_2_0_i[0],data_2_0_i[1],data_2_0_o[0],data_2_0_o[1],status_out[3][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_1(mode_sel[0],ctrl_in[3][1],data_2_0_i[2],data_2_0_i[3],data_2_0_o[2],data_2_0_o[3],status_out[3][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_2(mode_sel[0],ctrl_in[3][2],data_2_0_i[4],data_2_0_i[5],data_2_0_o[4],data_2_0_o[5],status_out[3][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_3(mode_sel[0],ctrl_in[3][3],data_2_0_i[6],data_2_0_i[7],data_2_0_o[6],data_2_0_o[7],status_out[3][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_4(mode_sel[0],ctrl_in[3][4],data_2_0_i[8],data_2_0_i[9],data_2_0_o[8],data_2_0_o[9],status_out[3][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_5(mode_sel[0],ctrl_in[3][5],data_2_0_i[10],data_2_0_i[11],data_2_0_o[10],data_2_0_o[11],status_out[3][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_6(mode_sel[0],ctrl_in[3][6],data_2_0_i[12],data_2_0_i[13],data_2_0_o[12],data_2_0_o[13],status_out[3][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_7(mode_sel[0],ctrl_in[3][7],data_2_0_i[14],data_2_0_i[15],data_2_0_o[14],data_2_0_o[15],status_out[3][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_8(mode_sel[0],ctrl_in[3][8],data_2_0_i[16],data_2_0_i[17],data_2_0_o[16],data_2_0_o[17],status_out[3][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_9(mode_sel[0],ctrl_in[3][9],data_2_0_i[18],data_2_0_i[19],data_2_0_o[18],data_2_0_o[19],status_out[3][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_10(mode_sel[0],ctrl_in[3][10],data_2_0_i[20],data_2_0_i[21],data_2_0_o[20],data_2_0_o[21],status_out[3][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_11(mode_sel[0],ctrl_in[3][11],data_2_0_i[22],data_2_0_i[23],data_2_0_o[22],data_2_0_o[23],status_out[3][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_12(mode_sel[0],ctrl_in[3][12],data_2_0_i[24],data_2_0_i[25],data_2_0_o[24],data_2_0_o[25],status_out[3][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_13(mode_sel[0],ctrl_in[3][13],data_2_0_i[26],data_2_0_i[27],data_2_0_o[26],data_2_0_o[27],status_out[3][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_14(mode_sel[0],ctrl_in[3][14],data_2_0_i[28],data_2_0_i[29],data_2_0_o[28],data_2_0_o[29],status_out[3][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_15(mode_sel[0],ctrl_in[3][15],data_2_0_i[30],data_2_0_i[31],data_2_0_o[30],data_2_0_o[31],status_out[3][15]);

    //***************************layer_2_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_0(mode_sel[0],ctrl_in[4][0],data_2_1_i[0],data_2_1_i[1],data_2_1_o[0],data_2_1_o[1],status_out[4][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_1(mode_sel[0],ctrl_in[4][1],data_2_1_i[2],data_2_1_i[3],data_2_1_o[2],data_2_1_o[3],status_out[4][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_2(mode_sel[0],ctrl_in[4][2],data_2_1_i[4],data_2_1_i[5],data_2_1_o[4],data_2_1_o[5],status_out[4][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_3(mode_sel[0],ctrl_in[4][3],data_2_1_i[6],data_2_1_i[7],data_2_1_o[6],data_2_1_o[7],status_out[4][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_4(mode_sel[0],ctrl_in[4][4],data_2_1_i[8],data_2_1_i[9],data_2_1_o[8],data_2_1_o[9],status_out[4][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_5(mode_sel[0],ctrl_in[4][5],data_2_1_i[10],data_2_1_i[11],data_2_1_o[10],data_2_1_o[11],status_out[4][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_6(mode_sel[0],ctrl_in[4][6],data_2_1_i[12],data_2_1_i[13],data_2_1_o[12],data_2_1_o[13],status_out[4][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_7(mode_sel[0],ctrl_in[4][7],data_2_1_i[14],data_2_1_i[15],data_2_1_o[14],data_2_1_o[15],status_out[4][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_8(mode_sel[0],ctrl_in[4][8],data_2_1_i[16],data_2_1_i[17],data_2_1_o[16],data_2_1_o[17],status_out[4][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_9(mode_sel[0],ctrl_in[4][9],data_2_1_i[18],data_2_1_i[19],data_2_1_o[18],data_2_1_o[19],status_out[4][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_10(mode_sel[0],ctrl_in[4][10],data_2_1_i[20],data_2_1_i[21],data_2_1_o[20],data_2_1_o[21],status_out[4][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_11(mode_sel[0],ctrl_in[4][11],data_2_1_i[22],data_2_1_i[23],data_2_1_o[22],data_2_1_o[23],status_out[4][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_12(mode_sel[0],ctrl_in[4][12],data_2_1_i[24],data_2_1_i[25],data_2_1_o[24],data_2_1_o[25],status_out[4][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_13(mode_sel[0],ctrl_in[4][13],data_2_1_i[26],data_2_1_i[27],data_2_1_o[26],data_2_1_o[27],status_out[4][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_14(mode_sel[0],ctrl_in[4][14],data_2_1_i[28],data_2_1_i[29],data_2_1_o[28],data_2_1_o[29],status_out[4][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_15(mode_sel[0],ctrl_in[4][15],data_2_1_i[30],data_2_1_i[31],data_2_1_o[30],data_2_1_o[31],status_out[4][15]);

    //***************************layer_2_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_0(mode_sel[0],ctrl_in[5][0],data_2_2_i[0],data_2_2_i[1],data_2_2_o[0],data_2_2_o[1],status_out[5][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_1(mode_sel[0],ctrl_in[5][1],data_2_2_i[2],data_2_2_i[3],data_2_2_o[2],data_2_2_o[3],status_out[5][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_2(mode_sel[0],ctrl_in[5][2],data_2_2_i[4],data_2_2_i[5],data_2_2_o[4],data_2_2_o[5],status_out[5][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_3(mode_sel[0],ctrl_in[5][3],data_2_2_i[6],data_2_2_i[7],data_2_2_o[6],data_2_2_o[7],status_out[5][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_4(mode_sel[0],ctrl_in[5][4],data_2_2_i[8],data_2_2_i[9],data_2_2_o[8],data_2_2_o[9],status_out[5][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_5(mode_sel[0],ctrl_in[5][5],data_2_2_i[10],data_2_2_i[11],data_2_2_o[10],data_2_2_o[11],status_out[5][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_6(mode_sel[0],ctrl_in[5][6],data_2_2_i[12],data_2_2_i[13],data_2_2_o[12],data_2_2_o[13],status_out[5][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_7(mode_sel[0],ctrl_in[5][7],data_2_2_i[14],data_2_2_i[15],data_2_2_o[14],data_2_2_o[15],status_out[5][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_8(mode_sel[0],ctrl_in[5][8],data_2_2_i[16],data_2_2_i[17],data_2_2_o[16],data_2_2_o[17],status_out[5][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_9(mode_sel[0],ctrl_in[5][9],data_2_2_i[18],data_2_2_i[19],data_2_2_o[18],data_2_2_o[19],status_out[5][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_10(mode_sel[0],ctrl_in[5][10],data_2_2_i[20],data_2_2_i[21],data_2_2_o[20],data_2_2_o[21],status_out[5][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_11(mode_sel[0],ctrl_in[5][11],data_2_2_i[22],data_2_2_i[23],data_2_2_o[22],data_2_2_o[23],status_out[5][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_12(mode_sel[0],ctrl_in[5][12],data_2_2_i[24],data_2_2_i[25],data_2_2_o[24],data_2_2_o[25],status_out[5][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_13(mode_sel[0],ctrl_in[5][13],data_2_2_i[26],data_2_2_i[27],data_2_2_o[26],data_2_2_o[27],status_out[5][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_14(mode_sel[0],ctrl_in[5][14],data_2_2_i[28],data_2_2_i[29],data_2_2_o[28],data_2_2_o[29],status_out[5][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_15(mode_sel[0],ctrl_in[5][15],data_2_2_i[30],data_2_2_i[31],data_2_2_o[30],data_2_2_o[31],status_out[5][15]);

    //***************************layer_3_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_0(mode_sel[0],ctrl_in[6][0],data_3_0_i[0],data_3_0_i[1],data_3_0_o[0],data_3_0_o[1],status_out[6][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_1(mode_sel[0],ctrl_in[6][1],data_3_0_i[2],data_3_0_i[3],data_3_0_o[2],data_3_0_o[3],status_out[6][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_2(mode_sel[0],ctrl_in[6][2],data_3_0_i[4],data_3_0_i[5],data_3_0_o[4],data_3_0_o[5],status_out[6][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_3(mode_sel[0],ctrl_in[6][3],data_3_0_i[6],data_3_0_i[7],data_3_0_o[6],data_3_0_o[7],status_out[6][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_4(mode_sel[0],ctrl_in[6][4],data_3_0_i[8],data_3_0_i[9],data_3_0_o[8],data_3_0_o[9],status_out[6][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_5(mode_sel[0],ctrl_in[6][5],data_3_0_i[10],data_3_0_i[11],data_3_0_o[10],data_3_0_o[11],status_out[6][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_6(mode_sel[0],ctrl_in[6][6],data_3_0_i[12],data_3_0_i[13],data_3_0_o[12],data_3_0_o[13],status_out[6][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_7(mode_sel[0],ctrl_in[6][7],data_3_0_i[14],data_3_0_i[15],data_3_0_o[14],data_3_0_o[15],status_out[6][7]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_8(mode_sel[0],ctrl_in[6][8],data_3_0_i[16],data_3_0_i[17],data_3_0_o[16],data_3_0_o[17],status_out[6][8]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_9(mode_sel[0],ctrl_in[6][9],data_3_0_i[18],data_3_0_i[19],data_3_0_o[18],data_3_0_o[19],status_out[6][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_10(mode_sel[0],ctrl_in[6][10],data_3_0_i[20],data_3_0_i[21],data_3_0_o[20],data_3_0_o[21],status_out[6][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_11(mode_sel[0],ctrl_in[6][11],data_3_0_i[22],data_3_0_i[23],data_3_0_o[22],data_3_0_o[23],status_out[6][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_12(mode_sel[0],ctrl_in[6][12],data_3_0_i[24],data_3_0_i[25],data_3_0_o[24],data_3_0_o[25],status_out[6][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_13(mode_sel[0],ctrl_in[6][13],data_3_0_i[26],data_3_0_i[27],data_3_0_o[26],data_3_0_o[27],status_out[6][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_14(mode_sel[0],ctrl_in[6][14],data_3_0_i[28],data_3_0_i[29],data_3_0_o[28],data_3_0_o[29],status_out[6][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_0_15(mode_sel[0],ctrl_in[6][15],data_3_0_i[30],data_3_0_i[31],data_3_0_o[30],data_3_0_o[31],status_out[6][15]);

    //***************************layer_3_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_0(mode_sel[0],ctrl_in[7][0],data_3_1_i[0],data_3_1_i[1],data_3_1_o[0],data_3_1_o[1],status_out[7][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_1(mode_sel[0],ctrl_in[7][1],data_3_1_i[2],data_3_1_i[3],data_3_1_o[2],data_3_1_o[3],status_out[7][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_2(mode_sel[0],ctrl_in[7][2],data_3_1_i[4],data_3_1_i[5],data_3_1_o[4],data_3_1_o[5],status_out[7][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_3(mode_sel[0],ctrl_in[7][3],data_3_1_i[6],data_3_1_i[7],data_3_1_o[6],data_3_1_o[7],status_out[7][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_4(mode_sel[0],ctrl_in[7][4],data_3_1_i[8],data_3_1_i[9],data_3_1_o[8],data_3_1_o[9],status_out[7][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_5(mode_sel[0],ctrl_in[7][5],data_3_1_i[10],data_3_1_i[11],data_3_1_o[10],data_3_1_o[11],status_out[7][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_6(mode_sel[0],ctrl_in[7][6],data_3_1_i[12],data_3_1_i[13],data_3_1_o[12],data_3_1_o[13],status_out[7][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_7(mode_sel[0],ctrl_in[7][7],data_3_1_i[14],data_3_1_i[15],data_3_1_o[14],data_3_1_o[15],status_out[7][7]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_8(mode_sel[0],ctrl_in[7][8],data_3_1_i[16],data_3_1_i[17],data_3_1_o[16],data_3_1_o[17],status_out[7][8]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_9(mode_sel[0],ctrl_in[7][9],data_3_1_i[18],data_3_1_i[19],data_3_1_o[18],data_3_1_o[19],status_out[7][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_10(mode_sel[0],ctrl_in[7][10],data_3_1_i[20],data_3_1_i[21],data_3_1_o[20],data_3_1_o[21],status_out[7][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_11(mode_sel[0],ctrl_in[7][11],data_3_1_i[22],data_3_1_i[23],data_3_1_o[22],data_3_1_o[23],status_out[7][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_12(mode_sel[0],ctrl_in[7][12],data_3_1_i[24],data_3_1_i[25],data_3_1_o[24],data_3_1_o[25],status_out[7][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_13(mode_sel[0],ctrl_in[7][13],data_3_1_i[26],data_3_1_i[27],data_3_1_o[26],data_3_1_o[27],status_out[7][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_14(mode_sel[0],ctrl_in[7][14],data_3_1_i[28],data_3_1_i[29],data_3_1_o[28],data_3_1_o[29],status_out[7][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_1_15(mode_sel[0],ctrl_in[7][15],data_3_1_i[30],data_3_1_i[31],data_3_1_o[30],data_3_1_o[31],status_out[7][15]);

    //***************************layer_3_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_0(mode_sel[0],ctrl_in[8][0],data_3_2_i[0],data_3_2_i[1],data_3_2_o[0],data_3_2_o[1],status_out[8][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_1(mode_sel[0],ctrl_in[8][1],data_3_2_i[2],data_3_2_i[3],data_3_2_o[2],data_3_2_o[3],status_out[8][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_2(mode_sel[0],ctrl_in[8][2],data_3_2_i[4],data_3_2_i[5],data_3_2_o[4],data_3_2_o[5],status_out[8][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_3(mode_sel[0],ctrl_in[8][3],data_3_2_i[6],data_3_2_i[7],data_3_2_o[6],data_3_2_o[7],status_out[8][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_4(mode_sel[0],ctrl_in[8][4],data_3_2_i[8],data_3_2_i[9],data_3_2_o[8],data_3_2_o[9],status_out[8][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_5(mode_sel[0],ctrl_in[8][5],data_3_2_i[10],data_3_2_i[11],data_3_2_o[10],data_3_2_o[11],status_out[8][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_6(mode_sel[0],ctrl_in[8][6],data_3_2_i[12],data_3_2_i[13],data_3_2_o[12],data_3_2_o[13],status_out[8][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_7(mode_sel[0],ctrl_in[8][7],data_3_2_i[14],data_3_2_i[15],data_3_2_o[14],data_3_2_o[15],status_out[8][7]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_8(mode_sel[0],ctrl_in[8][8],data_3_2_i[16],data_3_2_i[17],data_3_2_o[16],data_3_2_o[17],status_out[8][8]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_9(mode_sel[0],ctrl_in[8][9],data_3_2_i[18],data_3_2_i[19],data_3_2_o[18],data_3_2_o[19],status_out[8][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_10(mode_sel[0],ctrl_in[8][10],data_3_2_i[20],data_3_2_i[21],data_3_2_o[20],data_3_2_o[21],status_out[8][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_11(mode_sel[0],ctrl_in[8][11],data_3_2_i[22],data_3_2_i[23],data_3_2_o[22],data_3_2_o[23],status_out[8][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_12(mode_sel[0],ctrl_in[8][12],data_3_2_i[24],data_3_2_i[25],data_3_2_o[24],data_3_2_o[25],status_out[8][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_13(mode_sel[0],ctrl_in[8][13],data_3_2_i[26],data_3_2_i[27],data_3_2_o[26],data_3_2_o[27],status_out[8][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_14(mode_sel[0],ctrl_in[8][14],data_3_2_i[28],data_3_2_i[29],data_3_2_o[28],data_3_2_o[29],status_out[8][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_2_15(mode_sel[0],ctrl_in[8][15],data_3_2_i[30],data_3_2_i[31],data_3_2_o[30],data_3_2_o[31],status_out[8][15]);

    //***************************layer_3_3*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_0(mode_sel[0],ctrl_in[9][0],data_3_3_i[0],data_3_3_i[1],data_3_3_o[0],data_3_3_o[1],status_out[9][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_1(mode_sel[0],ctrl_in[9][1],data_3_3_i[2],data_3_3_i[3],data_3_3_o[2],data_3_3_o[3],status_out[9][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_2(mode_sel[0],ctrl_in[9][2],data_3_3_i[4],data_3_3_i[5],data_3_3_o[4],data_3_3_o[5],status_out[9][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_3(mode_sel[0],ctrl_in[9][3],data_3_3_i[6],data_3_3_i[7],data_3_3_o[6],data_3_3_o[7],status_out[9][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_4(mode_sel[0],ctrl_in[9][4],data_3_3_i[8],data_3_3_i[9],data_3_3_o[8],data_3_3_o[9],status_out[9][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_5(mode_sel[0],ctrl_in[9][5],data_3_3_i[10],data_3_3_i[11],data_3_3_o[10],data_3_3_o[11],status_out[9][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_6(mode_sel[0],ctrl_in[9][6],data_3_3_i[12],data_3_3_i[13],data_3_3_o[12],data_3_3_o[13],status_out[9][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_7(mode_sel[0],ctrl_in[9][7],data_3_3_i[14],data_3_3_i[15],data_3_3_o[14],data_3_3_o[15],status_out[9][7]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_8(mode_sel[0],ctrl_in[9][8],data_3_3_i[16],data_3_3_i[17],data_3_3_o[16],data_3_3_o[17],status_out[9][8]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_9(mode_sel[0],ctrl_in[9][9],data_3_3_i[18],data_3_3_i[19],data_3_3_o[18],data_3_3_o[19],status_out[9][9]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_10(mode_sel[0],ctrl_in[9][10],data_3_3_i[20],data_3_3_i[21],data_3_3_o[20],data_3_3_o[21],status_out[9][10]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_11(mode_sel[0],ctrl_in[9][11],data_3_3_i[22],data_3_3_i[23],data_3_3_o[22],data_3_3_o[23],status_out[9][11]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_12(mode_sel[0],ctrl_in[9][12],data_3_3_i[24],data_3_3_i[25],data_3_3_o[24],data_3_3_o[25],status_out[9][12]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_13(mode_sel[0],ctrl_in[9][13],data_3_3_i[26],data_3_3_i[27],data_3_3_o[26],data_3_3_o[27],status_out[9][13]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_14(mode_sel[0],ctrl_in[9][14],data_3_3_i[28],data_3_3_i[29],data_3_3_o[28],data_3_3_o[29],status_out[9][14]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_3_3_15(mode_sel[0],ctrl_in[9][15],data_3_3_i[30],data_3_3_i[31],data_3_3_o[30],data_3_3_o[31],status_out[9][15]);

    //***************************layer_4_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_0(mode_sel[0],ctrl_in[10][0],data_4_0_i[0],data_4_0_i[1],data_4_0_o[0],data_4_0_o[1],status_out[10][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_1(mode_sel[0],ctrl_in[10][1],data_4_0_i[2],data_4_0_i[3],data_4_0_o[2],data_4_0_o[3],status_out[10][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_2(mode_sel[0],ctrl_in[10][2],data_4_0_i[4],data_4_0_i[5],data_4_0_o[4],data_4_0_o[5],status_out[10][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_3(mode_sel[0],ctrl_in[10][3],data_4_0_i[6],data_4_0_i[7],data_4_0_o[6],data_4_0_o[7],status_out[10][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_4(mode_sel[0],ctrl_in[10][4],data_4_0_i[8],data_4_0_i[9],data_4_0_o[8],data_4_0_o[9],status_out[10][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_5(mode_sel[0],ctrl_in[10][5],data_4_0_i[10],data_4_0_i[11],data_4_0_o[10],data_4_0_o[11],status_out[10][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_6(mode_sel[0],ctrl_in[10][6],data_4_0_i[12],data_4_0_i[13],data_4_0_o[12],data_4_0_o[13],status_out[10][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_7(mode_sel[0],ctrl_in[10][7],data_4_0_i[14],data_4_0_i[15],data_4_0_o[14],data_4_0_o[15],status_out[10][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_8(mode_sel[0],ctrl_in[10][8],data_4_0_i[16],data_4_0_i[17],data_4_0_o[16],data_4_0_o[17],status_out[10][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_9(mode_sel[0],ctrl_in[10][9],data_4_0_i[18],data_4_0_i[19],data_4_0_o[18],data_4_0_o[19],status_out[10][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_10(mode_sel[0],ctrl_in[10][10],data_4_0_i[20],data_4_0_i[21],data_4_0_o[20],data_4_0_o[21],status_out[10][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_11(mode_sel[0],ctrl_in[10][11],data_4_0_i[22],data_4_0_i[23],data_4_0_o[22],data_4_0_o[23],status_out[10][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_12(mode_sel[0],ctrl_in[10][12],data_4_0_i[24],data_4_0_i[25],data_4_0_o[24],data_4_0_o[25],status_out[10][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_13(mode_sel[0],ctrl_in[10][13],data_4_0_i[26],data_4_0_i[27],data_4_0_o[26],data_4_0_o[27],status_out[10][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_14(mode_sel[0],ctrl_in[10][14],data_4_0_i[28],data_4_0_i[29],data_4_0_o[28],data_4_0_o[29],status_out[10][14]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_0_15(mode_sel[0],ctrl_in[10][15],data_4_0_i[30],data_4_0_i[31],data_4_0_o[30],data_4_0_o[31],status_out[10][15]);

    //***************************layer_4_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_0(mode_sel[0],ctrl_in[11][0],data_4_1_i[0],data_4_1_i[1],data_4_1_o[0],data_4_1_o[1],status_out[11][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_1(mode_sel[0],ctrl_in[11][1],data_4_1_i[2],data_4_1_i[3],data_4_1_o[2],data_4_1_o[3],status_out[11][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_2(mode_sel[0],ctrl_in[11][2],data_4_1_i[4],data_4_1_i[5],data_4_1_o[4],data_4_1_o[5],status_out[11][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_3(mode_sel[0],ctrl_in[11][3],data_4_1_i[6],data_4_1_i[7],data_4_1_o[6],data_4_1_o[7],status_out[11][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_4(mode_sel[0],ctrl_in[11][4],data_4_1_i[8],data_4_1_i[9],data_4_1_o[8],data_4_1_o[9],status_out[11][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_5(mode_sel[0],ctrl_in[11][5],data_4_1_i[10],data_4_1_i[11],data_4_1_o[10],data_4_1_o[11],status_out[11][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_6(mode_sel[0],ctrl_in[11][6],data_4_1_i[12],data_4_1_i[13],data_4_1_o[12],data_4_1_o[13],status_out[11][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_7(mode_sel[0],ctrl_in[11][7],data_4_1_i[14],data_4_1_i[15],data_4_1_o[14],data_4_1_o[15],status_out[11][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_8(mode_sel[0],ctrl_in[11][8],data_4_1_i[16],data_4_1_i[17],data_4_1_o[16],data_4_1_o[17],status_out[11][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_9(mode_sel[0],ctrl_in[11][9],data_4_1_i[18],data_4_1_i[19],data_4_1_o[18],data_4_1_o[19],status_out[11][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_10(mode_sel[0],ctrl_in[11][10],data_4_1_i[20],data_4_1_i[21],data_4_1_o[20],data_4_1_o[21],status_out[11][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_11(mode_sel[0],ctrl_in[11][11],data_4_1_i[22],data_4_1_i[23],data_4_1_o[22],data_4_1_o[23],status_out[11][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_12(mode_sel[0],ctrl_in[11][12],data_4_1_i[24],data_4_1_i[25],data_4_1_o[24],data_4_1_o[25],status_out[11][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_13(mode_sel[0],ctrl_in[11][13],data_4_1_i[26],data_4_1_i[27],data_4_1_o[26],data_4_1_o[27],status_out[11][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_14(mode_sel[0],ctrl_in[11][14],data_4_1_i[28],data_4_1_i[29],data_4_1_o[28],data_4_1_o[29],status_out[11][14]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_1_15(mode_sel[0],ctrl_in[11][15],data_4_1_i[30],data_4_1_i[31],data_4_1_o[30],data_4_1_o[31],status_out[11][15]);

    //***************************layer_4_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_0(mode_sel[0],ctrl_in[12][0],data_4_2_i[0],data_4_2_i[1],data_4_2_o[0],data_4_2_o[1],status_out[12][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_1(mode_sel[0],ctrl_in[12][1],data_4_2_i[2],data_4_2_i[3],data_4_2_o[2],data_4_2_o[3],status_out[12][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_2(mode_sel[0],ctrl_in[12][2],data_4_2_i[4],data_4_2_i[5],data_4_2_o[4],data_4_2_o[5],status_out[12][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_3(mode_sel[0],ctrl_in[12][3],data_4_2_i[6],data_4_2_i[7],data_4_2_o[6],data_4_2_o[7],status_out[12][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_4(mode_sel[0],ctrl_in[12][4],data_4_2_i[8],data_4_2_i[9],data_4_2_o[8],data_4_2_o[9],status_out[12][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_5(mode_sel[0],ctrl_in[12][5],data_4_2_i[10],data_4_2_i[11],data_4_2_o[10],data_4_2_o[11],status_out[12][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_6(mode_sel[0],ctrl_in[12][6],data_4_2_i[12],data_4_2_i[13],data_4_2_o[12],data_4_2_o[13],status_out[12][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_7(mode_sel[0],ctrl_in[12][7],data_4_2_i[14],data_4_2_i[15],data_4_2_o[14],data_4_2_o[15],status_out[12][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_8(mode_sel[0],ctrl_in[12][8],data_4_2_i[16],data_4_2_i[17],data_4_2_o[16],data_4_2_o[17],status_out[12][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_9(mode_sel[0],ctrl_in[12][9],data_4_2_i[18],data_4_2_i[19],data_4_2_o[18],data_4_2_o[19],status_out[12][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_10(mode_sel[0],ctrl_in[12][10],data_4_2_i[20],data_4_2_i[21],data_4_2_o[20],data_4_2_o[21],status_out[12][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_11(mode_sel[0],ctrl_in[12][11],data_4_2_i[22],data_4_2_i[23],data_4_2_o[22],data_4_2_o[23],status_out[12][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_12(mode_sel[0],ctrl_in[12][12],data_4_2_i[24],data_4_2_i[25],data_4_2_o[24],data_4_2_o[25],status_out[12][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_13(mode_sel[0],ctrl_in[12][13],data_4_2_i[26],data_4_2_i[27],data_4_2_o[26],data_4_2_o[27],status_out[12][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_14(mode_sel[0],ctrl_in[12][14],data_4_2_i[28],data_4_2_i[29],data_4_2_o[28],data_4_2_o[29],status_out[12][14]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_2_15(mode_sel[0],ctrl_in[12][15],data_4_2_i[30],data_4_2_i[31],data_4_2_o[30],data_4_2_o[31],status_out[12][15]);

    //***************************layer_4_3*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_0(mode_sel[0],ctrl_in[13][0],data_4_3_i[0],data_4_3_i[1],data_4_3_o[0],data_4_3_o[1],status_out[13][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_1(mode_sel[0],ctrl_in[13][1],data_4_3_i[2],data_4_3_i[3],data_4_3_o[2],data_4_3_o[3],status_out[13][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_2(mode_sel[0],ctrl_in[13][2],data_4_3_i[4],data_4_3_i[5],data_4_3_o[4],data_4_3_o[5],status_out[13][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_3(mode_sel[0],ctrl_in[13][3],data_4_3_i[6],data_4_3_i[7],data_4_3_o[6],data_4_3_o[7],status_out[13][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_4(mode_sel[0],ctrl_in[13][4],data_4_3_i[8],data_4_3_i[9],data_4_3_o[8],data_4_3_o[9],status_out[13][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_5(mode_sel[0],ctrl_in[13][5],data_4_3_i[10],data_4_3_i[11],data_4_3_o[10],data_4_3_o[11],status_out[13][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_6(mode_sel[0],ctrl_in[13][6],data_4_3_i[12],data_4_3_i[13],data_4_3_o[12],data_4_3_o[13],status_out[13][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_7(mode_sel[0],ctrl_in[13][7],data_4_3_i[14],data_4_3_i[15],data_4_3_o[14],data_4_3_o[15],status_out[13][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_8(mode_sel[0],ctrl_in[13][8],data_4_3_i[16],data_4_3_i[17],data_4_3_o[16],data_4_3_o[17],status_out[13][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_9(mode_sel[0],ctrl_in[13][9],data_4_3_i[18],data_4_3_i[19],data_4_3_o[18],data_4_3_o[19],status_out[13][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_10(mode_sel[0],ctrl_in[13][10],data_4_3_i[20],data_4_3_i[21],data_4_3_o[20],data_4_3_o[21],status_out[13][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_11(mode_sel[0],ctrl_in[13][11],data_4_3_i[22],data_4_3_i[23],data_4_3_o[22],data_4_3_o[23],status_out[13][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_12(mode_sel[0],ctrl_in[13][12],data_4_3_i[24],data_4_3_i[25],data_4_3_o[24],data_4_3_o[25],status_out[13][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_13(mode_sel[0],ctrl_in[13][13],data_4_3_i[26],data_4_3_i[27],data_4_3_o[26],data_4_3_o[27],status_out[13][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_14(mode_sel[0],ctrl_in[13][14],data_4_3_i[28],data_4_3_i[29],data_4_3_o[28],data_4_3_o[29],status_out[13][14]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_3_15(mode_sel[0],ctrl_in[13][15],data_4_3_i[30],data_4_3_i[31],data_4_3_o[30],data_4_3_o[31],status_out[13][15]);

    //***************************layer_4_4*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_0(mode_sel[0],ctrl_in[14][0],data_4_4_i[0],data_4_4_i[1],data_4_4_o[0],data_4_4_o[1],status_out[14][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_1(mode_sel[0],ctrl_in[14][1],data_4_4_i[2],data_4_4_i[3],data_4_4_o[2],data_4_4_o[3],status_out[14][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_2(mode_sel[0],ctrl_in[14][2],data_4_4_i[4],data_4_4_i[5],data_4_4_o[4],data_4_4_o[5],status_out[14][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_3(mode_sel[0],ctrl_in[14][3],data_4_4_i[6],data_4_4_i[7],data_4_4_o[6],data_4_4_o[7],status_out[14][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_4(mode_sel[0],ctrl_in[14][4],data_4_4_i[8],data_4_4_i[9],data_4_4_o[8],data_4_4_o[9],status_out[14][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_5(mode_sel[0],ctrl_in[14][5],data_4_4_i[10],data_4_4_i[11],data_4_4_o[10],data_4_4_o[11],status_out[14][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_6(mode_sel[0],ctrl_in[14][6],data_4_4_i[12],data_4_4_i[13],data_4_4_o[12],data_4_4_o[13],status_out[14][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_7(mode_sel[0],ctrl_in[14][7],data_4_4_i[14],data_4_4_i[15],data_4_4_o[14],data_4_4_o[15],status_out[14][7]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_8(mode_sel[0],ctrl_in[14][8],data_4_4_i[16],data_4_4_i[17],data_4_4_o[16],data_4_4_o[17],status_out[14][8]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_9(mode_sel[0],ctrl_in[14][9],data_4_4_i[18],data_4_4_i[19],data_4_4_o[18],data_4_4_o[19],status_out[14][9]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_10(mode_sel[0],ctrl_in[14][10],data_4_4_i[20],data_4_4_i[21],data_4_4_o[20],data_4_4_o[21],status_out[14][10]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_11(mode_sel[0],ctrl_in[14][11],data_4_4_i[22],data_4_4_i[23],data_4_4_o[22],data_4_4_o[23],status_out[14][11]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_12(mode_sel[0],ctrl_in[14][12],data_4_4_i[24],data_4_4_i[25],data_4_4_o[24],data_4_4_o[25],status_out[14][12]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_13(mode_sel[0],ctrl_in[14][13],data_4_4_i[26],data_4_4_i[27],data_4_4_o[26],data_4_4_o[27],status_out[14][13]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_14(mode_sel[0],ctrl_in[14][14],data_4_4_i[28],data_4_4_i[29],data_4_4_o[28],data_4_4_o[29],status_out[14][14]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_4_4_15(mode_sel[0],ctrl_in[14][15],data_4_4_i[30],data_4_4_i[31],data_4_4_o[30],data_4_4_o[31],status_out[14][15]);

    //***************************connection_0_0*******************************//
    always_ff @(posedge clk_i or posedge rst_i) begin
        if(rst_i)begin
            for (i=0; i<size_num; i=i+1)begin
                data_0_0_reg[i] <= {pack_width{1'b0}};
            end
        end else begin
            for (i=0; i<size_num; i=i+1)begin
                data_0_0_reg[i] <= data_in[i];
            end
        end
    end

    assign data_0_0_i[0] = dirc_sel[0] ? data_1_0_o[0] : data_0_0_reg[0];
    assign data_0_0_i[1] = dirc_sel[0] ? data_1_0_o[1] : data_0_0_reg[1];
    assign data_0_0_i[2] = dirc_sel[0] ? data_1_0_o[2] : data_0_0_reg[2];
    assign data_0_0_i[3] = dirc_sel[0] ? data_1_0_o[3] : data_0_0_reg[3];
    assign data_0_0_i[4] = dirc_sel[0] ? data_1_0_o[4] : data_0_0_reg[4];
    assign data_0_0_i[5] = dirc_sel[0] ? data_1_0_o[5] : data_0_0_reg[5];
    assign data_0_0_i[6] = dirc_sel[0] ? data_1_0_o[6] : data_0_0_reg[6];
    assign data_0_0_i[7] = dirc_sel[0] ? data_1_0_o[7] : data_0_0_reg[7];
    assign data_0_0_i[8] = dirc_sel[0] ? data_1_0_o[8] : data_0_0_reg[8];
    assign data_0_0_i[9] = dirc_sel[0] ? data_1_0_o[9] : data_0_0_reg[9];
    assign data_0_0_i[10] = dirc_sel[0] ? data_1_0_o[10] : data_0_0_reg[10];
    assign data_0_0_i[11] = dirc_sel[0] ? data_1_0_o[11] : data_0_0_reg[11];
    assign data_0_0_i[12] = dirc_sel[0] ? data_1_0_o[12] : data_0_0_reg[12];
    assign data_0_0_i[13] = dirc_sel[0] ? data_1_0_o[13] : data_0_0_reg[13];
    assign data_0_0_i[14] = dirc_sel[0] ? data_1_0_o[14] : data_0_0_reg[14];
    assign data_0_0_i[15] = dirc_sel[0] ? data_1_0_o[15] : data_0_0_reg[15];
    assign data_0_0_i[16] = dirc_sel[0] ? data_1_0_o[16] : data_0_0_reg[16];
    assign data_0_0_i[17] = dirc_sel[0] ? data_1_0_o[17] : data_0_0_reg[17];
    assign data_0_0_i[18] = dirc_sel[0] ? data_1_0_o[18] : data_0_0_reg[18];
    assign data_0_0_i[19] = dirc_sel[0] ? data_1_0_o[19] : data_0_0_reg[19];
    assign data_0_0_i[20] = dirc_sel[0] ? data_1_0_o[20] : data_0_0_reg[20];
    assign data_0_0_i[21] = dirc_sel[0] ? data_1_0_o[21] : data_0_0_reg[21];
    assign data_0_0_i[22] = dirc_sel[0] ? data_1_0_o[22] : data_0_0_reg[22];
    assign data_0_0_i[23] = dirc_sel[0] ? data_1_0_o[23] : data_0_0_reg[23];
    assign data_0_0_i[24] = dirc_sel[0] ? data_1_0_o[24] : data_0_0_reg[24];
    assign data_0_0_i[25] = dirc_sel[0] ? data_1_0_o[25] : data_0_0_reg[25];
    assign data_0_0_i[26] = dirc_sel[0] ? data_1_0_o[26] : data_0_0_reg[26];
    assign data_0_0_i[27] = dirc_sel[0] ? data_1_0_o[27] : data_0_0_reg[27];
    assign data_0_0_i[28] = dirc_sel[0] ? data_1_0_o[28] : data_0_0_reg[28];
    assign data_0_0_i[29] = dirc_sel[0] ? data_1_0_o[29] : data_0_0_reg[29];
    assign data_0_0_i[30] = dirc_sel[0] ? data_1_0_o[30] : data_0_0_reg[30];
    assign data_0_0_i[31] = dirc_sel[0] ? data_1_0_o[31] : data_0_0_reg[31];


    //***************************connection_1_0*******************************//
    assign data_1_0_i[0] = dirc_sel[0] ? data_1_1_o[0] : data_0_0_o[0];
    assign data_1_0_i[1] = dirc_sel[0] ? data_1_1_o[2] : data_0_0_o[2];
    assign data_1_0_i[2] = dirc_sel[0] ? data_1_1_o[1] : data_0_0_o[1];
    assign data_1_0_i[3] = dirc_sel[0] ? data_1_1_o[3] : data_0_0_o[3];
    assign data_1_0_i[4] = dirc_sel[0] ? data_1_1_o[4] : data_0_0_o[4];
    assign data_1_0_i[5] = dirc_sel[0] ? data_1_1_o[6] : data_0_0_o[6];
    assign data_1_0_i[6] = dirc_sel[0] ? data_1_1_o[5] : data_0_0_o[5];
    assign data_1_0_i[7] = dirc_sel[0] ? data_1_1_o[7] : data_0_0_o[7];
    assign data_1_0_i[8] = dirc_sel[0] ? data_1_1_o[8] : data_0_0_o[8];
    assign data_1_0_i[9] = dirc_sel[0] ? data_1_1_o[10] : data_0_0_o[10];
    assign data_1_0_i[10] = dirc_sel[0] ? data_1_1_o[9] : data_0_0_o[9];
    assign data_1_0_i[11] = dirc_sel[0] ? data_1_1_o[11] : data_0_0_o[11];
    assign data_1_0_i[12] = dirc_sel[0] ? data_1_1_o[12] : data_0_0_o[12];
    assign data_1_0_i[13] = dirc_sel[0] ? data_1_1_o[14] : data_0_0_o[14];
    assign data_1_0_i[14] = dirc_sel[0] ? data_1_1_o[13] : data_0_0_o[13];
    assign data_1_0_i[15] = dirc_sel[0] ? data_1_1_o[15] : data_0_0_o[15];
    assign data_1_0_i[16] = dirc_sel[0] ? data_1_1_o[16] : data_0_0_o[16];
    assign data_1_0_i[17] = dirc_sel[0] ? data_1_1_o[18] : data_0_0_o[18];
    assign data_1_0_i[18] = dirc_sel[0] ? data_1_1_o[17] : data_0_0_o[17];
    assign data_1_0_i[19] = dirc_sel[0] ? data_1_1_o[19] : data_0_0_o[19];
    assign data_1_0_i[20] = dirc_sel[0] ? data_1_1_o[20] : data_0_0_o[20];
    assign data_1_0_i[21] = dirc_sel[0] ? data_1_1_o[22] : data_0_0_o[22];
    assign data_1_0_i[22] = dirc_sel[0] ? data_1_1_o[21] : data_0_0_o[21];
    assign data_1_0_i[23] = dirc_sel[0] ? data_1_1_o[23] : data_0_0_o[23];
    assign data_1_0_i[24] = dirc_sel[0] ? data_1_1_o[24] : data_0_0_o[24];
    assign data_1_0_i[25] = dirc_sel[0] ? data_1_1_o[26] : data_0_0_o[26];
    assign data_1_0_i[26] = dirc_sel[0] ? data_1_1_o[25] : data_0_0_o[25];
    assign data_1_0_i[27] = dirc_sel[0] ? data_1_1_o[27] : data_0_0_o[27];
    assign data_1_0_i[28] = dirc_sel[0] ? data_1_1_o[28] : data_0_0_o[28];
    assign data_1_0_i[29] = dirc_sel[0] ? data_1_1_o[30] : data_0_0_o[30];
    assign data_1_0_i[30] = dirc_sel[0] ? data_1_1_o[29] : data_0_0_o[29];
    assign data_1_0_i[31] = dirc_sel[0] ? data_1_1_o[31] : data_0_0_o[31];


    //***************************connection_1_1*******************************//
    assign data_1_1_i[0] = dirc_sel[0] ? data_2_0_o[0] : data_1_0_o[0];
    assign data_1_1_i[1] = dirc_sel[0] ? data_2_0_o[2] : data_1_0_o[2];
    assign data_1_1_i[2] = dirc_sel[0] ? data_2_0_o[4] : data_1_0_o[1];
    assign data_1_1_i[3] = dirc_sel[0] ? data_2_0_o[6] : data_1_0_o[3];
    assign data_1_1_i[4] = dirc_sel[0] ? data_2_0_o[1] : data_1_0_o[4];
    assign data_1_1_i[5] = dirc_sel[0] ? data_2_0_o[3] : data_1_0_o[6];
    assign data_1_1_i[6] = dirc_sel[0] ? data_2_0_o[5] : data_1_0_o[5];
    assign data_1_1_i[7] = dirc_sel[0] ? data_2_0_o[7] : data_1_0_o[7];
    assign data_1_1_i[8] = dirc_sel[0] ? data_2_0_o[8] : data_1_0_o[8];
    assign data_1_1_i[9] = dirc_sel[0] ? data_2_0_o[10] : data_1_0_o[10];
    assign data_1_1_i[10] = dirc_sel[0] ? data_2_0_o[12] : data_1_0_o[9];
    assign data_1_1_i[11] = dirc_sel[0] ? data_2_0_o[14] : data_1_0_o[11];
    assign data_1_1_i[12] = dirc_sel[0] ? data_2_0_o[9] : data_1_0_o[12];
    assign data_1_1_i[13] = dirc_sel[0] ? data_2_0_o[11] : data_1_0_o[14];
    assign data_1_1_i[14] = dirc_sel[0] ? data_2_0_o[13] : data_1_0_o[13];
    assign data_1_1_i[15] = dirc_sel[0] ? data_2_0_o[15] : data_1_0_o[15];
    assign data_1_1_i[16] = dirc_sel[0] ? data_2_0_o[16] : data_1_0_o[16];
    assign data_1_1_i[17] = dirc_sel[0] ? data_2_0_o[18] : data_1_0_o[18];
    assign data_1_1_i[18] = dirc_sel[0] ? data_2_0_o[20] : data_1_0_o[17];
    assign data_1_1_i[19] = dirc_sel[0] ? data_2_0_o[22] : data_1_0_o[19];
    assign data_1_1_i[20] = dirc_sel[0] ? data_2_0_o[17] : data_1_0_o[20];
    assign data_1_1_i[21] = dirc_sel[0] ? data_2_0_o[19] : data_1_0_o[22];
    assign data_1_1_i[22] = dirc_sel[0] ? data_2_0_o[21] : data_1_0_o[21];
    assign data_1_1_i[23] = dirc_sel[0] ? data_2_0_o[23] : data_1_0_o[23];
    assign data_1_1_i[24] = dirc_sel[0] ? data_2_0_o[24] : data_1_0_o[24];
    assign data_1_1_i[25] = dirc_sel[0] ? data_2_0_o[26] : data_1_0_o[26];
    assign data_1_1_i[26] = dirc_sel[0] ? data_2_0_o[28] : data_1_0_o[25];
    assign data_1_1_i[27] = dirc_sel[0] ? data_2_0_o[30] : data_1_0_o[27];
    assign data_1_1_i[28] = dirc_sel[0] ? data_2_0_o[25] : data_1_0_o[28];
    assign data_1_1_i[29] = dirc_sel[0] ? data_2_0_o[27] : data_1_0_o[30];
    assign data_1_1_i[30] = dirc_sel[0] ? data_2_0_o[29] : data_1_0_o[29];
    assign data_1_1_i[31] = dirc_sel[0] ? data_2_0_o[31] : data_1_0_o[31];


    //***************************connection_2_0*******************************//
    assign data_2_0_i[0] = dirc_sel[0] ? data_2_1_o[0] : data_1_1_o[0];
    assign data_2_0_i[1] = dirc_sel[0] ? data_2_1_o[4] : data_1_1_o[4];
    assign data_2_0_i[2] = dirc_sel[0] ? data_2_1_o[2] : data_1_1_o[1];
    assign data_2_0_i[3] = dirc_sel[0] ? data_2_1_o[6] : data_1_1_o[5];
    assign data_2_0_i[4] = dirc_sel[0] ? data_2_1_o[1] : data_1_1_o[2];
    assign data_2_0_i[5] = dirc_sel[0] ? data_2_1_o[5] : data_1_1_o[6];
    assign data_2_0_i[6] = dirc_sel[0] ? data_2_1_o[3] : data_1_1_o[3];
    assign data_2_0_i[7] = dirc_sel[0] ? data_2_1_o[7] : data_1_1_o[7];
    assign data_2_0_i[8] = dirc_sel[0] ? data_2_1_o[8] : data_1_1_o[8];
    assign data_2_0_i[9] = dirc_sel[0] ? data_2_1_o[12] : data_1_1_o[12];
    assign data_2_0_i[10] = dirc_sel[0] ? data_2_1_o[10] : data_1_1_o[9];
    assign data_2_0_i[11] = dirc_sel[0] ? data_2_1_o[14] : data_1_1_o[13];
    assign data_2_0_i[12] = dirc_sel[0] ? data_2_1_o[9] : data_1_1_o[10];
    assign data_2_0_i[13] = dirc_sel[0] ? data_2_1_o[13] : data_1_1_o[14];
    assign data_2_0_i[14] = dirc_sel[0] ? data_2_1_o[11] : data_1_1_o[11];
    assign data_2_0_i[15] = dirc_sel[0] ? data_2_1_o[15] : data_1_1_o[15];
    assign data_2_0_i[16] = dirc_sel[0] ? data_2_1_o[16] : data_1_1_o[16];
    assign data_2_0_i[17] = dirc_sel[0] ? data_2_1_o[20] : data_1_1_o[20];
    assign data_2_0_i[18] = dirc_sel[0] ? data_2_1_o[18] : data_1_1_o[17];
    assign data_2_0_i[19] = dirc_sel[0] ? data_2_1_o[22] : data_1_1_o[21];
    assign data_2_0_i[20] = dirc_sel[0] ? data_2_1_o[17] : data_1_1_o[18];
    assign data_2_0_i[21] = dirc_sel[0] ? data_2_1_o[21] : data_1_1_o[22];
    assign data_2_0_i[22] = dirc_sel[0] ? data_2_1_o[19] : data_1_1_o[19];
    assign data_2_0_i[23] = dirc_sel[0] ? data_2_1_o[23] : data_1_1_o[23];
    assign data_2_0_i[24] = dirc_sel[0] ? data_2_1_o[24] : data_1_1_o[24];
    assign data_2_0_i[25] = dirc_sel[0] ? data_2_1_o[28] : data_1_1_o[28];
    assign data_2_0_i[26] = dirc_sel[0] ? data_2_1_o[26] : data_1_1_o[25];
    assign data_2_0_i[27] = dirc_sel[0] ? data_2_1_o[30] : data_1_1_o[29];
    assign data_2_0_i[28] = dirc_sel[0] ? data_2_1_o[25] : data_1_1_o[26];
    assign data_2_0_i[29] = dirc_sel[0] ? data_2_1_o[29] : data_1_1_o[30];
    assign data_2_0_i[30] = dirc_sel[0] ? data_2_1_o[27] : data_1_1_o[27];
    assign data_2_0_i[31] = dirc_sel[0] ? data_2_1_o[31] : data_1_1_o[31];


    //***************************connection_2_1*******************************//
    assign data_2_1_i[0] = dirc_sel[0] ? data_2_2_o[0] : data_2_0_o[0];
    assign data_2_1_i[1] = dirc_sel[0] ? data_2_2_o[2] : data_2_0_o[4];
    assign data_2_1_i[2] = dirc_sel[0] ? data_2_2_o[1] : data_2_0_o[2];
    assign data_2_1_i[3] = dirc_sel[0] ? data_2_2_o[3] : data_2_0_o[6];
    assign data_2_1_i[4] = dirc_sel[0] ? data_2_2_o[4] : data_2_0_o[1];
    assign data_2_1_i[5] = dirc_sel[0] ? data_2_2_o[6] : data_2_0_o[5];
    assign data_2_1_i[6] = dirc_sel[0] ? data_2_2_o[5] : data_2_0_o[3];
    assign data_2_1_i[7] = dirc_sel[0] ? data_2_2_o[7] : data_2_0_o[7];
    assign data_2_1_i[8] = dirc_sel[0] ? data_2_2_o[8] : data_2_0_o[8];
    assign data_2_1_i[9] = dirc_sel[0] ? data_2_2_o[10] : data_2_0_o[12];
    assign data_2_1_i[10] = dirc_sel[0] ? data_2_2_o[9] : data_2_0_o[10];
    assign data_2_1_i[11] = dirc_sel[0] ? data_2_2_o[11] : data_2_0_o[14];
    assign data_2_1_i[12] = dirc_sel[0] ? data_2_2_o[12] : data_2_0_o[9];
    assign data_2_1_i[13] = dirc_sel[0] ? data_2_2_o[14] : data_2_0_o[13];
    assign data_2_1_i[14] = dirc_sel[0] ? data_2_2_o[13] : data_2_0_o[11];
    assign data_2_1_i[15] = dirc_sel[0] ? data_2_2_o[15] : data_2_0_o[15];
    assign data_2_1_i[16] = dirc_sel[0] ? data_2_2_o[16] : data_2_0_o[16];
    assign data_2_1_i[17] = dirc_sel[0] ? data_2_2_o[18] : data_2_0_o[20];
    assign data_2_1_i[18] = dirc_sel[0] ? data_2_2_o[17] : data_2_0_o[18];
    assign data_2_1_i[19] = dirc_sel[0] ? data_2_2_o[19] : data_2_0_o[22];
    assign data_2_1_i[20] = dirc_sel[0] ? data_2_2_o[20] : data_2_0_o[17];
    assign data_2_1_i[21] = dirc_sel[0] ? data_2_2_o[22] : data_2_0_o[21];
    assign data_2_1_i[22] = dirc_sel[0] ? data_2_2_o[21] : data_2_0_o[19];
    assign data_2_1_i[23] = dirc_sel[0] ? data_2_2_o[23] : data_2_0_o[23];
    assign data_2_1_i[24] = dirc_sel[0] ? data_2_2_o[24] : data_2_0_o[24];
    assign data_2_1_i[25] = dirc_sel[0] ? data_2_2_o[26] : data_2_0_o[28];
    assign data_2_1_i[26] = dirc_sel[0] ? data_2_2_o[25] : data_2_0_o[26];
    assign data_2_1_i[27] = dirc_sel[0] ? data_2_2_o[27] : data_2_0_o[30];
    assign data_2_1_i[28] = dirc_sel[0] ? data_2_2_o[28] : data_2_0_o[25];
    assign data_2_1_i[29] = dirc_sel[0] ? data_2_2_o[30] : data_2_0_o[29];
    assign data_2_1_i[30] = dirc_sel[0] ? data_2_2_o[29] : data_2_0_o[27];
    assign data_2_1_i[31] = dirc_sel[0] ? data_2_2_o[31] : data_2_0_o[31];


    //***************************connection_2_2*******************************//
    assign data_2_2_i[0] = dirc_sel[0] ? data_3_0_o[0] : data_2_1_o[0];
    assign data_2_2_i[1] = dirc_sel[0] ? data_3_0_o[2] : data_2_1_o[2];
    assign data_2_2_i[2] = dirc_sel[0] ? data_3_0_o[4] : data_2_1_o[1];
    assign data_2_2_i[3] = dirc_sel[0] ? data_3_0_o[6] : data_2_1_o[3];
    assign data_2_2_i[4] = dirc_sel[0] ? data_3_0_o[8] : data_2_1_o[4];
    assign data_2_2_i[5] = dirc_sel[0] ? data_3_0_o[10] : data_2_1_o[6];
    assign data_2_2_i[6] = dirc_sel[0] ? data_3_0_o[12] : data_2_1_o[5];
    assign data_2_2_i[7] = dirc_sel[0] ? data_3_0_o[14] : data_2_1_o[7];
    assign data_2_2_i[8] = dirc_sel[0] ? data_3_0_o[1] : data_2_1_o[8];
    assign data_2_2_i[9] = dirc_sel[0] ? data_3_0_o[3] : data_2_1_o[10];
    assign data_2_2_i[10] = dirc_sel[0] ? data_3_0_o[5] : data_2_1_o[9];
    assign data_2_2_i[11] = dirc_sel[0] ? data_3_0_o[7] : data_2_1_o[11];
    assign data_2_2_i[12] = dirc_sel[0] ? data_3_0_o[9] : data_2_1_o[12];
    assign data_2_2_i[13] = dirc_sel[0] ? data_3_0_o[11] : data_2_1_o[14];
    assign data_2_2_i[14] = dirc_sel[0] ? data_3_0_o[13] : data_2_1_o[13];
    assign data_2_2_i[15] = dirc_sel[0] ? data_3_0_o[15] : data_2_1_o[15];
    assign data_2_2_i[16] = dirc_sel[0] ? data_3_0_o[16] : data_2_1_o[16];
    assign data_2_2_i[17] = dirc_sel[0] ? data_3_0_o[18] : data_2_1_o[18];
    assign data_2_2_i[18] = dirc_sel[0] ? data_3_0_o[20] : data_2_1_o[17];
    assign data_2_2_i[19] = dirc_sel[0] ? data_3_0_o[22] : data_2_1_o[19];
    assign data_2_2_i[20] = dirc_sel[0] ? data_3_0_o[24] : data_2_1_o[20];
    assign data_2_2_i[21] = dirc_sel[0] ? data_3_0_o[26] : data_2_1_o[22];
    assign data_2_2_i[22] = dirc_sel[0] ? data_3_0_o[28] : data_2_1_o[21];
    assign data_2_2_i[23] = dirc_sel[0] ? data_3_0_o[30] : data_2_1_o[23];
    assign data_2_2_i[24] = dirc_sel[0] ? data_3_0_o[17] : data_2_1_o[24];
    assign data_2_2_i[25] = dirc_sel[0] ? data_3_0_o[19] : data_2_1_o[26];
    assign data_2_2_i[26] = dirc_sel[0] ? data_3_0_o[21] : data_2_1_o[25];
    assign data_2_2_i[27] = dirc_sel[0] ? data_3_0_o[23] : data_2_1_o[27];
    assign data_2_2_i[28] = dirc_sel[0] ? data_3_0_o[25] : data_2_1_o[28];
    assign data_2_2_i[29] = dirc_sel[0] ? data_3_0_o[27] : data_2_1_o[30];
    assign data_2_2_i[30] = dirc_sel[0] ? data_3_0_o[29] : data_2_1_o[29];
    assign data_2_2_i[31] = dirc_sel[0] ? data_3_0_o[31] : data_2_1_o[31];


    //***************************connection_3_0*******************************//
    assign data_3_0_i[0] = dirc_sel[0] ? data_3_1_o[0] : data_2_2_o[0];
    assign data_3_0_i[1] = dirc_sel[0] ? data_3_1_o[8] : data_2_2_o[8];
    assign data_3_0_i[2] = dirc_sel[0] ? data_3_1_o[2] : data_2_2_o[1];
    assign data_3_0_i[3] = dirc_sel[0] ? data_3_1_o[10] : data_2_2_o[9];
    assign data_3_0_i[4] = dirc_sel[0] ? data_3_1_o[4] : data_2_2_o[2];
    assign data_3_0_i[5] = dirc_sel[0] ? data_3_1_o[12] : data_2_2_o[10];
    assign data_3_0_i[6] = dirc_sel[0] ? data_3_1_o[6] : data_2_2_o[3];
    assign data_3_0_i[7] = dirc_sel[0] ? data_3_1_o[14] : data_2_2_o[11];
    assign data_3_0_i[8] = dirc_sel[0] ? data_3_1_o[1] : data_2_2_o[4];
    assign data_3_0_i[9] = dirc_sel[0] ? data_3_1_o[9] : data_2_2_o[12];
    assign data_3_0_i[10] = dirc_sel[0] ? data_3_1_o[3] : data_2_2_o[5];
    assign data_3_0_i[11] = dirc_sel[0] ? data_3_1_o[11] : data_2_2_o[13];
    assign data_3_0_i[12] = dirc_sel[0] ? data_3_1_o[5] : data_2_2_o[6];
    assign data_3_0_i[13] = dirc_sel[0] ? data_3_1_o[13] : data_2_2_o[14];
    assign data_3_0_i[14] = dirc_sel[0] ? data_3_1_o[7] : data_2_2_o[7];
    assign data_3_0_i[15] = dirc_sel[0] ? data_3_1_o[15] : data_2_2_o[15];
    assign data_3_0_i[16] = dirc_sel[0] ? data_3_1_o[16] : data_2_2_o[16];
    assign data_3_0_i[17] = dirc_sel[0] ? data_3_1_o[24] : data_2_2_o[24];
    assign data_3_0_i[18] = dirc_sel[0] ? data_3_1_o[18] : data_2_2_o[17];
    assign data_3_0_i[19] = dirc_sel[0] ? data_3_1_o[26] : data_2_2_o[25];
    assign data_3_0_i[20] = dirc_sel[0] ? data_3_1_o[20] : data_2_2_o[18];
    assign data_3_0_i[21] = dirc_sel[0] ? data_3_1_o[28] : data_2_2_o[26];
    assign data_3_0_i[22] = dirc_sel[0] ? data_3_1_o[22] : data_2_2_o[19];
    assign data_3_0_i[23] = dirc_sel[0] ? data_3_1_o[30] : data_2_2_o[27];
    assign data_3_0_i[24] = dirc_sel[0] ? data_3_1_o[17] : data_2_2_o[20];
    assign data_3_0_i[25] = dirc_sel[0] ? data_3_1_o[25] : data_2_2_o[28];
    assign data_3_0_i[26] = dirc_sel[0] ? data_3_1_o[19] : data_2_2_o[21];
    assign data_3_0_i[27] = dirc_sel[0] ? data_3_1_o[27] : data_2_2_o[29];
    assign data_3_0_i[28] = dirc_sel[0] ? data_3_1_o[21] : data_2_2_o[22];
    assign data_3_0_i[29] = dirc_sel[0] ? data_3_1_o[29] : data_2_2_o[30];
    assign data_3_0_i[30] = dirc_sel[0] ? data_3_1_o[23] : data_2_2_o[23];
    assign data_3_0_i[31] = dirc_sel[0] ? data_3_1_o[31] : data_2_2_o[31];


    //***************************connection_3_1*******************************//
    assign data_3_1_i[0] = dirc_sel[0] ? data_3_2_o[0] : data_3_0_o[0];
    assign data_3_1_i[1] = dirc_sel[0] ? data_3_2_o[4] : data_3_0_o[8];
    assign data_3_1_i[2] = dirc_sel[0] ? data_3_2_o[2] : data_3_0_o[2];
    assign data_3_1_i[3] = dirc_sel[0] ? data_3_2_o[6] : data_3_0_o[10];
    assign data_3_1_i[4] = dirc_sel[0] ? data_3_2_o[1] : data_3_0_o[4];
    assign data_3_1_i[5] = dirc_sel[0] ? data_3_2_o[5] : data_3_0_o[12];
    assign data_3_1_i[6] = dirc_sel[0] ? data_3_2_o[3] : data_3_0_o[6];
    assign data_3_1_i[7] = dirc_sel[0] ? data_3_2_o[7] : data_3_0_o[14];
    assign data_3_1_i[8] = dirc_sel[0] ? data_3_2_o[8] : data_3_0_o[1];
    assign data_3_1_i[9] = dirc_sel[0] ? data_3_2_o[12] : data_3_0_o[9];
    assign data_3_1_i[10] = dirc_sel[0] ? data_3_2_o[10] : data_3_0_o[3];
    assign data_3_1_i[11] = dirc_sel[0] ? data_3_2_o[14] : data_3_0_o[11];
    assign data_3_1_i[12] = dirc_sel[0] ? data_3_2_o[9] : data_3_0_o[5];
    assign data_3_1_i[13] = dirc_sel[0] ? data_3_2_o[13] : data_3_0_o[13];
    assign data_3_1_i[14] = dirc_sel[0] ? data_3_2_o[11] : data_3_0_o[7];
    assign data_3_1_i[15] = dirc_sel[0] ? data_3_2_o[15] : data_3_0_o[15];
    assign data_3_1_i[16] = dirc_sel[0] ? data_3_2_o[16] : data_3_0_o[16];
    assign data_3_1_i[17] = dirc_sel[0] ? data_3_2_o[20] : data_3_0_o[24];
    assign data_3_1_i[18] = dirc_sel[0] ? data_3_2_o[18] : data_3_0_o[18];
    assign data_3_1_i[19] = dirc_sel[0] ? data_3_2_o[22] : data_3_0_o[26];
    assign data_3_1_i[20] = dirc_sel[0] ? data_3_2_o[17] : data_3_0_o[20];
    assign data_3_1_i[21] = dirc_sel[0] ? data_3_2_o[21] : data_3_0_o[28];
    assign data_3_1_i[22] = dirc_sel[0] ? data_3_2_o[19] : data_3_0_o[22];
    assign data_3_1_i[23] = dirc_sel[0] ? data_3_2_o[23] : data_3_0_o[30];
    assign data_3_1_i[24] = dirc_sel[0] ? data_3_2_o[24] : data_3_0_o[17];
    assign data_3_1_i[25] = dirc_sel[0] ? data_3_2_o[28] : data_3_0_o[25];
    assign data_3_1_i[26] = dirc_sel[0] ? data_3_2_o[26] : data_3_0_o[19];
    assign data_3_1_i[27] = dirc_sel[0] ? data_3_2_o[30] : data_3_0_o[27];
    assign data_3_1_i[28] = dirc_sel[0] ? data_3_2_o[25] : data_3_0_o[21];
    assign data_3_1_i[29] = dirc_sel[0] ? data_3_2_o[29] : data_3_0_o[29];
    assign data_3_1_i[30] = dirc_sel[0] ? data_3_2_o[27] : data_3_0_o[23];
    assign data_3_1_i[31] = dirc_sel[0] ? data_3_2_o[31] : data_3_0_o[31];


    //***************************connection_3_2*******************************//
    assign data_3_2_i[0] = dirc_sel[0] ? data_3_3_o[0] : data_3_1_o[0];
    assign data_3_2_i[1] = dirc_sel[0] ? data_3_3_o[2] : data_3_1_o[4];
    assign data_3_2_i[2] = dirc_sel[0] ? data_3_3_o[1] : data_3_1_o[2];
    assign data_3_2_i[3] = dirc_sel[0] ? data_3_3_o[3] : data_3_1_o[6];
    assign data_3_2_i[4] = dirc_sel[0] ? data_3_3_o[4] : data_3_1_o[1];
    assign data_3_2_i[5] = dirc_sel[0] ? data_3_3_o[6] : data_3_1_o[5];
    assign data_3_2_i[6] = dirc_sel[0] ? data_3_3_o[5] : data_3_1_o[3];
    assign data_3_2_i[7] = dirc_sel[0] ? data_3_3_o[7] : data_3_1_o[7];
    assign data_3_2_i[8] = dirc_sel[0] ? data_3_3_o[8] : data_3_1_o[8];
    assign data_3_2_i[9] = dirc_sel[0] ? data_3_3_o[10] : data_3_1_o[12];
    assign data_3_2_i[10] = dirc_sel[0] ? data_3_3_o[9] : data_3_1_o[10];
    assign data_3_2_i[11] = dirc_sel[0] ? data_3_3_o[11] : data_3_1_o[14];
    assign data_3_2_i[12] = dirc_sel[0] ? data_3_3_o[12] : data_3_1_o[9];
    assign data_3_2_i[13] = dirc_sel[0] ? data_3_3_o[14] : data_3_1_o[13];
    assign data_3_2_i[14] = dirc_sel[0] ? data_3_3_o[13] : data_3_1_o[11];
    assign data_3_2_i[15] = dirc_sel[0] ? data_3_3_o[15] : data_3_1_o[15];
    assign data_3_2_i[16] = dirc_sel[0] ? data_3_3_o[16] : data_3_1_o[16];
    assign data_3_2_i[17] = dirc_sel[0] ? data_3_3_o[18] : data_3_1_o[20];
    assign data_3_2_i[18] = dirc_sel[0] ? data_3_3_o[17] : data_3_1_o[18];
    assign data_3_2_i[19] = dirc_sel[0] ? data_3_3_o[19] : data_3_1_o[22];
    assign data_3_2_i[20] = dirc_sel[0] ? data_3_3_o[20] : data_3_1_o[17];
    assign data_3_2_i[21] = dirc_sel[0] ? data_3_3_o[22] : data_3_1_o[21];
    assign data_3_2_i[22] = dirc_sel[0] ? data_3_3_o[21] : data_3_1_o[19];
    assign data_3_2_i[23] = dirc_sel[0] ? data_3_3_o[23] : data_3_1_o[23];
    assign data_3_2_i[24] = dirc_sel[0] ? data_3_3_o[24] : data_3_1_o[24];
    assign data_3_2_i[25] = dirc_sel[0] ? data_3_3_o[26] : data_3_1_o[28];
    assign data_3_2_i[26] = dirc_sel[0] ? data_3_3_o[25] : data_3_1_o[26];
    assign data_3_2_i[27] = dirc_sel[0] ? data_3_3_o[27] : data_3_1_o[30];
    assign data_3_2_i[28] = dirc_sel[0] ? data_3_3_o[28] : data_3_1_o[25];
    assign data_3_2_i[29] = dirc_sel[0] ? data_3_3_o[30] : data_3_1_o[29];
    assign data_3_2_i[30] = dirc_sel[0] ? data_3_3_o[29] : data_3_1_o[27];
    assign data_3_2_i[31] = dirc_sel[0] ? data_3_3_o[31] : data_3_1_o[31];


    //***************************connection_3_3*******************************//
    assign data_3_3_i[0] = dirc_sel[0] ? data_4_0_o[0] : data_3_2_o[0];
    assign data_3_3_i[1] = dirc_sel[0] ? data_4_0_o[2] : data_3_2_o[2];
    assign data_3_3_i[2] = dirc_sel[0] ? data_4_0_o[4] : data_3_2_o[1];
    assign data_3_3_i[3] = dirc_sel[0] ? data_4_0_o[6] : data_3_2_o[3];
    assign data_3_3_i[4] = dirc_sel[0] ? data_4_0_o[8] : data_3_2_o[4];
    assign data_3_3_i[5] = dirc_sel[0] ? data_4_0_o[10] : data_3_2_o[6];
    assign data_3_3_i[6] = dirc_sel[0] ? data_4_0_o[12] : data_3_2_o[5];
    assign data_3_3_i[7] = dirc_sel[0] ? data_4_0_o[14] : data_3_2_o[7];
    assign data_3_3_i[8] = dirc_sel[0] ? data_4_0_o[16] : data_3_2_o[8];
    assign data_3_3_i[9] = dirc_sel[0] ? data_4_0_o[18] : data_3_2_o[10];
    assign data_3_3_i[10] = dirc_sel[0] ? data_4_0_o[20] : data_3_2_o[9];
    assign data_3_3_i[11] = dirc_sel[0] ? data_4_0_o[22] : data_3_2_o[11];
    assign data_3_3_i[12] = dirc_sel[0] ? data_4_0_o[24] : data_3_2_o[12];
    assign data_3_3_i[13] = dirc_sel[0] ? data_4_0_o[26] : data_3_2_o[14];
    assign data_3_3_i[14] = dirc_sel[0] ? data_4_0_o[28] : data_3_2_o[13];
    assign data_3_3_i[15] = dirc_sel[0] ? data_4_0_o[30] : data_3_2_o[15];
    assign data_3_3_i[16] = dirc_sel[0] ? data_4_0_o[1] : data_3_2_o[16];
    assign data_3_3_i[17] = dirc_sel[0] ? data_4_0_o[3] : data_3_2_o[18];
    assign data_3_3_i[18] = dirc_sel[0] ? data_4_0_o[5] : data_3_2_o[17];
    assign data_3_3_i[19] = dirc_sel[0] ? data_4_0_o[7] : data_3_2_o[19];
    assign data_3_3_i[20] = dirc_sel[0] ? data_4_0_o[9] : data_3_2_o[20];
    assign data_3_3_i[21] = dirc_sel[0] ? data_4_0_o[11] : data_3_2_o[22];
    assign data_3_3_i[22] = dirc_sel[0] ? data_4_0_o[13] : data_3_2_o[21];
    assign data_3_3_i[23] = dirc_sel[0] ? data_4_0_o[15] : data_3_2_o[23];
    assign data_3_3_i[24] = dirc_sel[0] ? data_4_0_o[17] : data_3_2_o[24];
    assign data_3_3_i[25] = dirc_sel[0] ? data_4_0_o[19] : data_3_2_o[26];
    assign data_3_3_i[26] = dirc_sel[0] ? data_4_0_o[21] : data_3_2_o[25];
    assign data_3_3_i[27] = dirc_sel[0] ? data_4_0_o[23] : data_3_2_o[27];
    assign data_3_3_i[28] = dirc_sel[0] ? data_4_0_o[25] : data_3_2_o[28];
    assign data_3_3_i[29] = dirc_sel[0] ? data_4_0_o[27] : data_3_2_o[30];
    assign data_3_3_i[30] = dirc_sel[0] ? data_4_0_o[29] : data_3_2_o[29];
    assign data_3_3_i[31] = dirc_sel[0] ? data_4_0_o[31] : data_3_2_o[31];


    //***************************connection_4_0*******************************//
    assign data_4_0_i[0] = dirc_sel[0] ? data_4_1_o[0] : data_3_3_o[0];
    assign data_4_0_i[1] = dirc_sel[0] ? data_4_1_o[16] : data_3_3_o[16];
    assign data_4_0_i[2] = dirc_sel[0] ? data_4_1_o[2] : data_3_3_o[1];
    assign data_4_0_i[3] = dirc_sel[0] ? data_4_1_o[18] : data_3_3_o[17];
    assign data_4_0_i[4] = dirc_sel[0] ? data_4_1_o[4] : data_3_3_o[2];
    assign data_4_0_i[5] = dirc_sel[0] ? data_4_1_o[20] : data_3_3_o[18];
    assign data_4_0_i[6] = dirc_sel[0] ? data_4_1_o[6] : data_3_3_o[3];
    assign data_4_0_i[7] = dirc_sel[0] ? data_4_1_o[22] : data_3_3_o[19];
    assign data_4_0_i[8] = dirc_sel[0] ? data_4_1_o[8] : data_3_3_o[4];
    assign data_4_0_i[9] = dirc_sel[0] ? data_4_1_o[24] : data_3_3_o[20];
    assign data_4_0_i[10] = dirc_sel[0] ? data_4_1_o[10] : data_3_3_o[5];
    assign data_4_0_i[11] = dirc_sel[0] ? data_4_1_o[26] : data_3_3_o[21];
    assign data_4_0_i[12] = dirc_sel[0] ? data_4_1_o[12] : data_3_3_o[6];
    assign data_4_0_i[13] = dirc_sel[0] ? data_4_1_o[28] : data_3_3_o[22];
    assign data_4_0_i[14] = dirc_sel[0] ? data_4_1_o[14] : data_3_3_o[7];
    assign data_4_0_i[15] = dirc_sel[0] ? data_4_1_o[30] : data_3_3_o[23];
    assign data_4_0_i[16] = dirc_sel[0] ? data_4_1_o[1] : data_3_3_o[8];
    assign data_4_0_i[17] = dirc_sel[0] ? data_4_1_o[17] : data_3_3_o[24];
    assign data_4_0_i[18] = dirc_sel[0] ? data_4_1_o[3] : data_3_3_o[9];
    assign data_4_0_i[19] = dirc_sel[0] ? data_4_1_o[19] : data_3_3_o[25];
    assign data_4_0_i[20] = dirc_sel[0] ? data_4_1_o[5] : data_3_3_o[10];
    assign data_4_0_i[21] = dirc_sel[0] ? data_4_1_o[21] : data_3_3_o[26];
    assign data_4_0_i[22] = dirc_sel[0] ? data_4_1_o[7] : data_3_3_o[11];
    assign data_4_0_i[23] = dirc_sel[0] ? data_4_1_o[23] : data_3_3_o[27];
    assign data_4_0_i[24] = dirc_sel[0] ? data_4_1_o[9] : data_3_3_o[12];
    assign data_4_0_i[25] = dirc_sel[0] ? data_4_1_o[25] : data_3_3_o[28];
    assign data_4_0_i[26] = dirc_sel[0] ? data_4_1_o[11] : data_3_3_o[13];
    assign data_4_0_i[27] = dirc_sel[0] ? data_4_1_o[27] : data_3_3_o[29];
    assign data_4_0_i[28] = dirc_sel[0] ? data_4_1_o[13] : data_3_3_o[14];
    assign data_4_0_i[29] = dirc_sel[0] ? data_4_1_o[29] : data_3_3_o[30];
    assign data_4_0_i[30] = dirc_sel[0] ? data_4_1_o[15] : data_3_3_o[15];
    assign data_4_0_i[31] = dirc_sel[0] ? data_4_1_o[31] : data_3_3_o[31];


    //***************************connection_4_1*******************************//
    assign data_4_1_i[0] = dirc_sel[0] ? data_4_2_o[0] : data_4_0_o[0];
    assign data_4_1_i[1] = dirc_sel[0] ? data_4_2_o[8] : data_4_0_o[16];
    assign data_4_1_i[2] = dirc_sel[0] ? data_4_2_o[2] : data_4_0_o[2];
    assign data_4_1_i[3] = dirc_sel[0] ? data_4_2_o[10] : data_4_0_o[18];
    assign data_4_1_i[4] = dirc_sel[0] ? data_4_2_o[4] : data_4_0_o[4];
    assign data_4_1_i[5] = dirc_sel[0] ? data_4_2_o[12] : data_4_0_o[20];
    assign data_4_1_i[6] = dirc_sel[0] ? data_4_2_o[6] : data_4_0_o[6];
    assign data_4_1_i[7] = dirc_sel[0] ? data_4_2_o[14] : data_4_0_o[22];
    assign data_4_1_i[8] = dirc_sel[0] ? data_4_2_o[1] : data_4_0_o[8];
    assign data_4_1_i[9] = dirc_sel[0] ? data_4_2_o[9] : data_4_0_o[24];
    assign data_4_1_i[10] = dirc_sel[0] ? data_4_2_o[3] : data_4_0_o[10];
    assign data_4_1_i[11] = dirc_sel[0] ? data_4_2_o[11] : data_4_0_o[26];
    assign data_4_1_i[12] = dirc_sel[0] ? data_4_2_o[5] : data_4_0_o[12];
    assign data_4_1_i[13] = dirc_sel[0] ? data_4_2_o[13] : data_4_0_o[28];
    assign data_4_1_i[14] = dirc_sel[0] ? data_4_2_o[7] : data_4_0_o[14];
    assign data_4_1_i[15] = dirc_sel[0] ? data_4_2_o[15] : data_4_0_o[30];
    assign data_4_1_i[16] = dirc_sel[0] ? data_4_2_o[16] : data_4_0_o[1];
    assign data_4_1_i[17] = dirc_sel[0] ? data_4_2_o[24] : data_4_0_o[17];
    assign data_4_1_i[18] = dirc_sel[0] ? data_4_2_o[18] : data_4_0_o[3];
    assign data_4_1_i[19] = dirc_sel[0] ? data_4_2_o[26] : data_4_0_o[19];
    assign data_4_1_i[20] = dirc_sel[0] ? data_4_2_o[20] : data_4_0_o[5];
    assign data_4_1_i[21] = dirc_sel[0] ? data_4_2_o[28] : data_4_0_o[21];
    assign data_4_1_i[22] = dirc_sel[0] ? data_4_2_o[22] : data_4_0_o[7];
    assign data_4_1_i[23] = dirc_sel[0] ? data_4_2_o[30] : data_4_0_o[23];
    assign data_4_1_i[24] = dirc_sel[0] ? data_4_2_o[17] : data_4_0_o[9];
    assign data_4_1_i[25] = dirc_sel[0] ? data_4_2_o[25] : data_4_0_o[25];
    assign data_4_1_i[26] = dirc_sel[0] ? data_4_2_o[19] : data_4_0_o[11];
    assign data_4_1_i[27] = dirc_sel[0] ? data_4_2_o[27] : data_4_0_o[27];
    assign data_4_1_i[28] = dirc_sel[0] ? data_4_2_o[21] : data_4_0_o[13];
    assign data_4_1_i[29] = dirc_sel[0] ? data_4_2_o[29] : data_4_0_o[29];
    assign data_4_1_i[30] = dirc_sel[0] ? data_4_2_o[23] : data_4_0_o[15];
    assign data_4_1_i[31] = dirc_sel[0] ? data_4_2_o[31] : data_4_0_o[31];


    //***************************connection_4_2*******************************//
    assign data_4_2_i[0] = dirc_sel[0] ? data_4_3_o[0] : data_4_1_o[0];
    assign data_4_2_i[1] = dirc_sel[0] ? data_4_3_o[4] : data_4_1_o[8];
    assign data_4_2_i[2] = dirc_sel[0] ? data_4_3_o[2] : data_4_1_o[2];
    assign data_4_2_i[3] = dirc_sel[0] ? data_4_3_o[6] : data_4_1_o[10];
    assign data_4_2_i[4] = dirc_sel[0] ? data_4_3_o[1] : data_4_1_o[4];
    assign data_4_2_i[5] = dirc_sel[0] ? data_4_3_o[5] : data_4_1_o[12];
    assign data_4_2_i[6] = dirc_sel[0] ? data_4_3_o[3] : data_4_1_o[6];
    assign data_4_2_i[7] = dirc_sel[0] ? data_4_3_o[7] : data_4_1_o[14];
    assign data_4_2_i[8] = dirc_sel[0] ? data_4_3_o[8] : data_4_1_o[1];
    assign data_4_2_i[9] = dirc_sel[0] ? data_4_3_o[12] : data_4_1_o[9];
    assign data_4_2_i[10] = dirc_sel[0] ? data_4_3_o[10] : data_4_1_o[3];
    assign data_4_2_i[11] = dirc_sel[0] ? data_4_3_o[14] : data_4_1_o[11];
    assign data_4_2_i[12] = dirc_sel[0] ? data_4_3_o[9] : data_4_1_o[5];
    assign data_4_2_i[13] = dirc_sel[0] ? data_4_3_o[13] : data_4_1_o[13];
    assign data_4_2_i[14] = dirc_sel[0] ? data_4_3_o[11] : data_4_1_o[7];
    assign data_4_2_i[15] = dirc_sel[0] ? data_4_3_o[15] : data_4_1_o[15];
    assign data_4_2_i[16] = dirc_sel[0] ? data_4_3_o[16] : data_4_1_o[16];
    assign data_4_2_i[17] = dirc_sel[0] ? data_4_3_o[20] : data_4_1_o[24];
    assign data_4_2_i[18] = dirc_sel[0] ? data_4_3_o[18] : data_4_1_o[18];
    assign data_4_2_i[19] = dirc_sel[0] ? data_4_3_o[22] : data_4_1_o[26];
    assign data_4_2_i[20] = dirc_sel[0] ? data_4_3_o[17] : data_4_1_o[20];
    assign data_4_2_i[21] = dirc_sel[0] ? data_4_3_o[21] : data_4_1_o[28];
    assign data_4_2_i[22] = dirc_sel[0] ? data_4_3_o[19] : data_4_1_o[22];
    assign data_4_2_i[23] = dirc_sel[0] ? data_4_3_o[23] : data_4_1_o[30];
    assign data_4_2_i[24] = dirc_sel[0] ? data_4_3_o[24] : data_4_1_o[17];
    assign data_4_2_i[25] = dirc_sel[0] ? data_4_3_o[28] : data_4_1_o[25];
    assign data_4_2_i[26] = dirc_sel[0] ? data_4_3_o[26] : data_4_1_o[19];
    assign data_4_2_i[27] = dirc_sel[0] ? data_4_3_o[30] : data_4_1_o[27];
    assign data_4_2_i[28] = dirc_sel[0] ? data_4_3_o[25] : data_4_1_o[21];
    assign data_4_2_i[29] = dirc_sel[0] ? data_4_3_o[29] : data_4_1_o[29];
    assign data_4_2_i[30] = dirc_sel[0] ? data_4_3_o[27] : data_4_1_o[23];
    assign data_4_2_i[31] = dirc_sel[0] ? data_4_3_o[31] : data_4_1_o[31];


    //***************************connection_4_3*******************************//
    assign data_4_3_i[0] = dirc_sel[0] ? data_4_4_o[0] : data_4_2_o[0];
    assign data_4_3_i[1] = dirc_sel[0] ? data_4_4_o[2] : data_4_2_o[4];
    assign data_4_3_i[2] = dirc_sel[0] ? data_4_4_o[1] : data_4_2_o[2];
    assign data_4_3_i[3] = dirc_sel[0] ? data_4_4_o[3] : data_4_2_o[6];
    assign data_4_3_i[4] = dirc_sel[0] ? data_4_4_o[4] : data_4_2_o[1];
    assign data_4_3_i[5] = dirc_sel[0] ? data_4_4_o[6] : data_4_2_o[5];
    assign data_4_3_i[6] = dirc_sel[0] ? data_4_4_o[5] : data_4_2_o[3];
    assign data_4_3_i[7] = dirc_sel[0] ? data_4_4_o[7] : data_4_2_o[7];
    assign data_4_3_i[8] = dirc_sel[0] ? data_4_4_o[8] : data_4_2_o[8];
    assign data_4_3_i[9] = dirc_sel[0] ? data_4_4_o[10] : data_4_2_o[12];
    assign data_4_3_i[10] = dirc_sel[0] ? data_4_4_o[9] : data_4_2_o[10];
    assign data_4_3_i[11] = dirc_sel[0] ? data_4_4_o[11] : data_4_2_o[14];
    assign data_4_3_i[12] = dirc_sel[0] ? data_4_4_o[12] : data_4_2_o[9];
    assign data_4_3_i[13] = dirc_sel[0] ? data_4_4_o[14] : data_4_2_o[13];
    assign data_4_3_i[14] = dirc_sel[0] ? data_4_4_o[13] : data_4_2_o[11];
    assign data_4_3_i[15] = dirc_sel[0] ? data_4_4_o[15] : data_4_2_o[15];
    assign data_4_3_i[16] = dirc_sel[0] ? data_4_4_o[16] : data_4_2_o[16];
    assign data_4_3_i[17] = dirc_sel[0] ? data_4_4_o[18] : data_4_2_o[20];
    assign data_4_3_i[18] = dirc_sel[0] ? data_4_4_o[17] : data_4_2_o[18];
    assign data_4_3_i[19] = dirc_sel[0] ? data_4_4_o[19] : data_4_2_o[22];
    assign data_4_3_i[20] = dirc_sel[0] ? data_4_4_o[20] : data_4_2_o[17];
    assign data_4_3_i[21] = dirc_sel[0] ? data_4_4_o[22] : data_4_2_o[21];
    assign data_4_3_i[22] = dirc_sel[0] ? data_4_4_o[21] : data_4_2_o[19];
    assign data_4_3_i[23] = dirc_sel[0] ? data_4_4_o[23] : data_4_2_o[23];
    assign data_4_3_i[24] = dirc_sel[0] ? data_4_4_o[24] : data_4_2_o[24];
    assign data_4_3_i[25] = dirc_sel[0] ? data_4_4_o[26] : data_4_2_o[28];
    assign data_4_3_i[26] = dirc_sel[0] ? data_4_4_o[25] : data_4_2_o[26];
    assign data_4_3_i[27] = dirc_sel[0] ? data_4_4_o[27] : data_4_2_o[30];
    assign data_4_3_i[28] = dirc_sel[0] ? data_4_4_o[28] : data_4_2_o[25];
    assign data_4_3_i[29] = dirc_sel[0] ? data_4_4_o[30] : data_4_2_o[29];
    assign data_4_3_i[30] = dirc_sel[0] ? data_4_4_o[29] : data_4_2_o[27];
    assign data_4_3_i[31] = dirc_sel[0] ? data_4_4_o[31] : data_4_2_o[31];


    //***************************connection_4_4*******************************//
    always_ff @(posedge clk_i or posedge rst_i) begin
        if(rst_i)begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= {pack_width{1'b0}};
            end
        end else begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= data_4_4_o[i];
            end
        end
    end

    assign data_4_4_i[0] = dirc_sel[0] ? data_out_reg[0] : data_4_3_o[0];
    assign data_4_4_i[1] = dirc_sel[0] ? data_out_reg[1] : data_4_3_o[1];
    assign data_4_4_i[2] = dirc_sel[0] ? data_out_reg[2] : data_4_3_o[2];
    assign data_4_4_i[3] = dirc_sel[0] ? data_out_reg[3] : data_4_3_o[3];
    assign data_4_4_i[4] = dirc_sel[0] ? data_out_reg[4] : data_4_3_o[4];
    assign data_4_4_i[5] = dirc_sel[0] ? data_out_reg[5] : data_4_3_o[5];
    assign data_4_4_i[6] = dirc_sel[0] ? data_out_reg[6] : data_4_3_o[6];
    assign data_4_4_i[7] = dirc_sel[0] ? data_out_reg[7] : data_4_3_o[7];
    assign data_4_4_i[8] = dirc_sel[0] ? data_out_reg[8] : data_4_3_o[8];
    assign data_4_4_i[9] = dirc_sel[0] ? data_out_reg[9] : data_4_3_o[9];
    assign data_4_4_i[10] = dirc_sel[0] ? data_out_reg[10] : data_4_3_o[10];
    assign data_4_4_i[11] = dirc_sel[0] ? data_out_reg[11] : data_4_3_o[11];
    assign data_4_4_i[12] = dirc_sel[0] ? data_out_reg[12] : data_4_3_o[12];
    assign data_4_4_i[13] = dirc_sel[0] ? data_out_reg[13] : data_4_3_o[13];
    assign data_4_4_i[14] = dirc_sel[0] ? data_out_reg[14] : data_4_3_o[14];
    assign data_4_4_i[15] = dirc_sel[0] ? data_out_reg[15] : data_4_3_o[15];
    assign data_4_4_i[16] = dirc_sel[0] ? data_out_reg[16] : data_4_3_o[16];
    assign data_4_4_i[17] = dirc_sel[0] ? data_out_reg[17] : data_4_3_o[17];
    assign data_4_4_i[18] = dirc_sel[0] ? data_out_reg[18] : data_4_3_o[18];
    assign data_4_4_i[19] = dirc_sel[0] ? data_out_reg[19] : data_4_3_o[19];
    assign data_4_4_i[20] = dirc_sel[0] ? data_out_reg[20] : data_4_3_o[20];
    assign data_4_4_i[21] = dirc_sel[0] ? data_out_reg[21] : data_4_3_o[21];
    assign data_4_4_i[22] = dirc_sel[0] ? data_out_reg[22] : data_4_3_o[22];
    assign data_4_4_i[23] = dirc_sel[0] ? data_out_reg[23] : data_4_3_o[23];
    assign data_4_4_i[24] = dirc_sel[0] ? data_out_reg[24] : data_4_3_o[24];
    assign data_4_4_i[25] = dirc_sel[0] ? data_out_reg[25] : data_4_3_o[25];
    assign data_4_4_i[26] = dirc_sel[0] ? data_out_reg[26] : data_4_3_o[26];
    assign data_4_4_i[27] = dirc_sel[0] ? data_out_reg[27] : data_4_3_o[27];
    assign data_4_4_i[28] = dirc_sel[0] ? data_out_reg[28] : data_4_3_o[28];
    assign data_4_4_i[29] = dirc_sel[0] ? data_out_reg[29] : data_4_3_o[29];
    assign data_4_4_i[30] = dirc_sel[0] ? data_out_reg[30] : data_4_3_o[30];
    assign data_4_4_i[31] = dirc_sel[0] ? data_out_reg[31] : data_4_3_o[31];


endmodule