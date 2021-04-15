// *********************************************************************************
// Project Name : SOM
// Create Time  : 2020/10/19 10:34
// File Name    : som16_1p_1b.sv
// Module Name  : som16_1p_1b
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2020/10/19    Zongpc          1.0                     First Create
// 10:34
// *********************************************************************************
module som16_1p_1b
#(
parameter  size_num   = 16,
parameter  data_width = 8,
parameter  tag_width  = $clog2(size_num),
parameter  layers     = 10,
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

    //***************************layer_1_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_0(mode_sel[0],ctrl_in[1][0],data_1_0_i[0],data_1_0_i[1],data_1_0_o[0],data_1_0_o[1],status_out[1][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_1(mode_sel[0],ctrl_in[1][1],data_1_0_i[2],data_1_0_i[3],data_1_0_o[2],data_1_0_o[3],status_out[1][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_2(mode_sel[0],ctrl_in[1][2],data_1_0_i[4],data_1_0_i[5],data_1_0_o[4],data_1_0_o[5],status_out[1][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_3(mode_sel[0],ctrl_in[1][3],data_1_0_i[6],data_1_0_i[7],data_1_0_o[6],data_1_0_o[7],status_out[1][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_4(mode_sel[0],ctrl_in[1][4],data_1_0_i[8],data_1_0_i[9],data_1_0_o[8],data_1_0_o[9],status_out[1][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_5(mode_sel[0],ctrl_in[1][5],data_1_0_i[10],data_1_0_i[11],data_1_0_o[10],data_1_0_o[11],status_out[1][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_6(mode_sel[0],ctrl_in[1][6],data_1_0_i[12],data_1_0_i[13],data_1_0_o[12],data_1_0_o[13],status_out[1][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_7(mode_sel[0],ctrl_in[1][7],data_1_0_i[14],data_1_0_i[15],data_1_0_o[14],data_1_0_o[15],status_out[1][7]);

    //***************************layer_1_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_0(mode_sel[0],ctrl_in[2][0],data_1_1_i[0],data_1_1_i[1],data_1_1_o[0],data_1_1_o[1],status_out[2][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_1(mode_sel[0],ctrl_in[2][1],data_1_1_i[2],data_1_1_i[3],data_1_1_o[2],data_1_1_o[3],status_out[2][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_2(mode_sel[0],ctrl_in[2][2],data_1_1_i[4],data_1_1_i[5],data_1_1_o[4],data_1_1_o[5],status_out[2][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_3(mode_sel[0],ctrl_in[2][3],data_1_1_i[6],data_1_1_i[7],data_1_1_o[6],data_1_1_o[7],status_out[2][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_4(mode_sel[0],ctrl_in[2][4],data_1_1_i[8],data_1_1_i[9],data_1_1_o[8],data_1_1_o[9],status_out[2][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_5(mode_sel[0],ctrl_in[2][5],data_1_1_i[10],data_1_1_i[11],data_1_1_o[10],data_1_1_o[11],status_out[2][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_6(mode_sel[0],ctrl_in[2][6],data_1_1_i[12],data_1_1_i[13],data_1_1_o[12],data_1_1_o[13],status_out[2][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_7(mode_sel[0],ctrl_in[2][7],data_1_1_i[14],data_1_1_i[15],data_1_1_o[14],data_1_1_o[15],status_out[2][7]);

    //***************************layer_2_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_0(mode_sel[0],ctrl_in[3][0],data_2_0_i[0],data_2_0_i[1],data_2_0_o[0],data_2_0_o[1],status_out[3][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_1(mode_sel[0],ctrl_in[3][1],data_2_0_i[2],data_2_0_i[3],data_2_0_o[2],data_2_0_o[3],status_out[3][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_2(mode_sel[0],ctrl_in[3][2],data_2_0_i[4],data_2_0_i[5],data_2_0_o[4],data_2_0_o[5],status_out[3][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_3(mode_sel[0],ctrl_in[3][3],data_2_0_i[6],data_2_0_i[7],data_2_0_o[6],data_2_0_o[7],status_out[3][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_4(mode_sel[0],ctrl_in[3][4],data_2_0_i[8],data_2_0_i[9],data_2_0_o[8],data_2_0_o[9],status_out[3][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_5(mode_sel[0],ctrl_in[3][5],data_2_0_i[10],data_2_0_i[11],data_2_0_o[10],data_2_0_o[11],status_out[3][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_6(mode_sel[0],ctrl_in[3][6],data_2_0_i[12],data_2_0_i[13],data_2_0_o[12],data_2_0_o[13],status_out[3][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_0_7(mode_sel[0],ctrl_in[3][7],data_2_0_i[14],data_2_0_i[15],data_2_0_o[14],data_2_0_o[15],status_out[3][7]);

    //***************************layer_2_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_0(mode_sel[0],ctrl_in[4][0],data_2_1_i[0],data_2_1_i[1],data_2_1_o[0],data_2_1_o[1],status_out[4][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_1(mode_sel[0],ctrl_in[4][1],data_2_1_i[2],data_2_1_i[3],data_2_1_o[2],data_2_1_o[3],status_out[4][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_2(mode_sel[0],ctrl_in[4][2],data_2_1_i[4],data_2_1_i[5],data_2_1_o[4],data_2_1_o[5],status_out[4][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_3(mode_sel[0],ctrl_in[4][3],data_2_1_i[6],data_2_1_i[7],data_2_1_o[6],data_2_1_o[7],status_out[4][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_4(mode_sel[0],ctrl_in[4][4],data_2_1_i[8],data_2_1_i[9],data_2_1_o[8],data_2_1_o[9],status_out[4][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_5(mode_sel[0],ctrl_in[4][5],data_2_1_i[10],data_2_1_i[11],data_2_1_o[10],data_2_1_o[11],status_out[4][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_6(mode_sel[0],ctrl_in[4][6],data_2_1_i[12],data_2_1_i[13],data_2_1_o[12],data_2_1_o[13],status_out[4][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_1_7(mode_sel[0],ctrl_in[4][7],data_2_1_i[14],data_2_1_i[15],data_2_1_o[14],data_2_1_o[15],status_out[4][7]);

    //***************************layer_2_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_0(mode_sel[0],ctrl_in[5][0],data_2_2_i[0],data_2_2_i[1],data_2_2_o[0],data_2_2_o[1],status_out[5][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_1(mode_sel[0],ctrl_in[5][1],data_2_2_i[2],data_2_2_i[3],data_2_2_o[2],data_2_2_o[3],status_out[5][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_2(mode_sel[0],ctrl_in[5][2],data_2_2_i[4],data_2_2_i[5],data_2_2_o[4],data_2_2_o[5],status_out[5][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_3(mode_sel[0],ctrl_in[5][3],data_2_2_i[6],data_2_2_i[7],data_2_2_o[6],data_2_2_o[7],status_out[5][3]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_4(mode_sel[0],ctrl_in[5][4],data_2_2_i[8],data_2_2_i[9],data_2_2_o[8],data_2_2_o[9],status_out[5][4]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_5(mode_sel[0],ctrl_in[5][5],data_2_2_i[10],data_2_2_i[11],data_2_2_o[10],data_2_2_o[11],status_out[5][5]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_6(mode_sel[0],ctrl_in[5][6],data_2_2_i[12],data_2_2_i[13],data_2_2_o[12],data_2_2_o[13],status_out[5][6]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_2_2_7(mode_sel[0],ctrl_in[5][7],data_2_2_i[14],data_2_2_i[15],data_2_2_o[14],data_2_2_o[15],status_out[5][7]);

    //***************************layer_3_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_0(mode_sel[0],ctrl_in[6][0],data_3_0_i[0],data_3_0_i[1],data_3_0_o[0],data_3_0_o[1],status_out[6][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_1(mode_sel[0],ctrl_in[6][1],data_3_0_i[2],data_3_0_i[3],data_3_0_o[2],data_3_0_o[3],status_out[6][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_2(mode_sel[0],ctrl_in[6][2],data_3_0_i[4],data_3_0_i[5],data_3_0_o[4],data_3_0_o[5],status_out[6][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_3(mode_sel[0],ctrl_in[6][3],data_3_0_i[6],data_3_0_i[7],data_3_0_o[6],data_3_0_o[7],status_out[6][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_4(mode_sel[0],ctrl_in[6][4],data_3_0_i[8],data_3_0_i[9],data_3_0_o[8],data_3_0_o[9],status_out[6][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_5(mode_sel[0],ctrl_in[6][5],data_3_0_i[10],data_3_0_i[11],data_3_0_o[10],data_3_0_o[11],status_out[6][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_6(mode_sel[0],ctrl_in[6][6],data_3_0_i[12],data_3_0_i[13],data_3_0_o[12],data_3_0_o[13],status_out[6][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_0_7(mode_sel[0],ctrl_in[6][7],data_3_0_i[14],data_3_0_i[15],data_3_0_o[14],data_3_0_o[15],status_out[6][7]);

    //***************************layer_3_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_0(mode_sel[0],ctrl_in[7][0],data_3_1_i[0],data_3_1_i[1],data_3_1_o[0],data_3_1_o[1],status_out[7][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_1(mode_sel[0],ctrl_in[7][1],data_3_1_i[2],data_3_1_i[3],data_3_1_o[2],data_3_1_o[3],status_out[7][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_2(mode_sel[0],ctrl_in[7][2],data_3_1_i[4],data_3_1_i[5],data_3_1_o[4],data_3_1_o[5],status_out[7][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_3(mode_sel[0],ctrl_in[7][3],data_3_1_i[6],data_3_1_i[7],data_3_1_o[6],data_3_1_o[7],status_out[7][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_4(mode_sel[0],ctrl_in[7][4],data_3_1_i[8],data_3_1_i[9],data_3_1_o[8],data_3_1_o[9],status_out[7][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_5(mode_sel[0],ctrl_in[7][5],data_3_1_i[10],data_3_1_i[11],data_3_1_o[10],data_3_1_o[11],status_out[7][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_6(mode_sel[0],ctrl_in[7][6],data_3_1_i[12],data_3_1_i[13],data_3_1_o[12],data_3_1_o[13],status_out[7][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_1_7(mode_sel[0],ctrl_in[7][7],data_3_1_i[14],data_3_1_i[15],data_3_1_o[14],data_3_1_o[15],status_out[7][7]);

    //***************************layer_3_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_0(mode_sel[0],ctrl_in[8][0],data_3_2_i[0],data_3_2_i[1],data_3_2_o[0],data_3_2_o[1],status_out[8][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_1(mode_sel[0],ctrl_in[8][1],data_3_2_i[2],data_3_2_i[3],data_3_2_o[2],data_3_2_o[3],status_out[8][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_2(mode_sel[0],ctrl_in[8][2],data_3_2_i[4],data_3_2_i[5],data_3_2_o[4],data_3_2_o[5],status_out[8][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_3(mode_sel[0],ctrl_in[8][3],data_3_2_i[6],data_3_2_i[7],data_3_2_o[6],data_3_2_o[7],status_out[8][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_4(mode_sel[0],ctrl_in[8][4],data_3_2_i[8],data_3_2_i[9],data_3_2_o[8],data_3_2_o[9],status_out[8][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_5(mode_sel[0],ctrl_in[8][5],data_3_2_i[10],data_3_2_i[11],data_3_2_o[10],data_3_2_o[11],status_out[8][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_6(mode_sel[0],ctrl_in[8][6],data_3_2_i[12],data_3_2_i[13],data_3_2_o[12],data_3_2_o[13],status_out[8][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_2_7(mode_sel[0],ctrl_in[8][7],data_3_2_i[14],data_3_2_i[15],data_3_2_o[14],data_3_2_o[15],status_out[8][7]);

    //***************************layer_3_3*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_0(mode_sel[0],ctrl_in[9][0],data_3_3_i[0],data_3_3_i[1],data_3_3_o[0],data_3_3_o[1],status_out[9][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_1(mode_sel[0],ctrl_in[9][1],data_3_3_i[2],data_3_3_i[3],data_3_3_o[2],data_3_3_o[3],status_out[9][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_2(mode_sel[0],ctrl_in[9][2],data_3_3_i[4],data_3_3_i[5],data_3_3_o[4],data_3_3_o[5],status_out[9][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_3(mode_sel[0],ctrl_in[9][3],data_3_3_i[6],data_3_3_i[7],data_3_3_o[6],data_3_3_o[7],status_out[9][3]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_4(mode_sel[0],ctrl_in[9][4],data_3_3_i[8],data_3_3_i[9],data_3_3_o[8],data_3_3_o[9],status_out[9][4]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_5(mode_sel[0],ctrl_in[9][5],data_3_3_i[10],data_3_3_i[11],data_3_3_o[10],data_3_3_o[11],status_out[9][5]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_6(mode_sel[0],ctrl_in[9][6],data_3_3_i[12],data_3_3_i[13],data_3_3_o[12],data_3_3_o[13],status_out[9][6]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_3_3_7(mode_sel[0],ctrl_in[9][7],data_3_3_i[14],data_3_3_i[15],data_3_3_o[14],data_3_3_o[15],status_out[9][7]);

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


    //***************************connection_3_3*******************************//
    always_ff @(posedge clk_i or posedge rst_i) begin
        if(rst_i)begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= {pack_width{1'b0}};
            end
        end else begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= data_3_3_o[i];
            end
        end
    end

    assign data_3_3_i[0] = dirc_sel[0] ? data_out_reg[0] : data_3_2_o[0];
    assign data_3_3_i[1] = dirc_sel[0] ? data_out_reg[1] : data_3_2_o[1];
    assign data_3_3_i[2] = dirc_sel[0] ? data_out_reg[2] : data_3_2_o[2];
    assign data_3_3_i[3] = dirc_sel[0] ? data_out_reg[3] : data_3_2_o[3];
    assign data_3_3_i[4] = dirc_sel[0] ? data_out_reg[4] : data_3_2_o[4];
    assign data_3_3_i[5] = dirc_sel[0] ? data_out_reg[5] : data_3_2_o[5];
    assign data_3_3_i[6] = dirc_sel[0] ? data_out_reg[6] : data_3_2_o[6];
    assign data_3_3_i[7] = dirc_sel[0] ? data_out_reg[7] : data_3_2_o[7];
    assign data_3_3_i[8] = dirc_sel[0] ? data_out_reg[8] : data_3_2_o[8];
    assign data_3_3_i[9] = dirc_sel[0] ? data_out_reg[9] : data_3_2_o[9];
    assign data_3_3_i[10] = dirc_sel[0] ? data_out_reg[10] : data_3_2_o[10];
    assign data_3_3_i[11] = dirc_sel[0] ? data_out_reg[11] : data_3_2_o[11];
    assign data_3_3_i[12] = dirc_sel[0] ? data_out_reg[12] : data_3_2_o[12];
    assign data_3_3_i[13] = dirc_sel[0] ? data_out_reg[13] : data_3_2_o[13];
    assign data_3_3_i[14] = dirc_sel[0] ? data_out_reg[14] : data_3_2_o[14];
    assign data_3_3_i[15] = dirc_sel[0] ? data_out_reg[15] : data_3_2_o[15];


endmodule