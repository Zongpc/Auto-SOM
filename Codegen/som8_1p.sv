// *********************************************************************************
// Project Name : SOM
// Create Time  : 2020/11/07 15:58
// File Name    : som8_1p.sv
// Module Name  : som8_1p
// *********************************************************************************
// Modification History:
// Time          By              Version                 Change Description
// -----------------------------------------------------------------------
// 2020/11/07    Zongpc          1.0                     First Create
// 15:58
// *********************************************************************************
module som8_1p
#(
parameter  size_num   = 8,
parameter  data_width = 8,
parameter  tag_width  = $clog2(size_num),
parameter  layers     = 6,
parameter  pipestage  = 1
)(
    input                                 clk_i,
    input                                 rst_i,

    input [tag_width+data_width-1:0]      data_in[0:size_num-1],
    output logic[data_width-1:0]          data_out_reg[0:size_num-1],
    input [size_num/2-1:0]                ctrl_in[0:layers-1],
    output [size_num/2-1:0]               status_out[0:layers-1],
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

    integer i,j;
    //***************************layer_0_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_0(mode_sel[0],ctrl_in[0][0],data_0_0_i[0],data_0_0_i[1],data_0_0_o[0],data_0_0_o[1],status_out[0][0]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_1(mode_sel[0],ctrl_in[0][1],data_0_0_i[2],data_0_0_i[3],data_0_0_o[2],data_0_0_o[3],status_out[0][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_0_0_2(mode_sel[0],ctrl_in[0][2],data_0_0_i[4],data_0_0_i[5],data_0_0_o[4],data_0_0_o[5],status_out[0][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_0_0_3(mode_sel[0],ctrl_in[0][3],data_0_0_i[6],data_0_0_i[7],data_0_0_o[6],data_0_0_o[7],status_out[0][3]);

    //***************************layer_1_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_0(mode_sel[0],ctrl_in[1][0],data_1_0_i[0],data_1_0_i[1],data_1_0_o[0],data_1_0_o[1],status_out[1][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_0_1(mode_sel[0],ctrl_in[1][1],data_1_0_i[2],data_1_0_i[3],data_1_0_o[2],data_1_0_o[3],status_out[1][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_2(mode_sel[0],ctrl_in[1][2],data_1_0_i[4],data_1_0_i[5],data_1_0_o[4],data_1_0_o[5],status_out[1][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_0_3(mode_sel[0],ctrl_in[1][3],data_1_0_i[6],data_1_0_i[7],data_1_0_o[6],data_1_0_o[7],status_out[1][3]);

    //***************************layer_1_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_0(mode_sel[0],ctrl_in[2][0],data_1_1_i[0],data_1_1_i[1],data_1_1_o[0],data_1_1_o[1],status_out[2][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_1_1_1(mode_sel[0],ctrl_in[2][1],data_1_1_i[2],data_1_1_i[3],data_1_1_o[2],data_1_1_o[3],status_out[2][1]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_2(mode_sel[0],ctrl_in[2][2],data_1_1_i[4],data_1_1_i[5],data_1_1_o[4],data_1_1_o[5],status_out[2][2]);
    sw_unit_d2u #(data_width,tag_width) sw_unit_1_1_3(mode_sel[0],ctrl_in[2][3],data_1_1_i[6],data_1_1_i[7],data_1_1_o[6],data_1_1_o[7],status_out[2][3]);

    //***************************layer_2_0*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_0(mode_sel[0],ctrl_in[3][0],data_2_0_i[0],data_2_0_i[1],data_2_0_o[0],data_2_0_o[1],status_out[3][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_1(mode_sel[0],ctrl_in[3][1],data_2_0_i[2],data_2_0_i[3],data_2_0_o[2],data_2_0_o[3],status_out[3][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_2(mode_sel[0],ctrl_in[3][2],data_2_0_i[4],data_2_0_i[5],data_2_0_o[4],data_2_0_o[5],status_out[3][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_0_3(mode_sel[0],ctrl_in[3][3],data_2_0_i[6],data_2_0_i[7],data_2_0_o[6],data_2_0_o[7],status_out[3][3]);

    //***************************layer_2_1*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_0(mode_sel[0],ctrl_in[4][0],data_2_1_i[0],data_2_1_i[1],data_2_1_o[0],data_2_1_o[1],status_out[4][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_1(mode_sel[0],ctrl_in[4][1],data_2_1_i[2],data_2_1_i[3],data_2_1_o[2],data_2_1_o[3],status_out[4][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_2(mode_sel[0],ctrl_in[4][2],data_2_1_i[4],data_2_1_i[5],data_2_1_o[4],data_2_1_o[5],status_out[4][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_1_3(mode_sel[0],ctrl_in[4][3],data_2_1_i[6],data_2_1_i[7],data_2_1_o[6],data_2_1_o[7],status_out[4][3]);

    //***************************layer_2_2*******************************//
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_0(mode_sel[0],ctrl_in[5][0],data_2_2_i[0],data_2_2_i[1],data_2_2_o[0],data_2_2_o[1],status_out[5][0]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_1(mode_sel[0],ctrl_in[5][1],data_2_2_i[2],data_2_2_i[3],data_2_2_o[2],data_2_2_o[3],status_out[5][1]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_2(mode_sel[0],ctrl_in[5][2],data_2_2_i[4],data_2_2_i[5],data_2_2_o[4],data_2_2_o[5],status_out[5][2]);
    sw_unit_u2d #(data_width,tag_width) sw_unit_2_2_3(mode_sel[0],ctrl_in[5][3],data_2_2_i[6],data_2_2_i[7],data_2_2_o[6],data_2_2_o[7],status_out[5][3]);

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

    assign data_0_0_i[0] = data_0_0_reg[0];
    assign data_0_0_i[1] = data_0_0_reg[1];
    assign data_0_0_i[2] = data_0_0_reg[2];
    assign data_0_0_i[3] = data_0_0_reg[3];
    assign data_0_0_i[4] = data_0_0_reg[4];
    assign data_0_0_i[5] = data_0_0_reg[5];
    assign data_0_0_i[6] = data_0_0_reg[6];
    assign data_0_0_i[7] = data_0_0_reg[7];


    //***************************connection_1_0*******************************//
    assign data_1_0_i[0] = data_0_0_o[0];
    assign data_1_0_i[1] = data_0_0_o[2];
    assign data_1_0_i[2] = data_0_0_o[1];
    assign data_1_0_i[3] = data_0_0_o[3];
    assign data_1_0_i[4] = data_0_0_o[4];
    assign data_1_0_i[5] = data_0_0_o[6];
    assign data_1_0_i[6] = data_0_0_o[5];
    assign data_1_0_i[7] = data_0_0_o[7];


    //***************************connection_1_1*******************************//
    assign data_1_1_i[0] = data_1_0_o[0];
    assign data_1_1_i[1] = data_1_0_o[2];
    assign data_1_1_i[2] = data_1_0_o[1];
    assign data_1_1_i[3] = data_1_0_o[3];
    assign data_1_1_i[4] = data_1_0_o[4];
    assign data_1_1_i[5] = data_1_0_o[6];
    assign data_1_1_i[6] = data_1_0_o[5];
    assign data_1_1_i[7] = data_1_0_o[7];


    //***************************connection_2_0*******************************//
    assign data_2_0_i[0] = data_1_1_o[0];
    assign data_2_0_i[1] = data_1_1_o[4];
    assign data_2_0_i[2] = data_1_1_o[1];
    assign data_2_0_i[3] = data_1_1_o[5];
    assign data_2_0_i[4] = data_1_1_o[2];
    assign data_2_0_i[5] = data_1_1_o[6];
    assign data_2_0_i[6] = data_1_1_o[3];
    assign data_2_0_i[7] = data_1_1_o[7];


    //***************************connection_2_1*******************************//
    assign data_2_1_i[0] = data_2_0_o[0];
    assign data_2_1_i[1] = data_2_0_o[4];
    assign data_2_1_i[2] = data_2_0_o[2];
    assign data_2_1_i[3] = data_2_0_o[6];
    assign data_2_1_i[4] = data_2_0_o[1];
    assign data_2_1_i[5] = data_2_0_o[5];
    assign data_2_1_i[6] = data_2_0_o[3];
    assign data_2_1_i[7] = data_2_0_o[7];


    //***************************connection_2_2*******************************//
    always_ff @(posedge clk_i or posedge rst_i) begin
        if(rst_i)begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= {pack_width{1'b0}};
            end
        end else begin
            for (i=0; i<size_num; i=i+1)begin
                data_out_reg[i] <= data_2_2_o[i];
            end
        end
    end

    assign data_2_2_i[0] = data_2_1_o[0];
    assign data_2_2_i[1] = data_2_1_o[1];
    assign data_2_2_i[2] = data_2_1_o[2];
    assign data_2_2_i[3] = data_2_1_o[3];
    assign data_2_2_i[4] = data_2_1_o[4];
    assign data_2_2_i[5] = data_2_1_o[5];
    assign data_2_2_i[6] = data_2_1_o[6];
    assign data_2_2_i[7] = data_2_1_o[7];


endmodule