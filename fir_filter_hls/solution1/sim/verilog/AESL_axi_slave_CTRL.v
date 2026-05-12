// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

`timescale 1 ns / 1 ps

module AESL_axi_slave_CTRL (
    clk,
    reset,
    TRAN_s_axi_CTRL_AWADDR,
    TRAN_s_axi_CTRL_AWVALID,
    TRAN_s_axi_CTRL_AWREADY,
    TRAN_s_axi_CTRL_WVALID,
    TRAN_s_axi_CTRL_WREADY,
    TRAN_s_axi_CTRL_WDATA,
    TRAN_s_axi_CTRL_WSTRB,
    TRAN_s_axi_CTRL_ARADDR,
    TRAN_s_axi_CTRL_ARVALID,
    TRAN_s_axi_CTRL_ARREADY,
    TRAN_s_axi_CTRL_RVALID,
    TRAN_s_axi_CTRL_RREADY,
    TRAN_s_axi_CTRL_RDATA,
    TRAN_s_axi_CTRL_RRESP,
    TRAN_s_axi_CTRL_BVALID,
    TRAN_s_axi_CTRL_BREADY,
    TRAN_s_axi_CTRL_BRESP,
    TRAN_CTRL_write_data_finish,
    TRAN_CTRL_start_in,
    TRAN_CTRL_idle_out,
    TRAN_CTRL_ready_out,
    TRAN_CTRL_ready_in,
    TRAN_CTRL_done_out,
    TRAN_CTRL_write_start_in   ,
    TRAN_CTRL_write_start_finish,
    TRAN_CTRL_interrupt,
    TRAN_CTRL_transaction_done_in
    );

//------------------------Parameter----------------------
`define TV_IN_coeffs_0 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_0.dat"
`define TV_IN_coeffs_1 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_1.dat"
`define TV_IN_coeffs_2 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_2.dat"
`define TV_IN_coeffs_3 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_3.dat"
`define TV_IN_coeffs_4 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_4.dat"
`define TV_IN_coeffs_5 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_5.dat"
`define TV_IN_coeffs_6 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_6.dat"
`define TV_IN_coeffs_7 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_7.dat"
`define TV_IN_coeffs_8 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_8.dat"
`define TV_IN_coeffs_9 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_9.dat"
`define TV_IN_coeffs_10 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_10.dat"
`define TV_IN_coeffs_11 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_11.dat"
`define TV_IN_coeffs_12 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_12.dat"
`define TV_IN_coeffs_13 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_13.dat"
`define TV_IN_coeffs_14 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_14.dat"
`define TV_IN_coeffs_15 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_15.dat"
`define TV_IN_coeffs_16 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_16.dat"
`define TV_IN_coeffs_17 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_17.dat"
`define TV_IN_coeffs_18 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_18.dat"
`define TV_IN_coeffs_19 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_19.dat"
`define TV_IN_coeffs_20 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_20.dat"
`define TV_IN_coeffs_21 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_21.dat"
`define TV_IN_coeffs_22 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_22.dat"
`define TV_IN_coeffs_23 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_23.dat"
`define TV_IN_coeffs_24 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_24.dat"
`define TV_IN_coeffs_25 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_25.dat"
`define TV_IN_coeffs_26 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_26.dat"
`define TV_IN_coeffs_27 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_27.dat"
`define TV_IN_coeffs_28 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_28.dat"
`define TV_IN_coeffs_29 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_29.dat"
`define TV_IN_coeffs_30 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_30.dat"
`define TV_IN_coeffs_31 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_31.dat"
`define TV_IN_num_taps "../tv/cdatafile/c.fir_filter.autotvin_num_taps.dat"
`define TV_IN_num_samples "../tv/cdatafile/c.fir_filter.autotvin_num_samples.dat"
parameter ADDR_WIDTH = 9;
parameter DATA_WIDTH = 32;
parameter coeffs_0_DEPTH = 1;
reg [31 : 0] coeffs_0_OPERATE_DEPTH = 0;
parameter coeffs_0_c_bitwidth = 16;
parameter coeffs_1_DEPTH = 1;
reg [31 : 0] coeffs_1_OPERATE_DEPTH = 0;
parameter coeffs_1_c_bitwidth = 16;
parameter coeffs_2_DEPTH = 1;
reg [31 : 0] coeffs_2_OPERATE_DEPTH = 0;
parameter coeffs_2_c_bitwidth = 16;
parameter coeffs_3_DEPTH = 1;
reg [31 : 0] coeffs_3_OPERATE_DEPTH = 0;
parameter coeffs_3_c_bitwidth = 16;
parameter coeffs_4_DEPTH = 1;
reg [31 : 0] coeffs_4_OPERATE_DEPTH = 0;
parameter coeffs_4_c_bitwidth = 16;
parameter coeffs_5_DEPTH = 1;
reg [31 : 0] coeffs_5_OPERATE_DEPTH = 0;
parameter coeffs_5_c_bitwidth = 16;
parameter coeffs_6_DEPTH = 1;
reg [31 : 0] coeffs_6_OPERATE_DEPTH = 0;
parameter coeffs_6_c_bitwidth = 16;
parameter coeffs_7_DEPTH = 1;
reg [31 : 0] coeffs_7_OPERATE_DEPTH = 0;
parameter coeffs_7_c_bitwidth = 16;
parameter coeffs_8_DEPTH = 1;
reg [31 : 0] coeffs_8_OPERATE_DEPTH = 0;
parameter coeffs_8_c_bitwidth = 16;
parameter coeffs_9_DEPTH = 1;
reg [31 : 0] coeffs_9_OPERATE_DEPTH = 0;
parameter coeffs_9_c_bitwidth = 16;
parameter coeffs_10_DEPTH = 1;
reg [31 : 0] coeffs_10_OPERATE_DEPTH = 0;
parameter coeffs_10_c_bitwidth = 16;
parameter coeffs_11_DEPTH = 1;
reg [31 : 0] coeffs_11_OPERATE_DEPTH = 0;
parameter coeffs_11_c_bitwidth = 16;
parameter coeffs_12_DEPTH = 1;
reg [31 : 0] coeffs_12_OPERATE_DEPTH = 0;
parameter coeffs_12_c_bitwidth = 16;
parameter coeffs_13_DEPTH = 1;
reg [31 : 0] coeffs_13_OPERATE_DEPTH = 0;
parameter coeffs_13_c_bitwidth = 16;
parameter coeffs_14_DEPTH = 1;
reg [31 : 0] coeffs_14_OPERATE_DEPTH = 0;
parameter coeffs_14_c_bitwidth = 16;
parameter coeffs_15_DEPTH = 1;
reg [31 : 0] coeffs_15_OPERATE_DEPTH = 0;
parameter coeffs_15_c_bitwidth = 16;
parameter coeffs_16_DEPTH = 1;
reg [31 : 0] coeffs_16_OPERATE_DEPTH = 0;
parameter coeffs_16_c_bitwidth = 16;
parameter coeffs_17_DEPTH = 1;
reg [31 : 0] coeffs_17_OPERATE_DEPTH = 0;
parameter coeffs_17_c_bitwidth = 16;
parameter coeffs_18_DEPTH = 1;
reg [31 : 0] coeffs_18_OPERATE_DEPTH = 0;
parameter coeffs_18_c_bitwidth = 16;
parameter coeffs_19_DEPTH = 1;
reg [31 : 0] coeffs_19_OPERATE_DEPTH = 0;
parameter coeffs_19_c_bitwidth = 16;
parameter coeffs_20_DEPTH = 1;
reg [31 : 0] coeffs_20_OPERATE_DEPTH = 0;
parameter coeffs_20_c_bitwidth = 16;
parameter coeffs_21_DEPTH = 1;
reg [31 : 0] coeffs_21_OPERATE_DEPTH = 0;
parameter coeffs_21_c_bitwidth = 16;
parameter coeffs_22_DEPTH = 1;
reg [31 : 0] coeffs_22_OPERATE_DEPTH = 0;
parameter coeffs_22_c_bitwidth = 16;
parameter coeffs_23_DEPTH = 1;
reg [31 : 0] coeffs_23_OPERATE_DEPTH = 0;
parameter coeffs_23_c_bitwidth = 16;
parameter coeffs_24_DEPTH = 1;
reg [31 : 0] coeffs_24_OPERATE_DEPTH = 0;
parameter coeffs_24_c_bitwidth = 16;
parameter coeffs_25_DEPTH = 1;
reg [31 : 0] coeffs_25_OPERATE_DEPTH = 0;
parameter coeffs_25_c_bitwidth = 16;
parameter coeffs_26_DEPTH = 1;
reg [31 : 0] coeffs_26_OPERATE_DEPTH = 0;
parameter coeffs_26_c_bitwidth = 16;
parameter coeffs_27_DEPTH = 1;
reg [31 : 0] coeffs_27_OPERATE_DEPTH = 0;
parameter coeffs_27_c_bitwidth = 16;
parameter coeffs_28_DEPTH = 1;
reg [31 : 0] coeffs_28_OPERATE_DEPTH = 0;
parameter coeffs_28_c_bitwidth = 16;
parameter coeffs_29_DEPTH = 1;
reg [31 : 0] coeffs_29_OPERATE_DEPTH = 0;
parameter coeffs_29_c_bitwidth = 16;
parameter coeffs_30_DEPTH = 1;
reg [31 : 0] coeffs_30_OPERATE_DEPTH = 0;
parameter coeffs_30_c_bitwidth = 16;
parameter coeffs_31_DEPTH = 1;
reg [31 : 0] coeffs_31_OPERATE_DEPTH = 0;
parameter coeffs_31_c_bitwidth = 16;
parameter num_taps_DEPTH = 1;
reg [31 : 0] num_taps_OPERATE_DEPTH = 0;
parameter num_taps_c_bitwidth = 32;
parameter num_samples_DEPTH = 1;
reg [31 : 0] num_samples_OPERATE_DEPTH = 0;
parameter num_samples_c_bitwidth = 32;
parameter START_ADDR = 0;
parameter fir_filter_continue_addr = 0;
parameter fir_filter_auto_start_addr = 0;
parameter coeffs_0_data_in_addr = 16;
parameter coeffs_1_data_in_addr = 24;
parameter coeffs_2_data_in_addr = 32;
parameter coeffs_3_data_in_addr = 40;
parameter coeffs_4_data_in_addr = 48;
parameter coeffs_5_data_in_addr = 56;
parameter coeffs_6_data_in_addr = 64;
parameter coeffs_7_data_in_addr = 72;
parameter coeffs_8_data_in_addr = 80;
parameter coeffs_9_data_in_addr = 88;
parameter coeffs_10_data_in_addr = 96;
parameter coeffs_11_data_in_addr = 104;
parameter coeffs_12_data_in_addr = 112;
parameter coeffs_13_data_in_addr = 120;
parameter coeffs_14_data_in_addr = 128;
parameter coeffs_15_data_in_addr = 136;
parameter coeffs_16_data_in_addr = 144;
parameter coeffs_17_data_in_addr = 152;
parameter coeffs_18_data_in_addr = 160;
parameter coeffs_19_data_in_addr = 168;
parameter coeffs_20_data_in_addr = 176;
parameter coeffs_21_data_in_addr = 184;
parameter coeffs_22_data_in_addr = 192;
parameter coeffs_23_data_in_addr = 200;
parameter coeffs_24_data_in_addr = 208;
parameter coeffs_25_data_in_addr = 216;
parameter coeffs_26_data_in_addr = 224;
parameter coeffs_27_data_in_addr = 232;
parameter coeffs_28_data_in_addr = 240;
parameter coeffs_29_data_in_addr = 248;
parameter coeffs_30_data_in_addr = 256;
parameter coeffs_31_data_in_addr = 264;
parameter num_taps_data_in_addr = 272;
parameter num_samples_data_in_addr = 280;
parameter STATUS_ADDR = 0;

output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_CTRL_AWADDR;
output  TRAN_s_axi_CTRL_AWVALID;
input  TRAN_s_axi_CTRL_AWREADY;
output  TRAN_s_axi_CTRL_WVALID;
input  TRAN_s_axi_CTRL_WREADY;
output [DATA_WIDTH - 1 : 0] TRAN_s_axi_CTRL_WDATA;
output [DATA_WIDTH/8 - 1 : 0] TRAN_s_axi_CTRL_WSTRB;
output [ADDR_WIDTH - 1 : 0] TRAN_s_axi_CTRL_ARADDR;
output  TRAN_s_axi_CTRL_ARVALID;
input  TRAN_s_axi_CTRL_ARREADY;
input  TRAN_s_axi_CTRL_RVALID;
output  TRAN_s_axi_CTRL_RREADY;
input [DATA_WIDTH - 1 : 0] TRAN_s_axi_CTRL_RDATA;
input [2 - 1 : 0] TRAN_s_axi_CTRL_RRESP;
input  TRAN_s_axi_CTRL_BVALID;
output  TRAN_s_axi_CTRL_BREADY;
input [2 - 1 : 0] TRAN_s_axi_CTRL_BRESP;
output TRAN_CTRL_write_data_finish;
input     clk;
input     reset;
input     TRAN_CTRL_start_in;
output    TRAN_CTRL_done_out;
output    TRAN_CTRL_ready_out;
input     TRAN_CTRL_ready_in;
output    TRAN_CTRL_idle_out;
input  TRAN_CTRL_write_start_in   ;
output TRAN_CTRL_write_start_finish;
input     TRAN_CTRL_interrupt;
input     TRAN_CTRL_transaction_done_in;

reg [ADDR_WIDTH - 1 : 0] AWADDR_reg = 0;
reg  AWVALID_reg = 0;
reg  WVALID_reg = 0;
reg [DATA_WIDTH - 1 : 0] WDATA_reg = 0;
reg [DATA_WIDTH/8 - 1 : 0] WSTRB_reg = 0;
reg [ADDR_WIDTH - 1 : 0] ARADDR_reg = 0;
reg  ARVALID_reg = 0;
reg  RREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] RDATA_reg = 0;
reg  BREADY_reg = 0;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_0 [coeffs_0_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_0 [ (coeffs_0_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_0_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_0_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_1 [coeffs_1_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_1 [ (coeffs_1_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_1_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_1_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_2 [coeffs_2_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_2 [ (coeffs_2_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_2_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_2_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_3 [coeffs_3_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_3 [ (coeffs_3_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_3_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_3_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_4 [coeffs_4_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_4 [ (coeffs_4_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_4_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_4_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_5 [coeffs_5_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_5 [ (coeffs_5_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_5_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_5_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_6 [coeffs_6_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_6 [ (coeffs_6_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_6_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_6_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_7 [coeffs_7_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_7 [ (coeffs_7_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_7_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_7_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_8 [coeffs_8_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_8 [ (coeffs_8_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_8_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_8_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_9 [coeffs_9_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_9 [ (coeffs_9_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_9_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_9_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_10 [coeffs_10_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_10 [ (coeffs_10_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_10_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_10_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_11 [coeffs_11_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_11 [ (coeffs_11_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_11_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_11_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_12 [coeffs_12_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_12 [ (coeffs_12_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_12_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_12_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_13 [coeffs_13_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_13 [ (coeffs_13_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_13_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_13_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_14 [coeffs_14_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_14 [ (coeffs_14_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_14_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_14_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_15 [coeffs_15_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_15 [ (coeffs_15_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_15_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_15_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_16 [coeffs_16_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_16 [ (coeffs_16_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_16_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_16_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_17 [coeffs_17_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_17 [ (coeffs_17_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_17_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_17_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_18 [coeffs_18_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_18 [ (coeffs_18_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_18_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_18_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_19 [coeffs_19_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_19 [ (coeffs_19_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_19_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_19_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_20 [coeffs_20_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_20 [ (coeffs_20_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_20_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_20_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_21 [coeffs_21_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_21 [ (coeffs_21_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_21_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_21_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_22 [coeffs_22_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_22 [ (coeffs_22_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_22_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_22_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_23 [coeffs_23_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_23 [ (coeffs_23_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_23_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_23_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_24 [coeffs_24_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_24 [ (coeffs_24_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_24_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_24_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_25 [coeffs_25_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_25 [ (coeffs_25_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_25_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_25_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_26 [coeffs_26_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_26 [ (coeffs_26_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_26_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_26_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_27 [coeffs_27_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_27 [ (coeffs_27_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_27_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_27_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_28 [coeffs_28_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_28 [ (coeffs_28_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_28_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_28_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_29 [coeffs_29_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_29 [ (coeffs_29_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_29_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_29_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_30 [coeffs_30_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_30 [ (coeffs_30_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_30_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_30_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_coeffs_31 [coeffs_31_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_coeffs_31 [ (coeffs_31_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * coeffs_31_DEPTH -1 : 0] = '{default : 'hz};
reg coeffs_31_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_num_taps [num_taps_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_num_taps [ (num_taps_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * num_taps_DEPTH -1 : 0] = '{default : 'hz};
reg num_taps_write_data_finish;
reg [DATA_WIDTH - 1 : 0] mem_num_samples [num_samples_DEPTH - 1 : 0] = '{default : 'h0};
reg [DATA_WIDTH-1 : 0] image_mem_num_samples [ (num_samples_c_bitwidth+DATA_WIDTH-1)/DATA_WIDTH * num_samples_DEPTH -1 : 0] = '{default : 'hz};
reg num_samples_write_data_finish;
reg AESL_ready_out_index_reg = 0;
reg AESL_write_start_finish = 0;
reg AESL_ready_reg;
reg ready_initial;
reg AESL_done_index_reg = 0;
reg AESL_idle_index_reg = 0;
reg AESL_auto_restart_index_reg;
reg process_0_finish = 0;
reg process_1_finish = 0;
reg process_2_finish = 0;
reg process_3_finish = 0;
reg process_4_finish = 0;
reg process_5_finish = 0;
reg process_6_finish = 0;
reg process_7_finish = 0;
reg process_8_finish = 0;
reg process_9_finish = 0;
reg process_10_finish = 0;
reg process_11_finish = 0;
reg process_12_finish = 0;
reg process_13_finish = 0;
reg process_14_finish = 0;
reg process_15_finish = 0;
reg process_16_finish = 0;
reg process_17_finish = 0;
reg process_18_finish = 0;
reg process_19_finish = 0;
reg process_20_finish = 0;
reg process_21_finish = 0;
reg process_22_finish = 0;
reg process_23_finish = 0;
reg process_24_finish = 0;
reg process_25_finish = 0;
reg process_26_finish = 0;
reg process_27_finish = 0;
reg process_28_finish = 0;
reg process_29_finish = 0;
reg process_30_finish = 0;
reg process_31_finish = 0;
reg process_32_finish = 0;
reg process_33_finish = 0;
reg process_34_finish = 0;
reg process_35_finish = 0;
//write coeffs_0 reg
reg [31 : 0] write_coeffs_0_count = 0;
reg [31 : 0] coeffs_0_diff_count = 0;
reg write_coeffs_0_run_flag = 0;
reg write_one_coeffs_0_data_done = 0;
//write coeffs_1 reg
reg [31 : 0] write_coeffs_1_count = 0;
reg [31 : 0] coeffs_1_diff_count = 0;
reg write_coeffs_1_run_flag = 0;
reg write_one_coeffs_1_data_done = 0;
//write coeffs_2 reg
reg [31 : 0] write_coeffs_2_count = 0;
reg [31 : 0] coeffs_2_diff_count = 0;
reg write_coeffs_2_run_flag = 0;
reg write_one_coeffs_2_data_done = 0;
//write coeffs_3 reg
reg [31 : 0] write_coeffs_3_count = 0;
reg [31 : 0] coeffs_3_diff_count = 0;
reg write_coeffs_3_run_flag = 0;
reg write_one_coeffs_3_data_done = 0;
//write coeffs_4 reg
reg [31 : 0] write_coeffs_4_count = 0;
reg [31 : 0] coeffs_4_diff_count = 0;
reg write_coeffs_4_run_flag = 0;
reg write_one_coeffs_4_data_done = 0;
//write coeffs_5 reg
reg [31 : 0] write_coeffs_5_count = 0;
reg [31 : 0] coeffs_5_diff_count = 0;
reg write_coeffs_5_run_flag = 0;
reg write_one_coeffs_5_data_done = 0;
//write coeffs_6 reg
reg [31 : 0] write_coeffs_6_count = 0;
reg [31 : 0] coeffs_6_diff_count = 0;
reg write_coeffs_6_run_flag = 0;
reg write_one_coeffs_6_data_done = 0;
//write coeffs_7 reg
reg [31 : 0] write_coeffs_7_count = 0;
reg [31 : 0] coeffs_7_diff_count = 0;
reg write_coeffs_7_run_flag = 0;
reg write_one_coeffs_7_data_done = 0;
//write coeffs_8 reg
reg [31 : 0] write_coeffs_8_count = 0;
reg [31 : 0] coeffs_8_diff_count = 0;
reg write_coeffs_8_run_flag = 0;
reg write_one_coeffs_8_data_done = 0;
//write coeffs_9 reg
reg [31 : 0] write_coeffs_9_count = 0;
reg [31 : 0] coeffs_9_diff_count = 0;
reg write_coeffs_9_run_flag = 0;
reg write_one_coeffs_9_data_done = 0;
//write coeffs_10 reg
reg [31 : 0] write_coeffs_10_count = 0;
reg [31 : 0] coeffs_10_diff_count = 0;
reg write_coeffs_10_run_flag = 0;
reg write_one_coeffs_10_data_done = 0;
//write coeffs_11 reg
reg [31 : 0] write_coeffs_11_count = 0;
reg [31 : 0] coeffs_11_diff_count = 0;
reg write_coeffs_11_run_flag = 0;
reg write_one_coeffs_11_data_done = 0;
//write coeffs_12 reg
reg [31 : 0] write_coeffs_12_count = 0;
reg [31 : 0] coeffs_12_diff_count = 0;
reg write_coeffs_12_run_flag = 0;
reg write_one_coeffs_12_data_done = 0;
//write coeffs_13 reg
reg [31 : 0] write_coeffs_13_count = 0;
reg [31 : 0] coeffs_13_diff_count = 0;
reg write_coeffs_13_run_flag = 0;
reg write_one_coeffs_13_data_done = 0;
//write coeffs_14 reg
reg [31 : 0] write_coeffs_14_count = 0;
reg [31 : 0] coeffs_14_diff_count = 0;
reg write_coeffs_14_run_flag = 0;
reg write_one_coeffs_14_data_done = 0;
//write coeffs_15 reg
reg [31 : 0] write_coeffs_15_count = 0;
reg [31 : 0] coeffs_15_diff_count = 0;
reg write_coeffs_15_run_flag = 0;
reg write_one_coeffs_15_data_done = 0;
//write coeffs_16 reg
reg [31 : 0] write_coeffs_16_count = 0;
reg [31 : 0] coeffs_16_diff_count = 0;
reg write_coeffs_16_run_flag = 0;
reg write_one_coeffs_16_data_done = 0;
//write coeffs_17 reg
reg [31 : 0] write_coeffs_17_count = 0;
reg [31 : 0] coeffs_17_diff_count = 0;
reg write_coeffs_17_run_flag = 0;
reg write_one_coeffs_17_data_done = 0;
//write coeffs_18 reg
reg [31 : 0] write_coeffs_18_count = 0;
reg [31 : 0] coeffs_18_diff_count = 0;
reg write_coeffs_18_run_flag = 0;
reg write_one_coeffs_18_data_done = 0;
//write coeffs_19 reg
reg [31 : 0] write_coeffs_19_count = 0;
reg [31 : 0] coeffs_19_diff_count = 0;
reg write_coeffs_19_run_flag = 0;
reg write_one_coeffs_19_data_done = 0;
//write coeffs_20 reg
reg [31 : 0] write_coeffs_20_count = 0;
reg [31 : 0] coeffs_20_diff_count = 0;
reg write_coeffs_20_run_flag = 0;
reg write_one_coeffs_20_data_done = 0;
//write coeffs_21 reg
reg [31 : 0] write_coeffs_21_count = 0;
reg [31 : 0] coeffs_21_diff_count = 0;
reg write_coeffs_21_run_flag = 0;
reg write_one_coeffs_21_data_done = 0;
//write coeffs_22 reg
reg [31 : 0] write_coeffs_22_count = 0;
reg [31 : 0] coeffs_22_diff_count = 0;
reg write_coeffs_22_run_flag = 0;
reg write_one_coeffs_22_data_done = 0;
//write coeffs_23 reg
reg [31 : 0] write_coeffs_23_count = 0;
reg [31 : 0] coeffs_23_diff_count = 0;
reg write_coeffs_23_run_flag = 0;
reg write_one_coeffs_23_data_done = 0;
//write coeffs_24 reg
reg [31 : 0] write_coeffs_24_count = 0;
reg [31 : 0] coeffs_24_diff_count = 0;
reg write_coeffs_24_run_flag = 0;
reg write_one_coeffs_24_data_done = 0;
//write coeffs_25 reg
reg [31 : 0] write_coeffs_25_count = 0;
reg [31 : 0] coeffs_25_diff_count = 0;
reg write_coeffs_25_run_flag = 0;
reg write_one_coeffs_25_data_done = 0;
//write coeffs_26 reg
reg [31 : 0] write_coeffs_26_count = 0;
reg [31 : 0] coeffs_26_diff_count = 0;
reg write_coeffs_26_run_flag = 0;
reg write_one_coeffs_26_data_done = 0;
//write coeffs_27 reg
reg [31 : 0] write_coeffs_27_count = 0;
reg [31 : 0] coeffs_27_diff_count = 0;
reg write_coeffs_27_run_flag = 0;
reg write_one_coeffs_27_data_done = 0;
//write coeffs_28 reg
reg [31 : 0] write_coeffs_28_count = 0;
reg [31 : 0] coeffs_28_diff_count = 0;
reg write_coeffs_28_run_flag = 0;
reg write_one_coeffs_28_data_done = 0;
//write coeffs_29 reg
reg [31 : 0] write_coeffs_29_count = 0;
reg [31 : 0] coeffs_29_diff_count = 0;
reg write_coeffs_29_run_flag = 0;
reg write_one_coeffs_29_data_done = 0;
//write coeffs_30 reg
reg [31 : 0] write_coeffs_30_count = 0;
reg [31 : 0] coeffs_30_diff_count = 0;
reg write_coeffs_30_run_flag = 0;
reg write_one_coeffs_30_data_done = 0;
//write coeffs_31 reg
reg [31 : 0] write_coeffs_31_count = 0;
reg [31 : 0] coeffs_31_diff_count = 0;
reg write_coeffs_31_run_flag = 0;
reg write_one_coeffs_31_data_done = 0;
//write num_taps reg
reg [31 : 0] write_num_taps_count = 0;
reg [31 : 0] num_taps_diff_count = 0;
reg write_num_taps_run_flag = 0;
reg write_one_num_taps_data_done = 0;
//write num_samples reg
reg [31 : 0] write_num_samples_count = 0;
reg [31 : 0] num_samples_diff_count = 0;
reg write_num_samples_run_flag = 0;
reg write_one_num_samples_data_done = 0;
reg [31 : 0] write_start_count = 0;
reg write_start_run_flag = 0;

//===================process control=================
reg [31 : 0] ongoing_process_number = 0;
//process number depends on how much processes needed.
reg process_busy = 0;

//=================== signal connection ==============
assign TRAN_s_axi_CTRL_AWADDR = AWADDR_reg;
assign TRAN_s_axi_CTRL_AWVALID = AWVALID_reg;
assign TRAN_s_axi_CTRL_WVALID = WVALID_reg;
assign TRAN_s_axi_CTRL_WDATA = WDATA_reg;
assign TRAN_s_axi_CTRL_WSTRB = WSTRB_reg;
assign TRAN_s_axi_CTRL_ARADDR = ARADDR_reg;
assign TRAN_s_axi_CTRL_ARVALID = ARVALID_reg;
assign TRAN_s_axi_CTRL_RREADY = RREADY_reg;
assign TRAN_s_axi_CTRL_BREADY = BREADY_reg;
assign TRAN_CTRL_write_start_finish = AESL_write_start_finish;
assign TRAN_CTRL_done_out = AESL_done_index_reg;
assign TRAN_CTRL_ready_out = AESL_ready_out_index_reg;
assign TRAN_CTRL_idle_out = AESL_idle_index_reg;
assign TRAN_CTRL_write_data_finish = 1 & coeffs_0_write_data_finish & coeffs_1_write_data_finish & coeffs_2_write_data_finish & coeffs_3_write_data_finish & coeffs_4_write_data_finish & coeffs_5_write_data_finish & coeffs_6_write_data_finish & coeffs_7_write_data_finish & coeffs_8_write_data_finish & coeffs_9_write_data_finish & coeffs_10_write_data_finish & coeffs_11_write_data_finish & coeffs_12_write_data_finish & coeffs_13_write_data_finish & coeffs_14_write_data_finish & coeffs_15_write_data_finish & coeffs_16_write_data_finish & coeffs_17_write_data_finish & coeffs_18_write_data_finish & coeffs_19_write_data_finish & coeffs_20_write_data_finish & coeffs_21_write_data_finish & coeffs_22_write_data_finish & coeffs_23_write_data_finish & coeffs_24_write_data_finish & coeffs_25_write_data_finish & coeffs_26_write_data_finish & coeffs_27_write_data_finish & coeffs_28_write_data_finish & coeffs_29_write_data_finish & coeffs_30_write_data_finish & coeffs_31_write_data_finish & num_taps_write_data_finish & num_samples_write_data_finish;
always @(TRAN_CTRL_ready_in or ready_initial) 
begin
    AESL_ready_reg <= TRAN_CTRL_ready_in | ready_initial;
end

always @(reset or process_0_finish or process_1_finish or process_2_finish or process_3_finish or process_4_finish or process_5_finish or process_6_finish or process_7_finish or process_8_finish or process_9_finish or process_10_finish or process_11_finish or process_12_finish or process_13_finish or process_14_finish or process_15_finish or process_16_finish or process_17_finish or process_18_finish or process_19_finish or process_20_finish or process_21_finish or process_22_finish or process_23_finish or process_24_finish or process_25_finish or process_26_finish or process_27_finish or process_28_finish or process_29_finish or process_30_finish or process_31_finish or process_32_finish or process_33_finish or process_34_finish or process_35_finish ) begin
    if (reset == 0) begin
        ongoing_process_number <= 0;
    end
    else if (ongoing_process_number == 0 && process_0_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 1 && process_1_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 2 && process_2_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 3 && process_3_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 4 && process_4_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 5 && process_5_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 6 && process_6_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 7 && process_7_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 8 && process_8_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 9 && process_9_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 10 && process_10_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 11 && process_11_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 12 && process_12_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 13 && process_13_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 14 && process_14_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 15 && process_15_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 16 && process_16_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 17 && process_17_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 18 && process_18_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 19 && process_19_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 20 && process_20_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 21 && process_21_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 22 && process_22_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 23 && process_23_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 24 && process_24_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 25 && process_25_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 26 && process_26_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 27 && process_27_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 28 && process_28_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 29 && process_29_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 30 && process_30_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 31 && process_31_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 32 && process_32_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 33 && process_33_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 34 && process_34_finish == 1) begin
            ongoing_process_number <= ongoing_process_number + 1;
    end
    else if (ongoing_process_number == 35 && process_35_finish == 1) begin
            ongoing_process_number <= 0;
    end
end

task count_c_data_four_byte_num_by_bitwidth;
input  integer bitwidth;
output integer num;
integer factor;
integer i;
begin
    factor = 32;
    for (i = 1; i <= 1024; i = i + 1) begin
        if (bitwidth <= factor && bitwidth > factor - 32) begin
            num = i;
        end
        factor = factor + 32;
    end
end    
endtask

function integer ceil_align_to_pow_of_two;
input integer a;
begin
    ceil_align_to_pow_of_two = $pow(2,$clog2(a));
end
endfunction

task count_seperate_factor_by_bitwidth;
input  integer bitwidth;
output integer factor;
begin
    if (bitwidth <= 8) begin
        factor=4;
    end
    if (bitwidth <= 16 & bitwidth > 8 ) begin
        factor=2;
    end
    if (bitwidth <= 32 & bitwidth > 16 ) begin
        factor=1;
    end
    if (bitwidth > 32 ) begin
        factor=1;
    end
end    
endtask

task count_operate_depth_by_bitwidth_and_depth;
input  integer bitwidth;
input  integer depth;
output integer operate_depth;
integer factor;
integer remain;
begin
    count_seperate_factor_by_bitwidth (bitwidth , factor);
    operate_depth = depth / factor;
    remain = depth % factor;
    if (remain > 0) begin
        operate_depth = operate_depth + 1;
    end
end    
endtask

task write; /*{{{*/
    input  reg [ADDR_WIDTH - 1:0] waddr;   // write address
    input  reg [DATA_WIDTH - 1:0] wdata;   // write data
    output reg wresp;
    reg aw_flag;
    reg w_flag;
    reg [DATA_WIDTH/8 - 1:0] wstrb_reg;
    integer i;
begin 
    wresp = 0;
    aw_flag = 0;
    w_flag = 0;
//=======================one single write operate======================
    AWADDR_reg <= waddr;
    AWVALID_reg <= 1;
    WDATA_reg <= wdata;
    WVALID_reg <= 1;
    for (i = 0; i < DATA_WIDTH/8; i = i + 1) begin
        wstrb_reg [i] = 1;
    end    
    WSTRB_reg <= wstrb_reg;
    while (!(aw_flag && w_flag)) begin
        @(posedge clk);
        if (aw_flag != 1)
            aw_flag = TRAN_s_axi_CTRL_AWREADY & AWVALID_reg;
        if (w_flag != 1)
            w_flag = TRAN_s_axi_CTRL_WREADY & WVALID_reg;
        AWVALID_reg <= !aw_flag;
        WVALID_reg <= !w_flag;
    end

    BREADY_reg <= 1;
    while (TRAN_s_axi_CTRL_BVALID != 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    BREADY_reg <= 0;
    if (TRAN_s_axi_CTRL_BRESP === 2'b00) begin
        wresp = 1;
        //input success. in fact BRESP is always 2'b00
    end   
//=======================one single write operate======================

end
endtask/*}}}*/

task read (/*{{{*/
    input  [ADDR_WIDTH - 1:0] raddr ,   // write address
    output [DATA_WIDTH - 1:0] RDATA_result ,
    output rresp
);
begin 
    rresp = 0;
//=======================one single read operate======================
    ARADDR_reg <= raddr;
    ARVALID_reg <= 1;
    while (TRAN_s_axi_CTRL_ARREADY !== 1) begin
        @(posedge clk);
    end
    @(posedge clk);
    ARVALID_reg <= 0;
    RREADY_reg <= 1;
    while (TRAN_s_axi_CTRL_RVALID !== 1) begin
        //wait for response 
        @(posedge clk);
    end
    @(posedge clk);
    RDATA_result  <= TRAN_s_axi_CTRL_RDATA;
    RREADY_reg <= 0;
    if (TRAN_s_axi_CTRL_RRESP === 2'b00 ) begin
        rresp <= 1;
        //output success. in fact RRESP is always 2'b00
    end  
    @(posedge clk);

//=======================one single read operate end======================

end
endtask/*}}}*/

initial begin : ready_initial_process
    ready_initial = 0;
    wait(reset === 1);
    @(posedge clk);
    ready_initial = 1;
    @(posedge clk);
    ready_initial = 0;
end

initial begin : update_status
    integer process_num ;
    integer read_status_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 0;
    while (1) begin
        process_0_finish = 0;
        AESL_done_index_reg         <= 0;
        AESL_ready_out_index_reg        <= 0;
        if (ongoing_process_number === process_num && process_busy === 0) begin
            process_busy = 1;
            read (STATUS_ADDR, RDATA_reg, read_status_resp);
                AESL_done_index_reg         <= RDATA_reg[1 : 1];
                AESL_ready_out_index_reg    <= RDATA_reg[1 : 1];
                AESL_idle_index_reg         <= RDATA_reg[2 : 2];
            process_0_finish = 1;
            process_busy = 0;
        end 
        @(posedge clk);
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_0_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_0_c_bitwidth, coeffs_0_DEPTH, coeffs_0_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_0_run_flag <= 1; 
        end
        else if ((write_one_coeffs_0_data_done == 1 && write_coeffs_0_count == coeffs_0_diff_count - 1) || coeffs_0_diff_count == 0) begin
            write_coeffs_0_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_0_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_0_count = 0;
        end
        if (write_one_coeffs_0_data_done === 1) begin
            write_coeffs_0_count = write_coeffs_0_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_0_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_0_write_data_finish <= 0;
        end
        if (write_coeffs_0_run_flag == 1 && write_coeffs_0_count == coeffs_0_diff_count) begin
            coeffs_0_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_0
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_0_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_0_diff_count = 0;

        for (k = 0; k < coeffs_0_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_0_c_bitwidth < 32) begin
                    coeffs_0_data_tmp_reg = mem_coeffs_0[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_0_c_bitwidth) begin
                            coeffs_0_data_tmp_reg[j] = mem_coeffs_0[k][i*32 + j];
                        end
                        else begin
                            coeffs_0_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_0[k * four_byte_num  + i]!==coeffs_0_data_tmp_reg) begin
                coeffs_0_diff_count = coeffs_0_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_0
    integer write_coeffs_0_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_0_count;
    reg [31 : 0] coeffs_0_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_0_c_bitwidth;
    process_num = 1;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_1_finish <= 0;

        for (check_coeffs_0_count = 0; check_coeffs_0_count < coeffs_0_OPERATE_DEPTH; check_coeffs_0_count = check_coeffs_0_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_0_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_0 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_0_c_bitwidth < 32) begin
                        coeffs_0_data_tmp_reg = mem_coeffs_0[check_coeffs_0_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_0_c_bitwidth) begin
                                coeffs_0_data_tmp_reg[j] = mem_coeffs_0[check_coeffs_0_count][i*32 + j];
                            end
                            else begin
                                coeffs_0_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_0[check_coeffs_0_count * four_byte_num  + i]!==coeffs_0_data_tmp_reg) begin
                        image_mem_coeffs_0[check_coeffs_0_count * four_byte_num + i]=coeffs_0_data_tmp_reg;
                        write (coeffs_0_data_in_addr + check_coeffs_0_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_0_data_tmp_reg, write_coeffs_0_resp);
                        write_one_coeffs_0_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_0_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_1_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_1_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_1_c_bitwidth, coeffs_1_DEPTH, coeffs_1_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_1_run_flag <= 1; 
        end
        else if ((write_one_coeffs_1_data_done == 1 && write_coeffs_1_count == coeffs_1_diff_count - 1) || coeffs_1_diff_count == 0) begin
            write_coeffs_1_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_1_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_1_count = 0;
        end
        if (write_one_coeffs_1_data_done === 1) begin
            write_coeffs_1_count = write_coeffs_1_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_1_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_1_write_data_finish <= 0;
        end
        if (write_coeffs_1_run_flag == 1 && write_coeffs_1_count == coeffs_1_diff_count) begin
            coeffs_1_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_1
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_1_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_1_diff_count = 0;

        for (k = 0; k < coeffs_1_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_1_c_bitwidth < 32) begin
                    coeffs_1_data_tmp_reg = mem_coeffs_1[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_1_c_bitwidth) begin
                            coeffs_1_data_tmp_reg[j] = mem_coeffs_1[k][i*32 + j];
                        end
                        else begin
                            coeffs_1_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_1[k * four_byte_num  + i]!==coeffs_1_data_tmp_reg) begin
                coeffs_1_diff_count = coeffs_1_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_1
    integer write_coeffs_1_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_1_count;
    reg [31 : 0] coeffs_1_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_1_c_bitwidth;
    process_num = 2;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_2_finish <= 0;

        for (check_coeffs_1_count = 0; check_coeffs_1_count < coeffs_1_OPERATE_DEPTH; check_coeffs_1_count = check_coeffs_1_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_1_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_1 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_1_c_bitwidth < 32) begin
                        coeffs_1_data_tmp_reg = mem_coeffs_1[check_coeffs_1_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_1_c_bitwidth) begin
                                coeffs_1_data_tmp_reg[j] = mem_coeffs_1[check_coeffs_1_count][i*32 + j];
                            end
                            else begin
                                coeffs_1_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_1[check_coeffs_1_count * four_byte_num  + i]!==coeffs_1_data_tmp_reg) begin
                        image_mem_coeffs_1[check_coeffs_1_count * four_byte_num + i]=coeffs_1_data_tmp_reg;
                        write (coeffs_1_data_in_addr + check_coeffs_1_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_1_data_tmp_reg, write_coeffs_1_resp);
                        write_one_coeffs_1_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_1_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_2_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_2_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_2_c_bitwidth, coeffs_2_DEPTH, coeffs_2_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_2_run_flag <= 1; 
        end
        else if ((write_one_coeffs_2_data_done == 1 && write_coeffs_2_count == coeffs_2_diff_count - 1) || coeffs_2_diff_count == 0) begin
            write_coeffs_2_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_2_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_2_count = 0;
        end
        if (write_one_coeffs_2_data_done === 1) begin
            write_coeffs_2_count = write_coeffs_2_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_2_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_2_write_data_finish <= 0;
        end
        if (write_coeffs_2_run_flag == 1 && write_coeffs_2_count == coeffs_2_diff_count) begin
            coeffs_2_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_2
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_2_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_2_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_2_diff_count = 0;

        for (k = 0; k < coeffs_2_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_2_c_bitwidth < 32) begin
                    coeffs_2_data_tmp_reg = mem_coeffs_2[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_2_c_bitwidth) begin
                            coeffs_2_data_tmp_reg[j] = mem_coeffs_2[k][i*32 + j];
                        end
                        else begin
                            coeffs_2_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_2[k * four_byte_num  + i]!==coeffs_2_data_tmp_reg) begin
                coeffs_2_diff_count = coeffs_2_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_2
    integer write_coeffs_2_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_2_count;
    reg [31 : 0] coeffs_2_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_2_c_bitwidth;
    process_num = 3;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_3_finish <= 0;

        for (check_coeffs_2_count = 0; check_coeffs_2_count < coeffs_2_OPERATE_DEPTH; check_coeffs_2_count = check_coeffs_2_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_2_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_2 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_2_c_bitwidth < 32) begin
                        coeffs_2_data_tmp_reg = mem_coeffs_2[check_coeffs_2_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_2_c_bitwidth) begin
                                coeffs_2_data_tmp_reg[j] = mem_coeffs_2[check_coeffs_2_count][i*32 + j];
                            end
                            else begin
                                coeffs_2_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_2[check_coeffs_2_count * four_byte_num  + i]!==coeffs_2_data_tmp_reg) begin
                        image_mem_coeffs_2[check_coeffs_2_count * four_byte_num + i]=coeffs_2_data_tmp_reg;
                        write (coeffs_2_data_in_addr + check_coeffs_2_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_2_data_tmp_reg, write_coeffs_2_resp);
                        write_one_coeffs_2_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_2_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_3_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_3_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_3_c_bitwidth, coeffs_3_DEPTH, coeffs_3_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_3_run_flag <= 1; 
        end
        else if ((write_one_coeffs_3_data_done == 1 && write_coeffs_3_count == coeffs_3_diff_count - 1) || coeffs_3_diff_count == 0) begin
            write_coeffs_3_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_3_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_3_count = 0;
        end
        if (write_one_coeffs_3_data_done === 1) begin
            write_coeffs_3_count = write_coeffs_3_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_3_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_3_write_data_finish <= 0;
        end
        if (write_coeffs_3_run_flag == 1 && write_coeffs_3_count == coeffs_3_diff_count) begin
            coeffs_3_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_3
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_3_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_3_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_3_diff_count = 0;

        for (k = 0; k < coeffs_3_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_3_c_bitwidth < 32) begin
                    coeffs_3_data_tmp_reg = mem_coeffs_3[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_3_c_bitwidth) begin
                            coeffs_3_data_tmp_reg[j] = mem_coeffs_3[k][i*32 + j];
                        end
                        else begin
                            coeffs_3_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_3[k * four_byte_num  + i]!==coeffs_3_data_tmp_reg) begin
                coeffs_3_diff_count = coeffs_3_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_3
    integer write_coeffs_3_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_3_count;
    reg [31 : 0] coeffs_3_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_3_c_bitwidth;
    process_num = 4;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_4_finish <= 0;

        for (check_coeffs_3_count = 0; check_coeffs_3_count < coeffs_3_OPERATE_DEPTH; check_coeffs_3_count = check_coeffs_3_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_3_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_3 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_3_c_bitwidth < 32) begin
                        coeffs_3_data_tmp_reg = mem_coeffs_3[check_coeffs_3_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_3_c_bitwidth) begin
                                coeffs_3_data_tmp_reg[j] = mem_coeffs_3[check_coeffs_3_count][i*32 + j];
                            end
                            else begin
                                coeffs_3_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_3[check_coeffs_3_count * four_byte_num  + i]!==coeffs_3_data_tmp_reg) begin
                        image_mem_coeffs_3[check_coeffs_3_count * four_byte_num + i]=coeffs_3_data_tmp_reg;
                        write (coeffs_3_data_in_addr + check_coeffs_3_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_3_data_tmp_reg, write_coeffs_3_resp);
                        write_one_coeffs_3_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_3_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_4_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_4_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_4_c_bitwidth, coeffs_4_DEPTH, coeffs_4_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_4_run_flag <= 1; 
        end
        else if ((write_one_coeffs_4_data_done == 1 && write_coeffs_4_count == coeffs_4_diff_count - 1) || coeffs_4_diff_count == 0) begin
            write_coeffs_4_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_4_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_4_count = 0;
        end
        if (write_one_coeffs_4_data_done === 1) begin
            write_coeffs_4_count = write_coeffs_4_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_4_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_4_write_data_finish <= 0;
        end
        if (write_coeffs_4_run_flag == 1 && write_coeffs_4_count == coeffs_4_diff_count) begin
            coeffs_4_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_4
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_4_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_4_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_4_diff_count = 0;

        for (k = 0; k < coeffs_4_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_4_c_bitwidth < 32) begin
                    coeffs_4_data_tmp_reg = mem_coeffs_4[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_4_c_bitwidth) begin
                            coeffs_4_data_tmp_reg[j] = mem_coeffs_4[k][i*32 + j];
                        end
                        else begin
                            coeffs_4_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_4[k * four_byte_num  + i]!==coeffs_4_data_tmp_reg) begin
                coeffs_4_diff_count = coeffs_4_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_4
    integer write_coeffs_4_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_4_count;
    reg [31 : 0] coeffs_4_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_4_c_bitwidth;
    process_num = 5;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_5_finish <= 0;

        for (check_coeffs_4_count = 0; check_coeffs_4_count < coeffs_4_OPERATE_DEPTH; check_coeffs_4_count = check_coeffs_4_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_4_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_4 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_4_c_bitwidth < 32) begin
                        coeffs_4_data_tmp_reg = mem_coeffs_4[check_coeffs_4_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_4_c_bitwidth) begin
                                coeffs_4_data_tmp_reg[j] = mem_coeffs_4[check_coeffs_4_count][i*32 + j];
                            end
                            else begin
                                coeffs_4_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_4[check_coeffs_4_count * four_byte_num  + i]!==coeffs_4_data_tmp_reg) begin
                        image_mem_coeffs_4[check_coeffs_4_count * four_byte_num + i]=coeffs_4_data_tmp_reg;
                        write (coeffs_4_data_in_addr + check_coeffs_4_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_4_data_tmp_reg, write_coeffs_4_resp);
                        write_one_coeffs_4_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_4_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_5_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_5_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_5_c_bitwidth, coeffs_5_DEPTH, coeffs_5_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_5_run_flag <= 1; 
        end
        else if ((write_one_coeffs_5_data_done == 1 && write_coeffs_5_count == coeffs_5_diff_count - 1) || coeffs_5_diff_count == 0) begin
            write_coeffs_5_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_5_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_5_count = 0;
        end
        if (write_one_coeffs_5_data_done === 1) begin
            write_coeffs_5_count = write_coeffs_5_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_5_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_5_write_data_finish <= 0;
        end
        if (write_coeffs_5_run_flag == 1 && write_coeffs_5_count == coeffs_5_diff_count) begin
            coeffs_5_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_5
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_5_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_5_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_5_diff_count = 0;

        for (k = 0; k < coeffs_5_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_5_c_bitwidth < 32) begin
                    coeffs_5_data_tmp_reg = mem_coeffs_5[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_5_c_bitwidth) begin
                            coeffs_5_data_tmp_reg[j] = mem_coeffs_5[k][i*32 + j];
                        end
                        else begin
                            coeffs_5_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_5[k * four_byte_num  + i]!==coeffs_5_data_tmp_reg) begin
                coeffs_5_diff_count = coeffs_5_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_5
    integer write_coeffs_5_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_5_count;
    reg [31 : 0] coeffs_5_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_5_c_bitwidth;
    process_num = 6;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_6_finish <= 0;

        for (check_coeffs_5_count = 0; check_coeffs_5_count < coeffs_5_OPERATE_DEPTH; check_coeffs_5_count = check_coeffs_5_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_5_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_5 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_5_c_bitwidth < 32) begin
                        coeffs_5_data_tmp_reg = mem_coeffs_5[check_coeffs_5_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_5_c_bitwidth) begin
                                coeffs_5_data_tmp_reg[j] = mem_coeffs_5[check_coeffs_5_count][i*32 + j];
                            end
                            else begin
                                coeffs_5_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_5[check_coeffs_5_count * four_byte_num  + i]!==coeffs_5_data_tmp_reg) begin
                        image_mem_coeffs_5[check_coeffs_5_count * four_byte_num + i]=coeffs_5_data_tmp_reg;
                        write (coeffs_5_data_in_addr + check_coeffs_5_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_5_data_tmp_reg, write_coeffs_5_resp);
                        write_one_coeffs_5_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_5_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_6_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_6_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_6_c_bitwidth, coeffs_6_DEPTH, coeffs_6_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_6_run_flag <= 1; 
        end
        else if ((write_one_coeffs_6_data_done == 1 && write_coeffs_6_count == coeffs_6_diff_count - 1) || coeffs_6_diff_count == 0) begin
            write_coeffs_6_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_6_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_6_count = 0;
        end
        if (write_one_coeffs_6_data_done === 1) begin
            write_coeffs_6_count = write_coeffs_6_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_6_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_6_write_data_finish <= 0;
        end
        if (write_coeffs_6_run_flag == 1 && write_coeffs_6_count == coeffs_6_diff_count) begin
            coeffs_6_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_6
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_6_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_6_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_6_diff_count = 0;

        for (k = 0; k < coeffs_6_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_6_c_bitwidth < 32) begin
                    coeffs_6_data_tmp_reg = mem_coeffs_6[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_6_c_bitwidth) begin
                            coeffs_6_data_tmp_reg[j] = mem_coeffs_6[k][i*32 + j];
                        end
                        else begin
                            coeffs_6_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_6[k * four_byte_num  + i]!==coeffs_6_data_tmp_reg) begin
                coeffs_6_diff_count = coeffs_6_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_6
    integer write_coeffs_6_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_6_count;
    reg [31 : 0] coeffs_6_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_6_c_bitwidth;
    process_num = 7;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_7_finish <= 0;

        for (check_coeffs_6_count = 0; check_coeffs_6_count < coeffs_6_OPERATE_DEPTH; check_coeffs_6_count = check_coeffs_6_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_6_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_6 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_6_c_bitwidth < 32) begin
                        coeffs_6_data_tmp_reg = mem_coeffs_6[check_coeffs_6_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_6_c_bitwidth) begin
                                coeffs_6_data_tmp_reg[j] = mem_coeffs_6[check_coeffs_6_count][i*32 + j];
                            end
                            else begin
                                coeffs_6_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_6[check_coeffs_6_count * four_byte_num  + i]!==coeffs_6_data_tmp_reg) begin
                        image_mem_coeffs_6[check_coeffs_6_count * four_byte_num + i]=coeffs_6_data_tmp_reg;
                        write (coeffs_6_data_in_addr + check_coeffs_6_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_6_data_tmp_reg, write_coeffs_6_resp);
                        write_one_coeffs_6_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_6_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_7_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_7_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_7_c_bitwidth, coeffs_7_DEPTH, coeffs_7_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_7_run_flag <= 1; 
        end
        else if ((write_one_coeffs_7_data_done == 1 && write_coeffs_7_count == coeffs_7_diff_count - 1) || coeffs_7_diff_count == 0) begin
            write_coeffs_7_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_7_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_7_count = 0;
        end
        if (write_one_coeffs_7_data_done === 1) begin
            write_coeffs_7_count = write_coeffs_7_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_7_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_7_write_data_finish <= 0;
        end
        if (write_coeffs_7_run_flag == 1 && write_coeffs_7_count == coeffs_7_diff_count) begin
            coeffs_7_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_7
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_7_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_7_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_7_diff_count = 0;

        for (k = 0; k < coeffs_7_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_7_c_bitwidth < 32) begin
                    coeffs_7_data_tmp_reg = mem_coeffs_7[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_7_c_bitwidth) begin
                            coeffs_7_data_tmp_reg[j] = mem_coeffs_7[k][i*32 + j];
                        end
                        else begin
                            coeffs_7_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_7[k * four_byte_num  + i]!==coeffs_7_data_tmp_reg) begin
                coeffs_7_diff_count = coeffs_7_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_7
    integer write_coeffs_7_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_7_count;
    reg [31 : 0] coeffs_7_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_7_c_bitwidth;
    process_num = 8;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_8_finish <= 0;

        for (check_coeffs_7_count = 0; check_coeffs_7_count < coeffs_7_OPERATE_DEPTH; check_coeffs_7_count = check_coeffs_7_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_7_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_7 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_7_c_bitwidth < 32) begin
                        coeffs_7_data_tmp_reg = mem_coeffs_7[check_coeffs_7_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_7_c_bitwidth) begin
                                coeffs_7_data_tmp_reg[j] = mem_coeffs_7[check_coeffs_7_count][i*32 + j];
                            end
                            else begin
                                coeffs_7_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_7[check_coeffs_7_count * four_byte_num  + i]!==coeffs_7_data_tmp_reg) begin
                        image_mem_coeffs_7[check_coeffs_7_count * four_byte_num + i]=coeffs_7_data_tmp_reg;
                        write (coeffs_7_data_in_addr + check_coeffs_7_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_7_data_tmp_reg, write_coeffs_7_resp);
                        write_one_coeffs_7_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_7_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_8_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_8_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_8_c_bitwidth, coeffs_8_DEPTH, coeffs_8_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_8_run_flag <= 1; 
        end
        else if ((write_one_coeffs_8_data_done == 1 && write_coeffs_8_count == coeffs_8_diff_count - 1) || coeffs_8_diff_count == 0) begin
            write_coeffs_8_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_8_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_8_count = 0;
        end
        if (write_one_coeffs_8_data_done === 1) begin
            write_coeffs_8_count = write_coeffs_8_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_8_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_8_write_data_finish <= 0;
        end
        if (write_coeffs_8_run_flag == 1 && write_coeffs_8_count == coeffs_8_diff_count) begin
            coeffs_8_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_8
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_8_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_8_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_8_diff_count = 0;

        for (k = 0; k < coeffs_8_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_8_c_bitwidth < 32) begin
                    coeffs_8_data_tmp_reg = mem_coeffs_8[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_8_c_bitwidth) begin
                            coeffs_8_data_tmp_reg[j] = mem_coeffs_8[k][i*32 + j];
                        end
                        else begin
                            coeffs_8_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_8[k * four_byte_num  + i]!==coeffs_8_data_tmp_reg) begin
                coeffs_8_diff_count = coeffs_8_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_8
    integer write_coeffs_8_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_8_count;
    reg [31 : 0] coeffs_8_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_8_c_bitwidth;
    process_num = 9;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_9_finish <= 0;

        for (check_coeffs_8_count = 0; check_coeffs_8_count < coeffs_8_OPERATE_DEPTH; check_coeffs_8_count = check_coeffs_8_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_8_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_8 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_8_c_bitwidth < 32) begin
                        coeffs_8_data_tmp_reg = mem_coeffs_8[check_coeffs_8_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_8_c_bitwidth) begin
                                coeffs_8_data_tmp_reg[j] = mem_coeffs_8[check_coeffs_8_count][i*32 + j];
                            end
                            else begin
                                coeffs_8_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_8[check_coeffs_8_count * four_byte_num  + i]!==coeffs_8_data_tmp_reg) begin
                        image_mem_coeffs_8[check_coeffs_8_count * four_byte_num + i]=coeffs_8_data_tmp_reg;
                        write (coeffs_8_data_in_addr + check_coeffs_8_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_8_data_tmp_reg, write_coeffs_8_resp);
                        write_one_coeffs_8_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_8_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_9_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_9_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_9_c_bitwidth, coeffs_9_DEPTH, coeffs_9_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_9_run_flag <= 1; 
        end
        else if ((write_one_coeffs_9_data_done == 1 && write_coeffs_9_count == coeffs_9_diff_count - 1) || coeffs_9_diff_count == 0) begin
            write_coeffs_9_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_9_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_9_count = 0;
        end
        if (write_one_coeffs_9_data_done === 1) begin
            write_coeffs_9_count = write_coeffs_9_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_9_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_9_write_data_finish <= 0;
        end
        if (write_coeffs_9_run_flag == 1 && write_coeffs_9_count == coeffs_9_diff_count) begin
            coeffs_9_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_9
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_9_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_9_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_9_diff_count = 0;

        for (k = 0; k < coeffs_9_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_9_c_bitwidth < 32) begin
                    coeffs_9_data_tmp_reg = mem_coeffs_9[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_9_c_bitwidth) begin
                            coeffs_9_data_tmp_reg[j] = mem_coeffs_9[k][i*32 + j];
                        end
                        else begin
                            coeffs_9_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_9[k * four_byte_num  + i]!==coeffs_9_data_tmp_reg) begin
                coeffs_9_diff_count = coeffs_9_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_9
    integer write_coeffs_9_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_9_count;
    reg [31 : 0] coeffs_9_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_9_c_bitwidth;
    process_num = 10;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_10_finish <= 0;

        for (check_coeffs_9_count = 0; check_coeffs_9_count < coeffs_9_OPERATE_DEPTH; check_coeffs_9_count = check_coeffs_9_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_9_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_9 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_9_c_bitwidth < 32) begin
                        coeffs_9_data_tmp_reg = mem_coeffs_9[check_coeffs_9_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_9_c_bitwidth) begin
                                coeffs_9_data_tmp_reg[j] = mem_coeffs_9[check_coeffs_9_count][i*32 + j];
                            end
                            else begin
                                coeffs_9_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_9[check_coeffs_9_count * four_byte_num  + i]!==coeffs_9_data_tmp_reg) begin
                        image_mem_coeffs_9[check_coeffs_9_count * four_byte_num + i]=coeffs_9_data_tmp_reg;
                        write (coeffs_9_data_in_addr + check_coeffs_9_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_9_data_tmp_reg, write_coeffs_9_resp);
                        write_one_coeffs_9_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_9_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_10_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_10_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_10_c_bitwidth, coeffs_10_DEPTH, coeffs_10_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_10_run_flag <= 1; 
        end
        else if ((write_one_coeffs_10_data_done == 1 && write_coeffs_10_count == coeffs_10_diff_count - 1) || coeffs_10_diff_count == 0) begin
            write_coeffs_10_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_10_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_10_count = 0;
        end
        if (write_one_coeffs_10_data_done === 1) begin
            write_coeffs_10_count = write_coeffs_10_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_10_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_10_write_data_finish <= 0;
        end
        if (write_coeffs_10_run_flag == 1 && write_coeffs_10_count == coeffs_10_diff_count) begin
            coeffs_10_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_10
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_10_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_10_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_10_diff_count = 0;

        for (k = 0; k < coeffs_10_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_10_c_bitwidth < 32) begin
                    coeffs_10_data_tmp_reg = mem_coeffs_10[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_10_c_bitwidth) begin
                            coeffs_10_data_tmp_reg[j] = mem_coeffs_10[k][i*32 + j];
                        end
                        else begin
                            coeffs_10_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_10[k * four_byte_num  + i]!==coeffs_10_data_tmp_reg) begin
                coeffs_10_diff_count = coeffs_10_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_10
    integer write_coeffs_10_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_10_count;
    reg [31 : 0] coeffs_10_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_10_c_bitwidth;
    process_num = 11;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_11_finish <= 0;

        for (check_coeffs_10_count = 0; check_coeffs_10_count < coeffs_10_OPERATE_DEPTH; check_coeffs_10_count = check_coeffs_10_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_10_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_10 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_10_c_bitwidth < 32) begin
                        coeffs_10_data_tmp_reg = mem_coeffs_10[check_coeffs_10_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_10_c_bitwidth) begin
                                coeffs_10_data_tmp_reg[j] = mem_coeffs_10[check_coeffs_10_count][i*32 + j];
                            end
                            else begin
                                coeffs_10_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_10[check_coeffs_10_count * four_byte_num  + i]!==coeffs_10_data_tmp_reg) begin
                        image_mem_coeffs_10[check_coeffs_10_count * four_byte_num + i]=coeffs_10_data_tmp_reg;
                        write (coeffs_10_data_in_addr + check_coeffs_10_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_10_data_tmp_reg, write_coeffs_10_resp);
                        write_one_coeffs_10_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_10_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_11_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_11_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_11_c_bitwidth, coeffs_11_DEPTH, coeffs_11_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_11_run_flag <= 1; 
        end
        else if ((write_one_coeffs_11_data_done == 1 && write_coeffs_11_count == coeffs_11_diff_count - 1) || coeffs_11_diff_count == 0) begin
            write_coeffs_11_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_11_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_11_count = 0;
        end
        if (write_one_coeffs_11_data_done === 1) begin
            write_coeffs_11_count = write_coeffs_11_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_11_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_11_write_data_finish <= 0;
        end
        if (write_coeffs_11_run_flag == 1 && write_coeffs_11_count == coeffs_11_diff_count) begin
            coeffs_11_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_11
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_11_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_11_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_11_diff_count = 0;

        for (k = 0; k < coeffs_11_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_11_c_bitwidth < 32) begin
                    coeffs_11_data_tmp_reg = mem_coeffs_11[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_11_c_bitwidth) begin
                            coeffs_11_data_tmp_reg[j] = mem_coeffs_11[k][i*32 + j];
                        end
                        else begin
                            coeffs_11_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_11[k * four_byte_num  + i]!==coeffs_11_data_tmp_reg) begin
                coeffs_11_diff_count = coeffs_11_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_11
    integer write_coeffs_11_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_11_count;
    reg [31 : 0] coeffs_11_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_11_c_bitwidth;
    process_num = 12;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_12_finish <= 0;

        for (check_coeffs_11_count = 0; check_coeffs_11_count < coeffs_11_OPERATE_DEPTH; check_coeffs_11_count = check_coeffs_11_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_11_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_11 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_11_c_bitwidth < 32) begin
                        coeffs_11_data_tmp_reg = mem_coeffs_11[check_coeffs_11_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_11_c_bitwidth) begin
                                coeffs_11_data_tmp_reg[j] = mem_coeffs_11[check_coeffs_11_count][i*32 + j];
                            end
                            else begin
                                coeffs_11_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_11[check_coeffs_11_count * four_byte_num  + i]!==coeffs_11_data_tmp_reg) begin
                        image_mem_coeffs_11[check_coeffs_11_count * four_byte_num + i]=coeffs_11_data_tmp_reg;
                        write (coeffs_11_data_in_addr + check_coeffs_11_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_11_data_tmp_reg, write_coeffs_11_resp);
                        write_one_coeffs_11_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_11_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_12_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_12_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_12_c_bitwidth, coeffs_12_DEPTH, coeffs_12_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_12_run_flag <= 1; 
        end
        else if ((write_one_coeffs_12_data_done == 1 && write_coeffs_12_count == coeffs_12_diff_count - 1) || coeffs_12_diff_count == 0) begin
            write_coeffs_12_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_12_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_12_count = 0;
        end
        if (write_one_coeffs_12_data_done === 1) begin
            write_coeffs_12_count = write_coeffs_12_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_12_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_12_write_data_finish <= 0;
        end
        if (write_coeffs_12_run_flag == 1 && write_coeffs_12_count == coeffs_12_diff_count) begin
            coeffs_12_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_12
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_12_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_12_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_12_diff_count = 0;

        for (k = 0; k < coeffs_12_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_12_c_bitwidth < 32) begin
                    coeffs_12_data_tmp_reg = mem_coeffs_12[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_12_c_bitwidth) begin
                            coeffs_12_data_tmp_reg[j] = mem_coeffs_12[k][i*32 + j];
                        end
                        else begin
                            coeffs_12_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_12[k * four_byte_num  + i]!==coeffs_12_data_tmp_reg) begin
                coeffs_12_diff_count = coeffs_12_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_12
    integer write_coeffs_12_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_12_count;
    reg [31 : 0] coeffs_12_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_12_c_bitwidth;
    process_num = 13;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_13_finish <= 0;

        for (check_coeffs_12_count = 0; check_coeffs_12_count < coeffs_12_OPERATE_DEPTH; check_coeffs_12_count = check_coeffs_12_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_12_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_12 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_12_c_bitwidth < 32) begin
                        coeffs_12_data_tmp_reg = mem_coeffs_12[check_coeffs_12_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_12_c_bitwidth) begin
                                coeffs_12_data_tmp_reg[j] = mem_coeffs_12[check_coeffs_12_count][i*32 + j];
                            end
                            else begin
                                coeffs_12_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_12[check_coeffs_12_count * four_byte_num  + i]!==coeffs_12_data_tmp_reg) begin
                        image_mem_coeffs_12[check_coeffs_12_count * four_byte_num + i]=coeffs_12_data_tmp_reg;
                        write (coeffs_12_data_in_addr + check_coeffs_12_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_12_data_tmp_reg, write_coeffs_12_resp);
                        write_one_coeffs_12_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_12_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_13_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_13_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_13_c_bitwidth, coeffs_13_DEPTH, coeffs_13_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_13_run_flag <= 1; 
        end
        else if ((write_one_coeffs_13_data_done == 1 && write_coeffs_13_count == coeffs_13_diff_count - 1) || coeffs_13_diff_count == 0) begin
            write_coeffs_13_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_13_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_13_count = 0;
        end
        if (write_one_coeffs_13_data_done === 1) begin
            write_coeffs_13_count = write_coeffs_13_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_13_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_13_write_data_finish <= 0;
        end
        if (write_coeffs_13_run_flag == 1 && write_coeffs_13_count == coeffs_13_diff_count) begin
            coeffs_13_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_13
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_13_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_13_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_13_diff_count = 0;

        for (k = 0; k < coeffs_13_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_13_c_bitwidth < 32) begin
                    coeffs_13_data_tmp_reg = mem_coeffs_13[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_13_c_bitwidth) begin
                            coeffs_13_data_tmp_reg[j] = mem_coeffs_13[k][i*32 + j];
                        end
                        else begin
                            coeffs_13_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_13[k * four_byte_num  + i]!==coeffs_13_data_tmp_reg) begin
                coeffs_13_diff_count = coeffs_13_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_13
    integer write_coeffs_13_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_13_count;
    reg [31 : 0] coeffs_13_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_13_c_bitwidth;
    process_num = 14;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_14_finish <= 0;

        for (check_coeffs_13_count = 0; check_coeffs_13_count < coeffs_13_OPERATE_DEPTH; check_coeffs_13_count = check_coeffs_13_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_13_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_13 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_13_c_bitwidth < 32) begin
                        coeffs_13_data_tmp_reg = mem_coeffs_13[check_coeffs_13_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_13_c_bitwidth) begin
                                coeffs_13_data_tmp_reg[j] = mem_coeffs_13[check_coeffs_13_count][i*32 + j];
                            end
                            else begin
                                coeffs_13_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_13[check_coeffs_13_count * four_byte_num  + i]!==coeffs_13_data_tmp_reg) begin
                        image_mem_coeffs_13[check_coeffs_13_count * four_byte_num + i]=coeffs_13_data_tmp_reg;
                        write (coeffs_13_data_in_addr + check_coeffs_13_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_13_data_tmp_reg, write_coeffs_13_resp);
                        write_one_coeffs_13_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_13_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_14_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_14_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_14_c_bitwidth, coeffs_14_DEPTH, coeffs_14_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_14_run_flag <= 1; 
        end
        else if ((write_one_coeffs_14_data_done == 1 && write_coeffs_14_count == coeffs_14_diff_count - 1) || coeffs_14_diff_count == 0) begin
            write_coeffs_14_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_14_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_14_count = 0;
        end
        if (write_one_coeffs_14_data_done === 1) begin
            write_coeffs_14_count = write_coeffs_14_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_14_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_14_write_data_finish <= 0;
        end
        if (write_coeffs_14_run_flag == 1 && write_coeffs_14_count == coeffs_14_diff_count) begin
            coeffs_14_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_14
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_14_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_14_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_14_diff_count = 0;

        for (k = 0; k < coeffs_14_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_14_c_bitwidth < 32) begin
                    coeffs_14_data_tmp_reg = mem_coeffs_14[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_14_c_bitwidth) begin
                            coeffs_14_data_tmp_reg[j] = mem_coeffs_14[k][i*32 + j];
                        end
                        else begin
                            coeffs_14_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_14[k * four_byte_num  + i]!==coeffs_14_data_tmp_reg) begin
                coeffs_14_diff_count = coeffs_14_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_14
    integer write_coeffs_14_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_14_count;
    reg [31 : 0] coeffs_14_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_14_c_bitwidth;
    process_num = 15;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_15_finish <= 0;

        for (check_coeffs_14_count = 0; check_coeffs_14_count < coeffs_14_OPERATE_DEPTH; check_coeffs_14_count = check_coeffs_14_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_14_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_14 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_14_c_bitwidth < 32) begin
                        coeffs_14_data_tmp_reg = mem_coeffs_14[check_coeffs_14_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_14_c_bitwidth) begin
                                coeffs_14_data_tmp_reg[j] = mem_coeffs_14[check_coeffs_14_count][i*32 + j];
                            end
                            else begin
                                coeffs_14_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_14[check_coeffs_14_count * four_byte_num  + i]!==coeffs_14_data_tmp_reg) begin
                        image_mem_coeffs_14[check_coeffs_14_count * four_byte_num + i]=coeffs_14_data_tmp_reg;
                        write (coeffs_14_data_in_addr + check_coeffs_14_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_14_data_tmp_reg, write_coeffs_14_resp);
                        write_one_coeffs_14_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_14_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_15_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_15_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_15_c_bitwidth, coeffs_15_DEPTH, coeffs_15_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_15_run_flag <= 1; 
        end
        else if ((write_one_coeffs_15_data_done == 1 && write_coeffs_15_count == coeffs_15_diff_count - 1) || coeffs_15_diff_count == 0) begin
            write_coeffs_15_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_15_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_15_count = 0;
        end
        if (write_one_coeffs_15_data_done === 1) begin
            write_coeffs_15_count = write_coeffs_15_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_15_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_15_write_data_finish <= 0;
        end
        if (write_coeffs_15_run_flag == 1 && write_coeffs_15_count == coeffs_15_diff_count) begin
            coeffs_15_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_15
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_15_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_15_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_15_diff_count = 0;

        for (k = 0; k < coeffs_15_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_15_c_bitwidth < 32) begin
                    coeffs_15_data_tmp_reg = mem_coeffs_15[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_15_c_bitwidth) begin
                            coeffs_15_data_tmp_reg[j] = mem_coeffs_15[k][i*32 + j];
                        end
                        else begin
                            coeffs_15_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_15[k * four_byte_num  + i]!==coeffs_15_data_tmp_reg) begin
                coeffs_15_diff_count = coeffs_15_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_15
    integer write_coeffs_15_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_15_count;
    reg [31 : 0] coeffs_15_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_15_c_bitwidth;
    process_num = 16;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_16_finish <= 0;

        for (check_coeffs_15_count = 0; check_coeffs_15_count < coeffs_15_OPERATE_DEPTH; check_coeffs_15_count = check_coeffs_15_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_15_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_15 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_15_c_bitwidth < 32) begin
                        coeffs_15_data_tmp_reg = mem_coeffs_15[check_coeffs_15_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_15_c_bitwidth) begin
                                coeffs_15_data_tmp_reg[j] = mem_coeffs_15[check_coeffs_15_count][i*32 + j];
                            end
                            else begin
                                coeffs_15_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_15[check_coeffs_15_count * four_byte_num  + i]!==coeffs_15_data_tmp_reg) begin
                        image_mem_coeffs_15[check_coeffs_15_count * four_byte_num + i]=coeffs_15_data_tmp_reg;
                        write (coeffs_15_data_in_addr + check_coeffs_15_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_15_data_tmp_reg, write_coeffs_15_resp);
                        write_one_coeffs_15_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_15_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_16_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_16_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_16_c_bitwidth, coeffs_16_DEPTH, coeffs_16_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_16_run_flag <= 1; 
        end
        else if ((write_one_coeffs_16_data_done == 1 && write_coeffs_16_count == coeffs_16_diff_count - 1) || coeffs_16_diff_count == 0) begin
            write_coeffs_16_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_16_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_16_count = 0;
        end
        if (write_one_coeffs_16_data_done === 1) begin
            write_coeffs_16_count = write_coeffs_16_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_16_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_16_write_data_finish <= 0;
        end
        if (write_coeffs_16_run_flag == 1 && write_coeffs_16_count == coeffs_16_diff_count) begin
            coeffs_16_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_16
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_16_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_16_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_16_diff_count = 0;

        for (k = 0; k < coeffs_16_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_16_c_bitwidth < 32) begin
                    coeffs_16_data_tmp_reg = mem_coeffs_16[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_16_c_bitwidth) begin
                            coeffs_16_data_tmp_reg[j] = mem_coeffs_16[k][i*32 + j];
                        end
                        else begin
                            coeffs_16_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_16[k * four_byte_num  + i]!==coeffs_16_data_tmp_reg) begin
                coeffs_16_diff_count = coeffs_16_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_16
    integer write_coeffs_16_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_16_count;
    reg [31 : 0] coeffs_16_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_16_c_bitwidth;
    process_num = 17;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_17_finish <= 0;

        for (check_coeffs_16_count = 0; check_coeffs_16_count < coeffs_16_OPERATE_DEPTH; check_coeffs_16_count = check_coeffs_16_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_16_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_16 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_16_c_bitwidth < 32) begin
                        coeffs_16_data_tmp_reg = mem_coeffs_16[check_coeffs_16_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_16_c_bitwidth) begin
                                coeffs_16_data_tmp_reg[j] = mem_coeffs_16[check_coeffs_16_count][i*32 + j];
                            end
                            else begin
                                coeffs_16_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_16[check_coeffs_16_count * four_byte_num  + i]!==coeffs_16_data_tmp_reg) begin
                        image_mem_coeffs_16[check_coeffs_16_count * four_byte_num + i]=coeffs_16_data_tmp_reg;
                        write (coeffs_16_data_in_addr + check_coeffs_16_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_16_data_tmp_reg, write_coeffs_16_resp);
                        write_one_coeffs_16_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_16_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_17_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_17_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_17_c_bitwidth, coeffs_17_DEPTH, coeffs_17_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_17_run_flag <= 1; 
        end
        else if ((write_one_coeffs_17_data_done == 1 && write_coeffs_17_count == coeffs_17_diff_count - 1) || coeffs_17_diff_count == 0) begin
            write_coeffs_17_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_17_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_17_count = 0;
        end
        if (write_one_coeffs_17_data_done === 1) begin
            write_coeffs_17_count = write_coeffs_17_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_17_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_17_write_data_finish <= 0;
        end
        if (write_coeffs_17_run_flag == 1 && write_coeffs_17_count == coeffs_17_diff_count) begin
            coeffs_17_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_17
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_17_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_17_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_17_diff_count = 0;

        for (k = 0; k < coeffs_17_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_17_c_bitwidth < 32) begin
                    coeffs_17_data_tmp_reg = mem_coeffs_17[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_17_c_bitwidth) begin
                            coeffs_17_data_tmp_reg[j] = mem_coeffs_17[k][i*32 + j];
                        end
                        else begin
                            coeffs_17_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_17[k * four_byte_num  + i]!==coeffs_17_data_tmp_reg) begin
                coeffs_17_diff_count = coeffs_17_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_17
    integer write_coeffs_17_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_17_count;
    reg [31 : 0] coeffs_17_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_17_c_bitwidth;
    process_num = 18;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_18_finish <= 0;

        for (check_coeffs_17_count = 0; check_coeffs_17_count < coeffs_17_OPERATE_DEPTH; check_coeffs_17_count = check_coeffs_17_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_17_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_17 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_17_c_bitwidth < 32) begin
                        coeffs_17_data_tmp_reg = mem_coeffs_17[check_coeffs_17_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_17_c_bitwidth) begin
                                coeffs_17_data_tmp_reg[j] = mem_coeffs_17[check_coeffs_17_count][i*32 + j];
                            end
                            else begin
                                coeffs_17_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_17[check_coeffs_17_count * four_byte_num  + i]!==coeffs_17_data_tmp_reg) begin
                        image_mem_coeffs_17[check_coeffs_17_count * four_byte_num + i]=coeffs_17_data_tmp_reg;
                        write (coeffs_17_data_in_addr + check_coeffs_17_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_17_data_tmp_reg, write_coeffs_17_resp);
                        write_one_coeffs_17_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_17_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_18_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_18_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_18_c_bitwidth, coeffs_18_DEPTH, coeffs_18_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_18_run_flag <= 1; 
        end
        else if ((write_one_coeffs_18_data_done == 1 && write_coeffs_18_count == coeffs_18_diff_count - 1) || coeffs_18_diff_count == 0) begin
            write_coeffs_18_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_18_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_18_count = 0;
        end
        if (write_one_coeffs_18_data_done === 1) begin
            write_coeffs_18_count = write_coeffs_18_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_18_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_18_write_data_finish <= 0;
        end
        if (write_coeffs_18_run_flag == 1 && write_coeffs_18_count == coeffs_18_diff_count) begin
            coeffs_18_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_18
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_18_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_18_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_18_diff_count = 0;

        for (k = 0; k < coeffs_18_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_18_c_bitwidth < 32) begin
                    coeffs_18_data_tmp_reg = mem_coeffs_18[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_18_c_bitwidth) begin
                            coeffs_18_data_tmp_reg[j] = mem_coeffs_18[k][i*32 + j];
                        end
                        else begin
                            coeffs_18_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_18[k * four_byte_num  + i]!==coeffs_18_data_tmp_reg) begin
                coeffs_18_diff_count = coeffs_18_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_18
    integer write_coeffs_18_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_18_count;
    reg [31 : 0] coeffs_18_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_18_c_bitwidth;
    process_num = 19;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_19_finish <= 0;

        for (check_coeffs_18_count = 0; check_coeffs_18_count < coeffs_18_OPERATE_DEPTH; check_coeffs_18_count = check_coeffs_18_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_18_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_18 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_18_c_bitwidth < 32) begin
                        coeffs_18_data_tmp_reg = mem_coeffs_18[check_coeffs_18_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_18_c_bitwidth) begin
                                coeffs_18_data_tmp_reg[j] = mem_coeffs_18[check_coeffs_18_count][i*32 + j];
                            end
                            else begin
                                coeffs_18_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_18[check_coeffs_18_count * four_byte_num  + i]!==coeffs_18_data_tmp_reg) begin
                        image_mem_coeffs_18[check_coeffs_18_count * four_byte_num + i]=coeffs_18_data_tmp_reg;
                        write (coeffs_18_data_in_addr + check_coeffs_18_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_18_data_tmp_reg, write_coeffs_18_resp);
                        write_one_coeffs_18_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_18_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_19_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_19_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_19_c_bitwidth, coeffs_19_DEPTH, coeffs_19_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_19_run_flag <= 1; 
        end
        else if ((write_one_coeffs_19_data_done == 1 && write_coeffs_19_count == coeffs_19_diff_count - 1) || coeffs_19_diff_count == 0) begin
            write_coeffs_19_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_19_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_19_count = 0;
        end
        if (write_one_coeffs_19_data_done === 1) begin
            write_coeffs_19_count = write_coeffs_19_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_19_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_19_write_data_finish <= 0;
        end
        if (write_coeffs_19_run_flag == 1 && write_coeffs_19_count == coeffs_19_diff_count) begin
            coeffs_19_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_19
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_19_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_19_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_19_diff_count = 0;

        for (k = 0; k < coeffs_19_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_19_c_bitwidth < 32) begin
                    coeffs_19_data_tmp_reg = mem_coeffs_19[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_19_c_bitwidth) begin
                            coeffs_19_data_tmp_reg[j] = mem_coeffs_19[k][i*32 + j];
                        end
                        else begin
                            coeffs_19_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_19[k * four_byte_num  + i]!==coeffs_19_data_tmp_reg) begin
                coeffs_19_diff_count = coeffs_19_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_19
    integer write_coeffs_19_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_19_count;
    reg [31 : 0] coeffs_19_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_19_c_bitwidth;
    process_num = 20;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_20_finish <= 0;

        for (check_coeffs_19_count = 0; check_coeffs_19_count < coeffs_19_OPERATE_DEPTH; check_coeffs_19_count = check_coeffs_19_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_19_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_19 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_19_c_bitwidth < 32) begin
                        coeffs_19_data_tmp_reg = mem_coeffs_19[check_coeffs_19_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_19_c_bitwidth) begin
                                coeffs_19_data_tmp_reg[j] = mem_coeffs_19[check_coeffs_19_count][i*32 + j];
                            end
                            else begin
                                coeffs_19_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_19[check_coeffs_19_count * four_byte_num  + i]!==coeffs_19_data_tmp_reg) begin
                        image_mem_coeffs_19[check_coeffs_19_count * four_byte_num + i]=coeffs_19_data_tmp_reg;
                        write (coeffs_19_data_in_addr + check_coeffs_19_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_19_data_tmp_reg, write_coeffs_19_resp);
                        write_one_coeffs_19_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_19_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_20_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_20_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_20_c_bitwidth, coeffs_20_DEPTH, coeffs_20_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_20_run_flag <= 1; 
        end
        else if ((write_one_coeffs_20_data_done == 1 && write_coeffs_20_count == coeffs_20_diff_count - 1) || coeffs_20_diff_count == 0) begin
            write_coeffs_20_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_20_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_20_count = 0;
        end
        if (write_one_coeffs_20_data_done === 1) begin
            write_coeffs_20_count = write_coeffs_20_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_20_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_20_write_data_finish <= 0;
        end
        if (write_coeffs_20_run_flag == 1 && write_coeffs_20_count == coeffs_20_diff_count) begin
            coeffs_20_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_20
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_20_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_20_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_20_diff_count = 0;

        for (k = 0; k < coeffs_20_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_20_c_bitwidth < 32) begin
                    coeffs_20_data_tmp_reg = mem_coeffs_20[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_20_c_bitwidth) begin
                            coeffs_20_data_tmp_reg[j] = mem_coeffs_20[k][i*32 + j];
                        end
                        else begin
                            coeffs_20_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_20[k * four_byte_num  + i]!==coeffs_20_data_tmp_reg) begin
                coeffs_20_diff_count = coeffs_20_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_20
    integer write_coeffs_20_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_20_count;
    reg [31 : 0] coeffs_20_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_20_c_bitwidth;
    process_num = 21;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_21_finish <= 0;

        for (check_coeffs_20_count = 0; check_coeffs_20_count < coeffs_20_OPERATE_DEPTH; check_coeffs_20_count = check_coeffs_20_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_20_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_20 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_20_c_bitwidth < 32) begin
                        coeffs_20_data_tmp_reg = mem_coeffs_20[check_coeffs_20_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_20_c_bitwidth) begin
                                coeffs_20_data_tmp_reg[j] = mem_coeffs_20[check_coeffs_20_count][i*32 + j];
                            end
                            else begin
                                coeffs_20_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_20[check_coeffs_20_count * four_byte_num  + i]!==coeffs_20_data_tmp_reg) begin
                        image_mem_coeffs_20[check_coeffs_20_count * four_byte_num + i]=coeffs_20_data_tmp_reg;
                        write (coeffs_20_data_in_addr + check_coeffs_20_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_20_data_tmp_reg, write_coeffs_20_resp);
                        write_one_coeffs_20_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_20_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_21_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_21_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_21_c_bitwidth, coeffs_21_DEPTH, coeffs_21_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_21_run_flag <= 1; 
        end
        else if ((write_one_coeffs_21_data_done == 1 && write_coeffs_21_count == coeffs_21_diff_count - 1) || coeffs_21_diff_count == 0) begin
            write_coeffs_21_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_21_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_21_count = 0;
        end
        if (write_one_coeffs_21_data_done === 1) begin
            write_coeffs_21_count = write_coeffs_21_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_21_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_21_write_data_finish <= 0;
        end
        if (write_coeffs_21_run_flag == 1 && write_coeffs_21_count == coeffs_21_diff_count) begin
            coeffs_21_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_21
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_21_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_21_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_21_diff_count = 0;

        for (k = 0; k < coeffs_21_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_21_c_bitwidth < 32) begin
                    coeffs_21_data_tmp_reg = mem_coeffs_21[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_21_c_bitwidth) begin
                            coeffs_21_data_tmp_reg[j] = mem_coeffs_21[k][i*32 + j];
                        end
                        else begin
                            coeffs_21_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_21[k * four_byte_num  + i]!==coeffs_21_data_tmp_reg) begin
                coeffs_21_diff_count = coeffs_21_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_21
    integer write_coeffs_21_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_21_count;
    reg [31 : 0] coeffs_21_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_21_c_bitwidth;
    process_num = 22;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_22_finish <= 0;

        for (check_coeffs_21_count = 0; check_coeffs_21_count < coeffs_21_OPERATE_DEPTH; check_coeffs_21_count = check_coeffs_21_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_21_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_21 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_21_c_bitwidth < 32) begin
                        coeffs_21_data_tmp_reg = mem_coeffs_21[check_coeffs_21_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_21_c_bitwidth) begin
                                coeffs_21_data_tmp_reg[j] = mem_coeffs_21[check_coeffs_21_count][i*32 + j];
                            end
                            else begin
                                coeffs_21_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_21[check_coeffs_21_count * four_byte_num  + i]!==coeffs_21_data_tmp_reg) begin
                        image_mem_coeffs_21[check_coeffs_21_count * four_byte_num + i]=coeffs_21_data_tmp_reg;
                        write (coeffs_21_data_in_addr + check_coeffs_21_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_21_data_tmp_reg, write_coeffs_21_resp);
                        write_one_coeffs_21_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_21_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_22_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_22_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_22_c_bitwidth, coeffs_22_DEPTH, coeffs_22_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_22_run_flag <= 1; 
        end
        else if ((write_one_coeffs_22_data_done == 1 && write_coeffs_22_count == coeffs_22_diff_count - 1) || coeffs_22_diff_count == 0) begin
            write_coeffs_22_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_22_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_22_count = 0;
        end
        if (write_one_coeffs_22_data_done === 1) begin
            write_coeffs_22_count = write_coeffs_22_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_22_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_22_write_data_finish <= 0;
        end
        if (write_coeffs_22_run_flag == 1 && write_coeffs_22_count == coeffs_22_diff_count) begin
            coeffs_22_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_22
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_22_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_22_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_22_diff_count = 0;

        for (k = 0; k < coeffs_22_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_22_c_bitwidth < 32) begin
                    coeffs_22_data_tmp_reg = mem_coeffs_22[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_22_c_bitwidth) begin
                            coeffs_22_data_tmp_reg[j] = mem_coeffs_22[k][i*32 + j];
                        end
                        else begin
                            coeffs_22_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_22[k * four_byte_num  + i]!==coeffs_22_data_tmp_reg) begin
                coeffs_22_diff_count = coeffs_22_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_22
    integer write_coeffs_22_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_22_count;
    reg [31 : 0] coeffs_22_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_22_c_bitwidth;
    process_num = 23;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_23_finish <= 0;

        for (check_coeffs_22_count = 0; check_coeffs_22_count < coeffs_22_OPERATE_DEPTH; check_coeffs_22_count = check_coeffs_22_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_22_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_22 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_22_c_bitwidth < 32) begin
                        coeffs_22_data_tmp_reg = mem_coeffs_22[check_coeffs_22_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_22_c_bitwidth) begin
                                coeffs_22_data_tmp_reg[j] = mem_coeffs_22[check_coeffs_22_count][i*32 + j];
                            end
                            else begin
                                coeffs_22_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_22[check_coeffs_22_count * four_byte_num  + i]!==coeffs_22_data_tmp_reg) begin
                        image_mem_coeffs_22[check_coeffs_22_count * four_byte_num + i]=coeffs_22_data_tmp_reg;
                        write (coeffs_22_data_in_addr + check_coeffs_22_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_22_data_tmp_reg, write_coeffs_22_resp);
                        write_one_coeffs_22_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_22_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_23_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_23_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_23_c_bitwidth, coeffs_23_DEPTH, coeffs_23_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_23_run_flag <= 1; 
        end
        else if ((write_one_coeffs_23_data_done == 1 && write_coeffs_23_count == coeffs_23_diff_count - 1) || coeffs_23_diff_count == 0) begin
            write_coeffs_23_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_23_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_23_count = 0;
        end
        if (write_one_coeffs_23_data_done === 1) begin
            write_coeffs_23_count = write_coeffs_23_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_23_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_23_write_data_finish <= 0;
        end
        if (write_coeffs_23_run_flag == 1 && write_coeffs_23_count == coeffs_23_diff_count) begin
            coeffs_23_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_23
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_23_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_23_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_23_diff_count = 0;

        for (k = 0; k < coeffs_23_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_23_c_bitwidth < 32) begin
                    coeffs_23_data_tmp_reg = mem_coeffs_23[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_23_c_bitwidth) begin
                            coeffs_23_data_tmp_reg[j] = mem_coeffs_23[k][i*32 + j];
                        end
                        else begin
                            coeffs_23_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_23[k * four_byte_num  + i]!==coeffs_23_data_tmp_reg) begin
                coeffs_23_diff_count = coeffs_23_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_23
    integer write_coeffs_23_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_23_count;
    reg [31 : 0] coeffs_23_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_23_c_bitwidth;
    process_num = 24;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_24_finish <= 0;

        for (check_coeffs_23_count = 0; check_coeffs_23_count < coeffs_23_OPERATE_DEPTH; check_coeffs_23_count = check_coeffs_23_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_23_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_23 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_23_c_bitwidth < 32) begin
                        coeffs_23_data_tmp_reg = mem_coeffs_23[check_coeffs_23_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_23_c_bitwidth) begin
                                coeffs_23_data_tmp_reg[j] = mem_coeffs_23[check_coeffs_23_count][i*32 + j];
                            end
                            else begin
                                coeffs_23_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_23[check_coeffs_23_count * four_byte_num  + i]!==coeffs_23_data_tmp_reg) begin
                        image_mem_coeffs_23[check_coeffs_23_count * four_byte_num + i]=coeffs_23_data_tmp_reg;
                        write (coeffs_23_data_in_addr + check_coeffs_23_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_23_data_tmp_reg, write_coeffs_23_resp);
                        write_one_coeffs_23_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_23_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_24_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_24_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_24_c_bitwidth, coeffs_24_DEPTH, coeffs_24_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_24_run_flag <= 1; 
        end
        else if ((write_one_coeffs_24_data_done == 1 && write_coeffs_24_count == coeffs_24_diff_count - 1) || coeffs_24_diff_count == 0) begin
            write_coeffs_24_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_24_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_24_count = 0;
        end
        if (write_one_coeffs_24_data_done === 1) begin
            write_coeffs_24_count = write_coeffs_24_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_24_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_24_write_data_finish <= 0;
        end
        if (write_coeffs_24_run_flag == 1 && write_coeffs_24_count == coeffs_24_diff_count) begin
            coeffs_24_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_24
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_24_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_24_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_24_diff_count = 0;

        for (k = 0; k < coeffs_24_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_24_c_bitwidth < 32) begin
                    coeffs_24_data_tmp_reg = mem_coeffs_24[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_24_c_bitwidth) begin
                            coeffs_24_data_tmp_reg[j] = mem_coeffs_24[k][i*32 + j];
                        end
                        else begin
                            coeffs_24_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_24[k * four_byte_num  + i]!==coeffs_24_data_tmp_reg) begin
                coeffs_24_diff_count = coeffs_24_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_24
    integer write_coeffs_24_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_24_count;
    reg [31 : 0] coeffs_24_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_24_c_bitwidth;
    process_num = 25;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_25_finish <= 0;

        for (check_coeffs_24_count = 0; check_coeffs_24_count < coeffs_24_OPERATE_DEPTH; check_coeffs_24_count = check_coeffs_24_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_24_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_24 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_24_c_bitwidth < 32) begin
                        coeffs_24_data_tmp_reg = mem_coeffs_24[check_coeffs_24_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_24_c_bitwidth) begin
                                coeffs_24_data_tmp_reg[j] = mem_coeffs_24[check_coeffs_24_count][i*32 + j];
                            end
                            else begin
                                coeffs_24_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_24[check_coeffs_24_count * four_byte_num  + i]!==coeffs_24_data_tmp_reg) begin
                        image_mem_coeffs_24[check_coeffs_24_count * four_byte_num + i]=coeffs_24_data_tmp_reg;
                        write (coeffs_24_data_in_addr + check_coeffs_24_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_24_data_tmp_reg, write_coeffs_24_resp);
                        write_one_coeffs_24_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_24_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_25_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_25_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_25_c_bitwidth, coeffs_25_DEPTH, coeffs_25_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_25_run_flag <= 1; 
        end
        else if ((write_one_coeffs_25_data_done == 1 && write_coeffs_25_count == coeffs_25_diff_count - 1) || coeffs_25_diff_count == 0) begin
            write_coeffs_25_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_25_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_25_count = 0;
        end
        if (write_one_coeffs_25_data_done === 1) begin
            write_coeffs_25_count = write_coeffs_25_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_25_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_25_write_data_finish <= 0;
        end
        if (write_coeffs_25_run_flag == 1 && write_coeffs_25_count == coeffs_25_diff_count) begin
            coeffs_25_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_25
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_25_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_25_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_25_diff_count = 0;

        for (k = 0; k < coeffs_25_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_25_c_bitwidth < 32) begin
                    coeffs_25_data_tmp_reg = mem_coeffs_25[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_25_c_bitwidth) begin
                            coeffs_25_data_tmp_reg[j] = mem_coeffs_25[k][i*32 + j];
                        end
                        else begin
                            coeffs_25_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_25[k * four_byte_num  + i]!==coeffs_25_data_tmp_reg) begin
                coeffs_25_diff_count = coeffs_25_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_25
    integer write_coeffs_25_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_25_count;
    reg [31 : 0] coeffs_25_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_25_c_bitwidth;
    process_num = 26;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_26_finish <= 0;

        for (check_coeffs_25_count = 0; check_coeffs_25_count < coeffs_25_OPERATE_DEPTH; check_coeffs_25_count = check_coeffs_25_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_25_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_25 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_25_c_bitwidth < 32) begin
                        coeffs_25_data_tmp_reg = mem_coeffs_25[check_coeffs_25_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_25_c_bitwidth) begin
                                coeffs_25_data_tmp_reg[j] = mem_coeffs_25[check_coeffs_25_count][i*32 + j];
                            end
                            else begin
                                coeffs_25_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_25[check_coeffs_25_count * four_byte_num  + i]!==coeffs_25_data_tmp_reg) begin
                        image_mem_coeffs_25[check_coeffs_25_count * four_byte_num + i]=coeffs_25_data_tmp_reg;
                        write (coeffs_25_data_in_addr + check_coeffs_25_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_25_data_tmp_reg, write_coeffs_25_resp);
                        write_one_coeffs_25_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_25_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_26_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_26_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_26_c_bitwidth, coeffs_26_DEPTH, coeffs_26_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_26_run_flag <= 1; 
        end
        else if ((write_one_coeffs_26_data_done == 1 && write_coeffs_26_count == coeffs_26_diff_count - 1) || coeffs_26_diff_count == 0) begin
            write_coeffs_26_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_26_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_26_count = 0;
        end
        if (write_one_coeffs_26_data_done === 1) begin
            write_coeffs_26_count = write_coeffs_26_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_26_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_26_write_data_finish <= 0;
        end
        if (write_coeffs_26_run_flag == 1 && write_coeffs_26_count == coeffs_26_diff_count) begin
            coeffs_26_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_26
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_26_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_26_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_26_diff_count = 0;

        for (k = 0; k < coeffs_26_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_26_c_bitwidth < 32) begin
                    coeffs_26_data_tmp_reg = mem_coeffs_26[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_26_c_bitwidth) begin
                            coeffs_26_data_tmp_reg[j] = mem_coeffs_26[k][i*32 + j];
                        end
                        else begin
                            coeffs_26_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_26[k * four_byte_num  + i]!==coeffs_26_data_tmp_reg) begin
                coeffs_26_diff_count = coeffs_26_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_26
    integer write_coeffs_26_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_26_count;
    reg [31 : 0] coeffs_26_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_26_c_bitwidth;
    process_num = 27;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_27_finish <= 0;

        for (check_coeffs_26_count = 0; check_coeffs_26_count < coeffs_26_OPERATE_DEPTH; check_coeffs_26_count = check_coeffs_26_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_26_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_26 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_26_c_bitwidth < 32) begin
                        coeffs_26_data_tmp_reg = mem_coeffs_26[check_coeffs_26_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_26_c_bitwidth) begin
                                coeffs_26_data_tmp_reg[j] = mem_coeffs_26[check_coeffs_26_count][i*32 + j];
                            end
                            else begin
                                coeffs_26_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_26[check_coeffs_26_count * four_byte_num  + i]!==coeffs_26_data_tmp_reg) begin
                        image_mem_coeffs_26[check_coeffs_26_count * four_byte_num + i]=coeffs_26_data_tmp_reg;
                        write (coeffs_26_data_in_addr + check_coeffs_26_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_26_data_tmp_reg, write_coeffs_26_resp);
                        write_one_coeffs_26_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_26_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_27_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_27_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_27_c_bitwidth, coeffs_27_DEPTH, coeffs_27_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_27_run_flag <= 1; 
        end
        else if ((write_one_coeffs_27_data_done == 1 && write_coeffs_27_count == coeffs_27_diff_count - 1) || coeffs_27_diff_count == 0) begin
            write_coeffs_27_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_27_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_27_count = 0;
        end
        if (write_one_coeffs_27_data_done === 1) begin
            write_coeffs_27_count = write_coeffs_27_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_27_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_27_write_data_finish <= 0;
        end
        if (write_coeffs_27_run_flag == 1 && write_coeffs_27_count == coeffs_27_diff_count) begin
            coeffs_27_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_27
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_27_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_27_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_27_diff_count = 0;

        for (k = 0; k < coeffs_27_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_27_c_bitwidth < 32) begin
                    coeffs_27_data_tmp_reg = mem_coeffs_27[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_27_c_bitwidth) begin
                            coeffs_27_data_tmp_reg[j] = mem_coeffs_27[k][i*32 + j];
                        end
                        else begin
                            coeffs_27_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_27[k * four_byte_num  + i]!==coeffs_27_data_tmp_reg) begin
                coeffs_27_diff_count = coeffs_27_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_27
    integer write_coeffs_27_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_27_count;
    reg [31 : 0] coeffs_27_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_27_c_bitwidth;
    process_num = 28;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_28_finish <= 0;

        for (check_coeffs_27_count = 0; check_coeffs_27_count < coeffs_27_OPERATE_DEPTH; check_coeffs_27_count = check_coeffs_27_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_27_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_27 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_27_c_bitwidth < 32) begin
                        coeffs_27_data_tmp_reg = mem_coeffs_27[check_coeffs_27_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_27_c_bitwidth) begin
                                coeffs_27_data_tmp_reg[j] = mem_coeffs_27[check_coeffs_27_count][i*32 + j];
                            end
                            else begin
                                coeffs_27_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_27[check_coeffs_27_count * four_byte_num  + i]!==coeffs_27_data_tmp_reg) begin
                        image_mem_coeffs_27[check_coeffs_27_count * four_byte_num + i]=coeffs_27_data_tmp_reg;
                        write (coeffs_27_data_in_addr + check_coeffs_27_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_27_data_tmp_reg, write_coeffs_27_resp);
                        write_one_coeffs_27_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_27_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_28_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_28_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_28_c_bitwidth, coeffs_28_DEPTH, coeffs_28_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_28_run_flag <= 1; 
        end
        else if ((write_one_coeffs_28_data_done == 1 && write_coeffs_28_count == coeffs_28_diff_count - 1) || coeffs_28_diff_count == 0) begin
            write_coeffs_28_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_28_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_28_count = 0;
        end
        if (write_one_coeffs_28_data_done === 1) begin
            write_coeffs_28_count = write_coeffs_28_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_28_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_28_write_data_finish <= 0;
        end
        if (write_coeffs_28_run_flag == 1 && write_coeffs_28_count == coeffs_28_diff_count) begin
            coeffs_28_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_28
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_28_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_28_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_28_diff_count = 0;

        for (k = 0; k < coeffs_28_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_28_c_bitwidth < 32) begin
                    coeffs_28_data_tmp_reg = mem_coeffs_28[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_28_c_bitwidth) begin
                            coeffs_28_data_tmp_reg[j] = mem_coeffs_28[k][i*32 + j];
                        end
                        else begin
                            coeffs_28_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_28[k * four_byte_num  + i]!==coeffs_28_data_tmp_reg) begin
                coeffs_28_diff_count = coeffs_28_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_28
    integer write_coeffs_28_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_28_count;
    reg [31 : 0] coeffs_28_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_28_c_bitwidth;
    process_num = 29;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_29_finish <= 0;

        for (check_coeffs_28_count = 0; check_coeffs_28_count < coeffs_28_OPERATE_DEPTH; check_coeffs_28_count = check_coeffs_28_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_28_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_28 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_28_c_bitwidth < 32) begin
                        coeffs_28_data_tmp_reg = mem_coeffs_28[check_coeffs_28_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_28_c_bitwidth) begin
                                coeffs_28_data_tmp_reg[j] = mem_coeffs_28[check_coeffs_28_count][i*32 + j];
                            end
                            else begin
                                coeffs_28_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_28[check_coeffs_28_count * four_byte_num  + i]!==coeffs_28_data_tmp_reg) begin
                        image_mem_coeffs_28[check_coeffs_28_count * four_byte_num + i]=coeffs_28_data_tmp_reg;
                        write (coeffs_28_data_in_addr + check_coeffs_28_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_28_data_tmp_reg, write_coeffs_28_resp);
                        write_one_coeffs_28_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_28_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_29_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_29_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_29_c_bitwidth, coeffs_29_DEPTH, coeffs_29_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_29_run_flag <= 1; 
        end
        else if ((write_one_coeffs_29_data_done == 1 && write_coeffs_29_count == coeffs_29_diff_count - 1) || coeffs_29_diff_count == 0) begin
            write_coeffs_29_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_29_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_29_count = 0;
        end
        if (write_one_coeffs_29_data_done === 1) begin
            write_coeffs_29_count = write_coeffs_29_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_29_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_29_write_data_finish <= 0;
        end
        if (write_coeffs_29_run_flag == 1 && write_coeffs_29_count == coeffs_29_diff_count) begin
            coeffs_29_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_29
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_29_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_29_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_29_diff_count = 0;

        for (k = 0; k < coeffs_29_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_29_c_bitwidth < 32) begin
                    coeffs_29_data_tmp_reg = mem_coeffs_29[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_29_c_bitwidth) begin
                            coeffs_29_data_tmp_reg[j] = mem_coeffs_29[k][i*32 + j];
                        end
                        else begin
                            coeffs_29_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_29[k * four_byte_num  + i]!==coeffs_29_data_tmp_reg) begin
                coeffs_29_diff_count = coeffs_29_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_29
    integer write_coeffs_29_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_29_count;
    reg [31 : 0] coeffs_29_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_29_c_bitwidth;
    process_num = 30;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_30_finish <= 0;

        for (check_coeffs_29_count = 0; check_coeffs_29_count < coeffs_29_OPERATE_DEPTH; check_coeffs_29_count = check_coeffs_29_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_29_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_29 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_29_c_bitwidth < 32) begin
                        coeffs_29_data_tmp_reg = mem_coeffs_29[check_coeffs_29_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_29_c_bitwidth) begin
                                coeffs_29_data_tmp_reg[j] = mem_coeffs_29[check_coeffs_29_count][i*32 + j];
                            end
                            else begin
                                coeffs_29_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_29[check_coeffs_29_count * four_byte_num  + i]!==coeffs_29_data_tmp_reg) begin
                        image_mem_coeffs_29[check_coeffs_29_count * four_byte_num + i]=coeffs_29_data_tmp_reg;
                        write (coeffs_29_data_in_addr + check_coeffs_29_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_29_data_tmp_reg, write_coeffs_29_resp);
                        write_one_coeffs_29_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_29_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_30_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_30_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_30_c_bitwidth, coeffs_30_DEPTH, coeffs_30_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_30_run_flag <= 1; 
        end
        else if ((write_one_coeffs_30_data_done == 1 && write_coeffs_30_count == coeffs_30_diff_count - 1) || coeffs_30_diff_count == 0) begin
            write_coeffs_30_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_30_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_30_count = 0;
        end
        if (write_one_coeffs_30_data_done === 1) begin
            write_coeffs_30_count = write_coeffs_30_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_30_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_30_write_data_finish <= 0;
        end
        if (write_coeffs_30_run_flag == 1 && write_coeffs_30_count == coeffs_30_diff_count) begin
            coeffs_30_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_30
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_30_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_30_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_30_diff_count = 0;

        for (k = 0; k < coeffs_30_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_30_c_bitwidth < 32) begin
                    coeffs_30_data_tmp_reg = mem_coeffs_30[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_30_c_bitwidth) begin
                            coeffs_30_data_tmp_reg[j] = mem_coeffs_30[k][i*32 + j];
                        end
                        else begin
                            coeffs_30_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_30[k * four_byte_num  + i]!==coeffs_30_data_tmp_reg) begin
                coeffs_30_diff_count = coeffs_30_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_30
    integer write_coeffs_30_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_30_count;
    reg [31 : 0] coeffs_30_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_30_c_bitwidth;
    process_num = 31;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_31_finish <= 0;

        for (check_coeffs_30_count = 0; check_coeffs_30_count < coeffs_30_OPERATE_DEPTH; check_coeffs_30_count = check_coeffs_30_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_30_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_30 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_30_c_bitwidth < 32) begin
                        coeffs_30_data_tmp_reg = mem_coeffs_30[check_coeffs_30_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_30_c_bitwidth) begin
                                coeffs_30_data_tmp_reg[j] = mem_coeffs_30[check_coeffs_30_count][i*32 + j];
                            end
                            else begin
                                coeffs_30_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_30[check_coeffs_30_count * four_byte_num  + i]!==coeffs_30_data_tmp_reg) begin
                        image_mem_coeffs_30[check_coeffs_30_count * four_byte_num + i]=coeffs_30_data_tmp_reg;
                        write (coeffs_30_data_in_addr + check_coeffs_30_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_30_data_tmp_reg, write_coeffs_30_resp);
                        write_one_coeffs_30_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_30_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_31_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_31_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (coeffs_31_c_bitwidth, coeffs_31_DEPTH, coeffs_31_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_31_run_flag <= 1; 
        end
        else if ((write_one_coeffs_31_data_done == 1 && write_coeffs_31_count == coeffs_31_diff_count - 1) || coeffs_31_diff_count == 0) begin
            write_coeffs_31_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_coeffs_31_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_coeffs_31_count = 0;
        end
        if (write_one_coeffs_31_data_done === 1) begin
            write_coeffs_31_count = write_coeffs_31_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        coeffs_31_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            coeffs_31_write_data_finish <= 0;
        end
        if (write_coeffs_31_run_flag == 1 && write_coeffs_31_count == coeffs_31_diff_count) begin
            coeffs_31_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_coeffs_31
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] coeffs_31_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_31_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        coeffs_31_diff_count = 0;

        for (k = 0; k < coeffs_31_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (coeffs_31_c_bitwidth < 32) begin
                    coeffs_31_data_tmp_reg = mem_coeffs_31[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < coeffs_31_c_bitwidth) begin
                            coeffs_31_data_tmp_reg[j] = mem_coeffs_31[k][i*32 + j];
                        end
                        else begin
                            coeffs_31_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_coeffs_31[k * four_byte_num  + i]!==coeffs_31_data_tmp_reg) begin
                coeffs_31_diff_count = coeffs_31_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_coeffs_31
    integer write_coeffs_31_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_coeffs_31_count;
    reg [31 : 0] coeffs_31_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = coeffs_31_c_bitwidth;
    process_num = 32;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_32_finish <= 0;

        for (check_coeffs_31_count = 0; check_coeffs_31_count < coeffs_31_OPERATE_DEPTH; check_coeffs_31_count = check_coeffs_31_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_coeffs_31_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write coeffs_31 data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (coeffs_31_c_bitwidth < 32) begin
                        coeffs_31_data_tmp_reg = mem_coeffs_31[check_coeffs_31_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < coeffs_31_c_bitwidth) begin
                                coeffs_31_data_tmp_reg[j] = mem_coeffs_31[check_coeffs_31_count][i*32 + j];
                            end
                            else begin
                                coeffs_31_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_coeffs_31[check_coeffs_31_count * four_byte_num  + i]!==coeffs_31_data_tmp_reg) begin
                        image_mem_coeffs_31[check_coeffs_31_count * four_byte_num + i]=coeffs_31_data_tmp_reg;
                        write (coeffs_31_data_in_addr + check_coeffs_31_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, coeffs_31_data_tmp_reg, write_coeffs_31_resp);
                        write_one_coeffs_31_data_done <= 1;
                        @(posedge clk);
                        write_one_coeffs_31_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_32_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_num_taps_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (num_taps_c_bitwidth, num_taps_DEPTH, num_taps_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_num_taps_run_flag <= 1; 
        end
        else if ((write_one_num_taps_data_done == 1 && write_num_taps_count == num_taps_diff_count - 1) || num_taps_diff_count == 0) begin
            write_num_taps_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_num_taps_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_num_taps_count = 0;
        end
        if (write_one_num_taps_data_done === 1) begin
            write_num_taps_count = write_num_taps_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        num_taps_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            num_taps_write_data_finish <= 0;
        end
        if (write_num_taps_run_flag == 1 && write_num_taps_count == num_taps_diff_count) begin
            num_taps_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_num_taps
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] num_taps_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = num_taps_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        num_taps_diff_count = 0;

        for (k = 0; k < num_taps_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (num_taps_c_bitwidth < 32) begin
                    num_taps_data_tmp_reg = mem_num_taps[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < num_taps_c_bitwidth) begin
                            num_taps_data_tmp_reg[j] = mem_num_taps[k][i*32 + j];
                        end
                        else begin
                            num_taps_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_num_taps[k * four_byte_num  + i]!==num_taps_data_tmp_reg) begin
                num_taps_diff_count = num_taps_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_num_taps
    integer write_num_taps_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_num_taps_count;
    reg [31 : 0] num_taps_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = num_taps_c_bitwidth;
    process_num = 33;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_33_finish <= 0;

        for (check_num_taps_count = 0; check_num_taps_count < num_taps_OPERATE_DEPTH; check_num_taps_count = check_num_taps_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_num_taps_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write num_taps data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (num_taps_c_bitwidth < 32) begin
                        num_taps_data_tmp_reg = mem_num_taps[check_num_taps_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < num_taps_c_bitwidth) begin
                                num_taps_data_tmp_reg[j] = mem_num_taps[check_num_taps_count][i*32 + j];
                            end
                            else begin
                                num_taps_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_num_taps[check_num_taps_count * four_byte_num  + i]!==num_taps_data_tmp_reg) begin
                        image_mem_num_taps[check_num_taps_count * four_byte_num + i]=num_taps_data_tmp_reg;
                        write (num_taps_data_in_addr + check_num_taps_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, num_taps_data_tmp_reg, write_num_taps_resp);
                        write_one_num_taps_data_done <= 1;
                        @(posedge clk);
                        write_one_num_taps_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_33_finish <= 1;
        @(posedge clk);
    end    
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_num_samples_run_flag <= 0; 
        count_operate_depth_by_bitwidth_and_depth (num_samples_c_bitwidth, num_samples_DEPTH, num_samples_OPERATE_DEPTH);
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_num_samples_run_flag <= 1; 
        end
        else if ((write_one_num_samples_data_done == 1 && write_num_samples_count == num_samples_diff_count - 1) || num_samples_diff_count == 0) begin
            write_num_samples_run_flag <= 0; 
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_num_samples_count = 0;
    end
    else begin
        if (AESL_ready_reg === 1) begin
            write_num_samples_count = 0;
        end
        if (write_one_num_samples_data_done === 1) begin
            write_num_samples_count = write_num_samples_count + 1;
        end
    end
end

always @(reset or posedge clk) begin
    if (reset == 0) begin
        num_samples_write_data_finish <= 0;
    end
    else begin
        if (TRAN_CTRL_start_in === 1) begin
            num_samples_write_data_finish <= 0;
        end
        if (write_num_samples_run_flag == 1 && write_num_samples_count == num_samples_diff_count) begin
            num_samples_write_data_finish <= 1;
        end
    end
end

initial begin : initial_diff_counter_num_samples
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer k;
    reg [31 : 0] num_samples_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = num_samples_c_bitwidth;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        wait (AESL_ready_reg === 1);
        num_samples_diff_count = 0;

        for (k = 0; k < num_samples_OPERATE_DEPTH; k = k + 1) begin
            for (i = 0; i < four_byte_num; i = i + 1) begin
                if (num_samples_c_bitwidth < 32) begin
                    num_samples_data_tmp_reg = mem_num_samples[k];
                end
                else begin
                    for (j = 0; j < 32; j = j + 1) begin
                        if (i*32 + j < num_samples_c_bitwidth) begin
                            num_samples_data_tmp_reg[j] = mem_num_samples[k][i*32 + j];
                        end
                        else begin
                            num_samples_data_tmp_reg[j] = 0;
                        end
                    end
                end
                if(image_mem_num_samples[k * four_byte_num  + i]!==num_samples_data_tmp_reg) begin
                num_samples_diff_count = num_samples_diff_count + 1;
                end
            end
        end

        @(posedge clk);
    end
end

initial begin : write_num_samples
    integer write_num_samples_resp;
    integer process_num ;
    integer get_ack;
    integer four_byte_num;
    integer ceil_align_to_pow_of_two_four_byte_num;
    integer c_bitwidth;
    integer i;
    integer j;
    integer check_num_samples_count;
    reg [31 : 0] num_samples_data_tmp_reg;
    wait(reset === 1);
    @(posedge clk);
    c_bitwidth = num_samples_c_bitwidth;
    process_num = 34;
    count_c_data_four_byte_num_by_bitwidth (c_bitwidth , four_byte_num);
    ceil_align_to_pow_of_two_four_byte_num = ceil_align_to_pow_of_two(four_byte_num);
    while (1) begin
        process_34_finish <= 0;

        for (check_num_samples_count = 0; check_num_samples_count < num_samples_OPERATE_DEPTH; check_num_samples_count = check_num_samples_count + 1) begin
            wait (ongoing_process_number === process_num && process_busy === 0);
            get_ack = 1;
            if (write_num_samples_run_flag === 1 && get_ack === 1) begin
                process_busy = 1;
                //write num_samples data 
                for (i = 0; i < four_byte_num; i = i + 1) begin
                    if (num_samples_c_bitwidth < 32) begin
                        num_samples_data_tmp_reg = mem_num_samples[check_num_samples_count];
                    end
                    else begin
                        for (j = 0; j < 32; j = j + 1) begin
                            if (i*32 + j < num_samples_c_bitwidth) begin
                                num_samples_data_tmp_reg[j] = mem_num_samples[check_num_samples_count][i*32 + j];
                            end
                            else begin
                                num_samples_data_tmp_reg[j] = 0;
                            end
                        end
                    end
                    if(image_mem_num_samples[check_num_samples_count * four_byte_num  + i]!==num_samples_data_tmp_reg) begin
                        image_mem_num_samples[check_num_samples_count * four_byte_num + i]=num_samples_data_tmp_reg;
                        write (num_samples_data_in_addr + check_num_samples_count * ceil_align_to_pow_of_two_four_byte_num * 4 + i * 4, num_samples_data_tmp_reg, write_num_samples_resp);
                        write_one_num_samples_data_done <= 1;
                        @(posedge clk);
                        write_one_num_samples_data_done <= 0;
                    end
                end
            end
            process_busy = 0;
        end

        process_34_finish <= 1;
        @(posedge clk);
    end    
end


always @(reset or posedge clk) begin
    if (reset == 0) begin
        write_start_run_flag <= 0; 
        write_start_count <= 0;
    end
    else begin
        if (write_start_count >= 1) begin
            write_start_run_flag <= 0; 
        end
        else if (TRAN_CTRL_write_start_in === 1) begin
            write_start_run_flag <= 1; 
        end
        if (AESL_write_start_finish === 1) begin
            write_start_count <= write_start_count + 1;
            write_start_run_flag <= 0; 
        end
    end
end

initial begin : write_start
    reg [DATA_WIDTH - 1 : 0] write_start_tmp;
    integer process_num;
    integer write_start_resp;
    wait(reset === 1);
    @(posedge clk);
    process_num = 35;
    while (1) begin
        process_35_finish = 0;
        if (ongoing_process_number === process_num && process_busy === 0 ) begin
            if (write_start_run_flag === 1) begin
                process_busy = 1;
                write_start_tmp=0;
                write_start_tmp[0 : 0] = 1;
                write (START_ADDR, write_start_tmp, write_start_resp);
                process_busy = 0;
                AESL_write_start_finish <= 1;
                @(posedge clk);
                AESL_write_start_finish <= 0;
            end
            process_35_finish <= 1;
        end 
        @(posedge clk);
    end
end

//------------------------Task and function-------------- 
task read_token; 
    input integer fp; 
    output reg [127 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end 
endtask 
 
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_0_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_0_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_0_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_0 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_0); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_0_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_0 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_0 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_0 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_0 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_0 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_0;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_1_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_1_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_1_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_1 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_1); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_1_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_1 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_1 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_1 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_1 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_1 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_1;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_2_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_2_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_2_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_2 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_2); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_2_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_2 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_2 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_2 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_2 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_2 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_2;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_3_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_3_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_3_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_3 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_3); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_3_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_3 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_3 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_3 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_3 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_3 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_3;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_4_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_4_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_4_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_4 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_4); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_4_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_4 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_4 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_4 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_4 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_4 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_4;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_5_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_5_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_5_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_5 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_5); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_5_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_5 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_5 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_5 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_5 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_5 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_5;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_6_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_6_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_6_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_6 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_6); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_6_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_6 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_6 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_6 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_6 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_6 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_6;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_7_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_7_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_7_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_7 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_7); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_7_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_7 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_7 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_7 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_7 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_7 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_7;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_8_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_8_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_8_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_8 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_8); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_8_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_8 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_8 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_8 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_8 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_8 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_8;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_9_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_9_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_9_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_9 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_9); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_9_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_9 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_9 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_9 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_9 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_9 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_9;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_10_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_10_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_10_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_10 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_10); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_10_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_10 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_10 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_10 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_10 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_10 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_10;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_11_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_11_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_11_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_11 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_11); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_11_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_11 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_11 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_11 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_11 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_11 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_11;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_12_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_12_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_12_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_12 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_12); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_12_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_12 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_12 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_12 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_12 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_12 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_12;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_13_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_13_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_13_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_13 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_13); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_13_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_13 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_13 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_13 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_13 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_13 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_13;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_14_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_14_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_14_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_14 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_14); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_14_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_14 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_14 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_14 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_14 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_14 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_14;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_15_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_15_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_15_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_15 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_15); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_15_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_15 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_15 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_15 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_15 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_15 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_15;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_16_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_16_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_16_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_16 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_16); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_16_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_16 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_16 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_16 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_16 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_16 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_16;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_17_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_17_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_17_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_17 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_17); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_17_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_17 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_17 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_17 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_17 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_17 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_17;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_18_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_18_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_18_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_18 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_18); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_18_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_18 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_18 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_18 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_18 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_18 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_18;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_19_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_19_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_19_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_19 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_19); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_19_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_19 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_19 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_19 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_19 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_19 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_19;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_20_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_20_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_20_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_20 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_20); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_20_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_20 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_20 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_20 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_20 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_20 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_20;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_21_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_21_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_21_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_21 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_21); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_21_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_21 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_21 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_21 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_21 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_21 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_21;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_22_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_22_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_22_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_22 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_22); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_22_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_22 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_22 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_22 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_22 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_22 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_22;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_23_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_23_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_23_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_23 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_23); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_23_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_23 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_23 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_23 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_23 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_23 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_23;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_24_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_24_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_24_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_24 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_24); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_24_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_24 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_24 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_24 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_24 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_24 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_24;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_25_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_25_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_25_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_25 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_25); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_25_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_25 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_25 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_25 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_25 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_25 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_25;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_26_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_26_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_26_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_26 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_26); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_26_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_26 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_26 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_26 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_26 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_26 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_26;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_27_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_27_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_27_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_27 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_27); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_27_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_27 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_27 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_27 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_27 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_27 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_27;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_28_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_28_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_28_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_28 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_28); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_28_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_28 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_28 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_28 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_28 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_28 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_28;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_29_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_29_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_29_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_29 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_29); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_29_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_29 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_29 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_29 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_29 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_29 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_29;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_30_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_30_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_30_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_30 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_30); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_30_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_30 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_30 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_30 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_30 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_30 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_30;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_coeffs_31_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [coeffs_31_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (coeffs_31_c_bitwidth , factor);
  fp = $fopen(`TV_IN_coeffs_31 ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_coeffs_31); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < coeffs_31_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_coeffs_31 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_coeffs_31 [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_coeffs_31 [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_coeffs_31 [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_coeffs_31 [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_coeffs_31;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_num_taps_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [num_taps_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (num_taps_c_bitwidth , factor);
  fp = $fopen(`TV_IN_num_taps ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_num_taps); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < num_taps_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_num_taps [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_num_taps [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_num_taps [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_num_taps [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_num_taps [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_num_taps;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
//------------------------Read file------------------------ 
 
// Read data from file 
initial begin : read_num_samples_file_process 
  integer fp; 
  integer ret; 
  integer factor; 
  reg [127 : 0] token; 
  reg [127 : 0] token_tmp; 
  //reg [num_samples_c_bitwidth - 1 : 0] token_tmp; 
  reg [DATA_WIDTH - 1 : 0] tmp_cache_mem; 
  reg [ 8*5 : 1] str;
    reg [63:0] trans_depth;
  integer transaction_idx; 
  integer i; 
  transaction_idx = 0; 
  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
  count_seperate_factor_by_bitwidth (num_samples_c_bitwidth , factor);
  fp = $fopen(`TV_IN_num_samples ,"r"); 
  if(fp == 0) begin                               // Failed to open file 
      $display("Failed to open file \"%s\"!", `TV_IN_num_samples); 
      $finish; 
  end 
  read_token(fp, token); 
  if (token != "[[[runtime]]]") begin             // Illegal format 
      $display("ERROR: Simulation using HLS TB failed.");
      $finish; 
  end 
  read_token(fp, token); 
  while (token != "[[[/runtime]]]") begin 
      if (token != "[[transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token);                        // skip transaction number 
      @(posedge clk);
      # 0.2;
      while(AESL_ready_reg !== 1) begin
          @(posedge clk); 
          # 0.2;
      end
      for(i = 0; i < num_samples_DEPTH; i = i + 1) begin 
          read_token(fp, token); 
          ret = $sscanf(token, "0x%x", token_tmp); 
          if (factor == 4) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [7 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [15 : 8] = token_tmp;
              end
              if (i%factor == 2) begin
                  tmp_cache_mem [23 : 16] = token_tmp;
              end
              if (i%factor == 3) begin
                  tmp_cache_mem [31 : 24] = token_tmp;
                  mem_num_samples [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1 : 0] = 0;
              end
          end
          if (factor == 2) begin
              if (i%factor == 0) begin
                  tmp_cache_mem [15 : 0] = token_tmp;
              end
              if (i%factor == 1) begin
                  tmp_cache_mem [31 : 16] = token_tmp;
                  mem_num_samples [i/factor] = tmp_cache_mem;
                  tmp_cache_mem [DATA_WIDTH - 1: 0] = 0;
              end
          end
          if (factor == 1) begin
              mem_num_samples [i] = token_tmp;
          end
      end 
      if (factor == 4) begin
          if (i%factor != 0) begin
              mem_num_samples [i/factor] = tmp_cache_mem;
          end
      end
      if (factor == 2) begin
          if (i%factor != 0) begin
              mem_num_samples [i/factor] = tmp_cache_mem;
          end
      end 
      read_token(fp, token); 
      if(token != "[[/transaction]]") begin 
          $display("ERROR: Simulation using HLS TB failed.");
          $finish; 
      end 
      read_token(fp, token); 
      transaction_idx = transaction_idx + 1; 
  end 
  $fclose(fp); 
end 
 
task write_binary_num_samples;
    input integer fp;
    input reg[64-1:0] in;
    input integer in_bw;
    reg [63:0] tmp_long;
    reg[64-1:0] local_in;
    integer char_num;
    integer long_num;
    integer i;
    integer j;
    begin
        long_num = (in_bw + 63) / 64;
        char_num = ((in_bw - 1) % 64 + 7) / 8;
        for(i=long_num;i>0;i=i-1) begin
             local_in = in;
             tmp_long = local_in >> ((i-1)*64);
             for(j=0;j<64;j=j+1)
                 if (tmp_long[j] === 1'bx)
                     tmp_long[j] = 1'b0;
             if (i == long_num) begin
                 case(char_num)
                     1: $fwrite(fp,"%c",tmp_long[7:0]);
                     2: $fwrite(fp,"%c%c",tmp_long[15:8],tmp_long[7:0]);
                     3: $fwrite(fp,"%c%c%c",tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     4: $fwrite(fp,"%c%c%c%c",tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     5: $fwrite(fp,"%c%c%c%c%c",tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     6: $fwrite(fp,"%c%c%c%c%c%c",tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     7: $fwrite(fp,"%c%c%c%c%c%c%c",tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     8: $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
                     default: ;
                 endcase
             end
             else begin
                 $fwrite(fp,"%c%c%c%c%c%c%c%c",tmp_long[63:56],tmp_long[55:48],tmp_long[47:40],tmp_long[39:32],tmp_long[31:24],tmp_long[23:16],tmp_long[15:8],tmp_long[7:0]);
             end
        end
    end
endtask;
endmodule
