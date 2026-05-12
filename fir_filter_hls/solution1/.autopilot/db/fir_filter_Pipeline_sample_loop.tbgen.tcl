set moduleName fir_filter_Pipeline_sample_loop
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fir_filter_Pipeline_sample_loop}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ select_ln44_1 int 32 regular  }
	{ in_stream_V_data_V int 32 regular {axi_s 0 volatile  { in_stream Data } }  }
	{ in_stream_V_keep_V int 4 regular {axi_s 0 volatile  { in_stream Keep } }  }
	{ in_stream_V_strb_V int 4 regular {axi_s 0 volatile  { in_stream Strb } }  }
	{ in_stream_V_last_V int 1 regular {axi_s 0 volatile  { in_stream Last } }  }
	{ coeffs_0_load_cast int 16 regular  }
	{ coeffs_1_load_cast int 16 regular  }
	{ icmp int 1 regular  }
	{ coeffs_2_load_cast int 16 regular  }
	{ cmp31_2 int 1 regular  }
	{ coeffs_3_load_cast int 16 regular  }
	{ icmp4 int 1 regular  }
	{ coeffs_4_load_cast int 16 regular  }
	{ cmp31_4 int 1 regular  }
	{ coeffs_5_load_cast int 16 regular  }
	{ cmp31_5 int 1 regular  }
	{ coeffs_6_load_cast int 16 regular  }
	{ cmp31_6 int 1 regular  }
	{ coeffs_7_load_cast int 16 regular  }
	{ icmp7 int 1 regular  }
	{ coeffs_8_load_cast int 16 regular  }
	{ cmp31_8 int 1 regular  }
	{ coeffs_9_load_cast int 16 regular  }
	{ cmp31_9 int 1 regular  }
	{ coeffs_10_load_cast int 16 regular  }
	{ cmp31_10 int 1 regular  }
	{ coeffs_11_load_cast int 16 regular  }
	{ cmp31_11 int 1 regular  }
	{ coeffs_12_load_cast int 16 regular  }
	{ cmp31_12 int 1 regular  }
	{ coeffs_13_load_cast int 16 regular  }
	{ cmp31_13 int 1 regular  }
	{ coeffs_14_load_cast int 16 regular  }
	{ cmp31_14 int 1 regular  }
	{ coeffs_15_load_cast int 16 regular  }
	{ icmp10 int 1 regular  }
	{ coeffs_16_load_cast int 16 regular  }
	{ cmp31_16 int 1 regular  }
	{ coeffs_17_load_cast int 16 regular  }
	{ cmp31_17 int 1 regular  }
	{ coeffs_18_load_cast int 16 regular  }
	{ cmp31_18 int 1 regular  }
	{ coeffs_19_load_cast int 16 regular  }
	{ cmp31_19 int 1 regular  }
	{ coeffs_20_load_cast int 16 regular  }
	{ cmp31_20 int 1 regular  }
	{ coeffs_21_load_cast int 16 regular  }
	{ cmp31_21 int 1 regular  }
	{ coeffs_22_load_cast int 16 regular  }
	{ cmp31_22 int 1 regular  }
	{ coeffs_23_load_cast int 16 regular  }
	{ cmp31_23 int 1 regular  }
	{ coeffs_24_load_cast int 16 regular  }
	{ cmp31_24 int 1 regular  }
	{ coeffs_25_load_cast int 16 regular  }
	{ cmp31_25 int 1 regular  }
	{ coeffs_26_load_cast int 16 regular  }
	{ cmp31_26 int 1 regular  }
	{ coeffs_27_load_cast int 16 regular  }
	{ cmp31_27 int 1 regular  }
	{ coeffs_28_load_cast int 16 regular  }
	{ cmp31_28 int 1 regular  }
	{ coeffs_29_load_cast int 16 regular  }
	{ cmp31_29 int 1 regular  }
	{ coeffs_30_load_cast int 16 regular  }
	{ cmp31_30 int 1 regular  }
	{ coeffs_31_load_cast int 16 regular  }
	{ empty int 1 regular  }
	{ sext_ln44 int 11 regular  }
	{ out_stream_V_data_V int 32 regular {axi_s 1 volatile  { out_stream Data } }  }
	{ out_stream_V_keep_V int 4 regular {axi_s 1 volatile  { out_stream Keep } }  }
	{ out_stream_V_strb_V int 4 regular {axi_s 1 volatile  { out_stream Strb } }  }
	{ out_stream_V_last_V int 1 regular {axi_s 1 volatile  { out_stream Last } }  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "select_ln44_1", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_0_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_1_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_2_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_2", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_3_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_4_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_4", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_5_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_5", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_6_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_6", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_7_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp7", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_8_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_8", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_9_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_9", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_10_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_10", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_11_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_11", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_12_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_12", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_13_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_13", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_14_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_14", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_15_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "icmp10", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_16_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_16", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_17_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_17", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_18_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_18", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_19_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_19", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_20_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_20", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_21_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_21", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_22_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_22", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_23_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_23", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_24_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_24", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_25_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_25", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_26_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_26", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_27_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_27", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_28_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_28", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_29_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_29", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_30_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "cmp31_30", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "coeffs_31_load_cast", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "empty", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln44", "interface" : "wire", "bitwidth" : 11, "direction" : "READONLY"} , 
 	{ "Name" : "out_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 83
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ in_stream_TVALID sc_in sc_logic 1 invld 1 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 69 } 
	{ select_ln44_1 sc_in sc_lv 32 signal 0 } 
	{ in_stream_TDATA sc_in sc_lv 32 signal 1 } 
	{ in_stream_TREADY sc_out sc_logic 1 inacc 4 } 
	{ in_stream_TKEEP sc_in sc_lv 4 signal 2 } 
	{ in_stream_TSTRB sc_in sc_lv 4 signal 3 } 
	{ in_stream_TLAST sc_in sc_lv 1 signal 4 } 
	{ coeffs_0_load_cast sc_in sc_lv 16 signal 5 } 
	{ coeffs_1_load_cast sc_in sc_lv 16 signal 6 } 
	{ icmp sc_in sc_lv 1 signal 7 } 
	{ coeffs_2_load_cast sc_in sc_lv 16 signal 8 } 
	{ cmp31_2 sc_in sc_lv 1 signal 9 } 
	{ coeffs_3_load_cast sc_in sc_lv 16 signal 10 } 
	{ icmp4 sc_in sc_lv 1 signal 11 } 
	{ coeffs_4_load_cast sc_in sc_lv 16 signal 12 } 
	{ cmp31_4 sc_in sc_lv 1 signal 13 } 
	{ coeffs_5_load_cast sc_in sc_lv 16 signal 14 } 
	{ cmp31_5 sc_in sc_lv 1 signal 15 } 
	{ coeffs_6_load_cast sc_in sc_lv 16 signal 16 } 
	{ cmp31_6 sc_in sc_lv 1 signal 17 } 
	{ coeffs_7_load_cast sc_in sc_lv 16 signal 18 } 
	{ icmp7 sc_in sc_lv 1 signal 19 } 
	{ coeffs_8_load_cast sc_in sc_lv 16 signal 20 } 
	{ cmp31_8 sc_in sc_lv 1 signal 21 } 
	{ coeffs_9_load_cast sc_in sc_lv 16 signal 22 } 
	{ cmp31_9 sc_in sc_lv 1 signal 23 } 
	{ coeffs_10_load_cast sc_in sc_lv 16 signal 24 } 
	{ cmp31_10 sc_in sc_lv 1 signal 25 } 
	{ coeffs_11_load_cast sc_in sc_lv 16 signal 26 } 
	{ cmp31_11 sc_in sc_lv 1 signal 27 } 
	{ coeffs_12_load_cast sc_in sc_lv 16 signal 28 } 
	{ cmp31_12 sc_in sc_lv 1 signal 29 } 
	{ coeffs_13_load_cast sc_in sc_lv 16 signal 30 } 
	{ cmp31_13 sc_in sc_lv 1 signal 31 } 
	{ coeffs_14_load_cast sc_in sc_lv 16 signal 32 } 
	{ cmp31_14 sc_in sc_lv 1 signal 33 } 
	{ coeffs_15_load_cast sc_in sc_lv 16 signal 34 } 
	{ icmp10 sc_in sc_lv 1 signal 35 } 
	{ coeffs_16_load_cast sc_in sc_lv 16 signal 36 } 
	{ cmp31_16 sc_in sc_lv 1 signal 37 } 
	{ coeffs_17_load_cast sc_in sc_lv 16 signal 38 } 
	{ cmp31_17 sc_in sc_lv 1 signal 39 } 
	{ coeffs_18_load_cast sc_in sc_lv 16 signal 40 } 
	{ cmp31_18 sc_in sc_lv 1 signal 41 } 
	{ coeffs_19_load_cast sc_in sc_lv 16 signal 42 } 
	{ cmp31_19 sc_in sc_lv 1 signal 43 } 
	{ coeffs_20_load_cast sc_in sc_lv 16 signal 44 } 
	{ cmp31_20 sc_in sc_lv 1 signal 45 } 
	{ coeffs_21_load_cast sc_in sc_lv 16 signal 46 } 
	{ cmp31_21 sc_in sc_lv 1 signal 47 } 
	{ coeffs_22_load_cast sc_in sc_lv 16 signal 48 } 
	{ cmp31_22 sc_in sc_lv 1 signal 49 } 
	{ coeffs_23_load_cast sc_in sc_lv 16 signal 50 } 
	{ cmp31_23 sc_in sc_lv 1 signal 51 } 
	{ coeffs_24_load_cast sc_in sc_lv 16 signal 52 } 
	{ cmp31_24 sc_in sc_lv 1 signal 53 } 
	{ coeffs_25_load_cast sc_in sc_lv 16 signal 54 } 
	{ cmp31_25 sc_in sc_lv 1 signal 55 } 
	{ coeffs_26_load_cast sc_in sc_lv 16 signal 56 } 
	{ cmp31_26 sc_in sc_lv 1 signal 57 } 
	{ coeffs_27_load_cast sc_in sc_lv 16 signal 58 } 
	{ cmp31_27 sc_in sc_lv 1 signal 59 } 
	{ coeffs_28_load_cast sc_in sc_lv 16 signal 60 } 
	{ cmp31_28 sc_in sc_lv 1 signal 61 } 
	{ coeffs_29_load_cast sc_in sc_lv 16 signal 62 } 
	{ cmp31_29 sc_in sc_lv 1 signal 63 } 
	{ coeffs_30_load_cast sc_in sc_lv 16 signal 64 } 
	{ cmp31_30 sc_in sc_lv 1 signal 65 } 
	{ coeffs_31_load_cast sc_in sc_lv 16 signal 66 } 
	{ empty sc_in sc_lv 1 signal 67 } 
	{ sext_ln44 sc_in sc_lv 11 signal 68 } 
	{ out_stream_TDATA sc_out sc_lv 32 signal 69 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 72 } 
	{ out_stream_TKEEP sc_out sc_lv 4 signal 70 } 
	{ out_stream_TSTRB sc_out sc_lv 4 signal 71 } 
	{ out_stream_TLAST sc_out sc_lv 1 signal 72 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "in_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "select_ln44_1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "select_ln44_1", "role": "default" }} , 
 	{ "name": "in_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_stream_V_data_V", "role": "default" }} , 
 	{ "name": "in_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "in_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "in_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "in_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "coeffs_0_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_0_load_cast", "role": "default" }} , 
 	{ "name": "coeffs_1_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_1_load_cast", "role": "default" }} , 
 	{ "name": "icmp", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp", "role": "default" }} , 
 	{ "name": "coeffs_2_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_2_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_2", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_2", "role": "default" }} , 
 	{ "name": "coeffs_3_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_3_load_cast", "role": "default" }} , 
 	{ "name": "icmp4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp4", "role": "default" }} , 
 	{ "name": "coeffs_4_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_4_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_4", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_4", "role": "default" }} , 
 	{ "name": "coeffs_5_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_5_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_5", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_5", "role": "default" }} , 
 	{ "name": "coeffs_6_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_6_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_6", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_6", "role": "default" }} , 
 	{ "name": "coeffs_7_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_7_load_cast", "role": "default" }} , 
 	{ "name": "icmp7", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp7", "role": "default" }} , 
 	{ "name": "coeffs_8_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_8_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_8", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_8", "role": "default" }} , 
 	{ "name": "coeffs_9_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_9_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_9", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_9", "role": "default" }} , 
 	{ "name": "coeffs_10_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_10_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_10", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_10", "role": "default" }} , 
 	{ "name": "coeffs_11_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_11_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_11", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_11", "role": "default" }} , 
 	{ "name": "coeffs_12_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_12_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_12", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_12", "role": "default" }} , 
 	{ "name": "coeffs_13_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_13_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_13", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_13", "role": "default" }} , 
 	{ "name": "coeffs_14_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_14_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_14", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_14", "role": "default" }} , 
 	{ "name": "coeffs_15_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_15_load_cast", "role": "default" }} , 
 	{ "name": "icmp10", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "icmp10", "role": "default" }} , 
 	{ "name": "coeffs_16_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_16_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_16", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_16", "role": "default" }} , 
 	{ "name": "coeffs_17_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_17_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_17", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_17", "role": "default" }} , 
 	{ "name": "coeffs_18_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_18_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_18", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_18", "role": "default" }} , 
 	{ "name": "coeffs_19_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_19_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_19", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_19", "role": "default" }} , 
 	{ "name": "coeffs_20_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_20_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_20", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_20", "role": "default" }} , 
 	{ "name": "coeffs_21_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_21_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_21", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_21", "role": "default" }} , 
 	{ "name": "coeffs_22_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_22_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_22", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_22", "role": "default" }} , 
 	{ "name": "coeffs_23_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_23_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_23", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_23", "role": "default" }} , 
 	{ "name": "coeffs_24_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_24_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_24", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_24", "role": "default" }} , 
 	{ "name": "coeffs_25_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_25_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_25", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_25", "role": "default" }} , 
 	{ "name": "coeffs_26_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_26_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_26", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_26", "role": "default" }} , 
 	{ "name": "coeffs_27_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_27_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_27", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_27", "role": "default" }} , 
 	{ "name": "coeffs_28_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_28_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_28", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_28", "role": "default" }} , 
 	{ "name": "coeffs_29_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_29_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_29", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_29", "role": "default" }} , 
 	{ "name": "coeffs_30_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_30_load_cast", "role": "default" }} , 
 	{ "name": "cmp31_30", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "cmp31_30", "role": "default" }} , 
 	{ "name": "coeffs_31_load_cast", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "coeffs_31_load_cast", "role": "default" }} , 
 	{ "name": "empty", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "empty", "role": "default" }} , 
 	{ "name": "sext_ln44", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "sext_ln44", "role": "default" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "out_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "out_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33"],
		"CDFG" : "fir_filter_Pipeline_sample_loop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "30", "EstimateLatencyMax" : "1058",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "select_ln44_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"BlockSignal" : [
					{"Name" : "in_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "coeffs_0_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_1_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "icmp", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_2_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_3_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "icmp4", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_4_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_5_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_6_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_7_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "icmp7", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_8_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_9_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_10_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_11_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_12_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_13_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_14_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_15_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "icmp10", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_16_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_17_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_18_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_19_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_20_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_21_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_22_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_23_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_24_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_25_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_26_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_27_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_28_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_29_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_30_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "cmp31_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_31_load_cast", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "sext_ln44", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"BlockSignal" : [
					{"Name" : "out_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"}],
		"Loop" : [
			{"Name" : "sample_loop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter34", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter34", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_16s_16s_32_1_1_U1", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32s_32_4_1_U2", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U3", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U4", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U5", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U6", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U7", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U8", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U9", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U10", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U11", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U12", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U13", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U14", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U15", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U16", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U17", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U18", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U19", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U20", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U21", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U22", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U23", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U24", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U25", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U26", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U27", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U28", "Parent" : "0"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U29", "Parent" : "0"},
	{"ID" : "30", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U30", "Parent" : "0"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U31", "Parent" : "0"},
	{"ID" : "32", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_16s_16s_32ns_32_4_1_U32", "Parent" : "0"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fir_filter_Pipeline_sample_loop {
		select_ln44_1 {Type I LastRead 0 FirstWrite -1}
		in_stream_V_data_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_keep_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_strb_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_last_V {Type I LastRead 1 FirstWrite -1}
		coeffs_0_load_cast {Type I LastRead 0 FirstWrite -1}
		coeffs_1_load_cast {Type I LastRead 0 FirstWrite -1}
		icmp {Type I LastRead 0 FirstWrite -1}
		coeffs_2_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_2 {Type I LastRead 0 FirstWrite -1}
		coeffs_3_load_cast {Type I LastRead 0 FirstWrite -1}
		icmp4 {Type I LastRead 0 FirstWrite -1}
		coeffs_4_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_4 {Type I LastRead 0 FirstWrite -1}
		coeffs_5_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_5 {Type I LastRead 0 FirstWrite -1}
		coeffs_6_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_6 {Type I LastRead 0 FirstWrite -1}
		coeffs_7_load_cast {Type I LastRead 0 FirstWrite -1}
		icmp7 {Type I LastRead 0 FirstWrite -1}
		coeffs_8_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_8 {Type I LastRead 0 FirstWrite -1}
		coeffs_9_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_9 {Type I LastRead 0 FirstWrite -1}
		coeffs_10_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_10 {Type I LastRead 0 FirstWrite -1}
		coeffs_11_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_11 {Type I LastRead 0 FirstWrite -1}
		coeffs_12_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_12 {Type I LastRead 0 FirstWrite -1}
		coeffs_13_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_13 {Type I LastRead 0 FirstWrite -1}
		coeffs_14_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_14 {Type I LastRead 0 FirstWrite -1}
		coeffs_15_load_cast {Type I LastRead 0 FirstWrite -1}
		icmp10 {Type I LastRead 0 FirstWrite -1}
		coeffs_16_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_16 {Type I LastRead 0 FirstWrite -1}
		coeffs_17_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_17 {Type I LastRead 0 FirstWrite -1}
		coeffs_18_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_18 {Type I LastRead 0 FirstWrite -1}
		coeffs_19_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_19 {Type I LastRead 0 FirstWrite -1}
		coeffs_20_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_20 {Type I LastRead 0 FirstWrite -1}
		coeffs_21_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_21 {Type I LastRead 0 FirstWrite -1}
		coeffs_22_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_22 {Type I LastRead 0 FirstWrite -1}
		coeffs_23_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_23 {Type I LastRead 0 FirstWrite -1}
		coeffs_24_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_24 {Type I LastRead 0 FirstWrite -1}
		coeffs_25_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_25 {Type I LastRead 0 FirstWrite -1}
		coeffs_26_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_26 {Type I LastRead 0 FirstWrite -1}
		coeffs_27_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_27 {Type I LastRead 0 FirstWrite -1}
		coeffs_28_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_28 {Type I LastRead 0 FirstWrite -1}
		coeffs_29_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_29 {Type I LastRead 0 FirstWrite -1}
		coeffs_30_load_cast {Type I LastRead 0 FirstWrite -1}
		cmp31_30 {Type I LastRead 0 FirstWrite -1}
		coeffs_31_load_cast {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		sext_ln44 {Type I LastRead 0 FirstWrite -1}
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 34}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "30", "Max" : "1058"}
	, {"Name" : "Interval", "Min" : "30", "Max" : "1058"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	select_ln44_1 { ap_none {  { select_ln44_1 in_data 0 32 } } }
	in_stream_V_data_V { axis {  { in_stream_TVALID in_vld 0 1 }  { in_stream_TDATA in_data 0 32 } } }
	in_stream_V_keep_V { axis {  { in_stream_TKEEP in_data 0 4 } } }
	in_stream_V_strb_V { axis {  { in_stream_TSTRB in_data 0 4 } } }
	in_stream_V_last_V { axis {  { in_stream_TREADY in_acc 1 1 }  { in_stream_TLAST in_data 0 1 } } }
	coeffs_0_load_cast { ap_none {  { coeffs_0_load_cast in_data 0 16 } } }
	coeffs_1_load_cast { ap_none {  { coeffs_1_load_cast in_data 0 16 } } }
	icmp { ap_none {  { icmp in_data 0 1 } } }
	coeffs_2_load_cast { ap_none {  { coeffs_2_load_cast in_data 0 16 } } }
	cmp31_2 { ap_none {  { cmp31_2 in_data 0 1 } } }
	coeffs_3_load_cast { ap_none {  { coeffs_3_load_cast in_data 0 16 } } }
	icmp4 { ap_none {  { icmp4 in_data 0 1 } } }
	coeffs_4_load_cast { ap_none {  { coeffs_4_load_cast in_data 0 16 } } }
	cmp31_4 { ap_none {  { cmp31_4 in_data 0 1 } } }
	coeffs_5_load_cast { ap_none {  { coeffs_5_load_cast in_data 0 16 } } }
	cmp31_5 { ap_none {  { cmp31_5 in_data 0 1 } } }
	coeffs_6_load_cast { ap_none {  { coeffs_6_load_cast in_data 0 16 } } }
	cmp31_6 { ap_none {  { cmp31_6 in_data 0 1 } } }
	coeffs_7_load_cast { ap_none {  { coeffs_7_load_cast in_data 0 16 } } }
	icmp7 { ap_none {  { icmp7 in_data 0 1 } } }
	coeffs_8_load_cast { ap_none {  { coeffs_8_load_cast in_data 0 16 } } }
	cmp31_8 { ap_none {  { cmp31_8 in_data 0 1 } } }
	coeffs_9_load_cast { ap_none {  { coeffs_9_load_cast in_data 0 16 } } }
	cmp31_9 { ap_none {  { cmp31_9 in_data 0 1 } } }
	coeffs_10_load_cast { ap_none {  { coeffs_10_load_cast in_data 0 16 } } }
	cmp31_10 { ap_none {  { cmp31_10 in_data 0 1 } } }
	coeffs_11_load_cast { ap_none {  { coeffs_11_load_cast in_data 0 16 } } }
	cmp31_11 { ap_none {  { cmp31_11 in_data 0 1 } } }
	coeffs_12_load_cast { ap_none {  { coeffs_12_load_cast in_data 0 16 } } }
	cmp31_12 { ap_none {  { cmp31_12 in_data 0 1 } } }
	coeffs_13_load_cast { ap_none {  { coeffs_13_load_cast in_data 0 16 } } }
	cmp31_13 { ap_none {  { cmp31_13 in_data 0 1 } } }
	coeffs_14_load_cast { ap_none {  { coeffs_14_load_cast in_data 0 16 } } }
	cmp31_14 { ap_none {  { cmp31_14 in_data 0 1 } } }
	coeffs_15_load_cast { ap_none {  { coeffs_15_load_cast in_data 0 16 } } }
	icmp10 { ap_none {  { icmp10 in_data 0 1 } } }
	coeffs_16_load_cast { ap_none {  { coeffs_16_load_cast in_data 0 16 } } }
	cmp31_16 { ap_none {  { cmp31_16 in_data 0 1 } } }
	coeffs_17_load_cast { ap_none {  { coeffs_17_load_cast in_data 0 16 } } }
	cmp31_17 { ap_none {  { cmp31_17 in_data 0 1 } } }
	coeffs_18_load_cast { ap_none {  { coeffs_18_load_cast in_data 0 16 } } }
	cmp31_18 { ap_none {  { cmp31_18 in_data 0 1 } } }
	coeffs_19_load_cast { ap_none {  { coeffs_19_load_cast in_data 0 16 } } }
	cmp31_19 { ap_none {  { cmp31_19 in_data 0 1 } } }
	coeffs_20_load_cast { ap_none {  { coeffs_20_load_cast in_data 0 16 } } }
	cmp31_20 { ap_none {  { cmp31_20 in_data 0 1 } } }
	coeffs_21_load_cast { ap_none {  { coeffs_21_load_cast in_data 0 16 } } }
	cmp31_21 { ap_none {  { cmp31_21 in_data 0 1 } } }
	coeffs_22_load_cast { ap_none {  { coeffs_22_load_cast in_data 0 16 } } }
	cmp31_22 { ap_none {  { cmp31_22 in_data 0 1 } } }
	coeffs_23_load_cast { ap_none {  { coeffs_23_load_cast in_data 0 16 } } }
	cmp31_23 { ap_none {  { cmp31_23 in_data 0 1 } } }
	coeffs_24_load_cast { ap_none {  { coeffs_24_load_cast in_data 0 16 } } }
	cmp31_24 { ap_none {  { cmp31_24 in_data 0 1 } } }
	coeffs_25_load_cast { ap_none {  { coeffs_25_load_cast in_data 0 16 } } }
	cmp31_25 { ap_none {  { cmp31_25 in_data 0 1 } } }
	coeffs_26_load_cast { ap_none {  { coeffs_26_load_cast in_data 0 16 } } }
	cmp31_26 { ap_none {  { cmp31_26 in_data 0 1 } } }
	coeffs_27_load_cast { ap_none {  { coeffs_27_load_cast in_data 0 16 } } }
	cmp31_27 { ap_none {  { cmp31_27 in_data 0 1 } } }
	coeffs_28_load_cast { ap_none {  { coeffs_28_load_cast in_data 0 16 } } }
	cmp31_28 { ap_none {  { cmp31_28 in_data 0 1 } } }
	coeffs_29_load_cast { ap_none {  { coeffs_29_load_cast in_data 0 16 } } }
	cmp31_29 { ap_none {  { cmp31_29 in_data 0 1 } } }
	coeffs_30_load_cast { ap_none {  { coeffs_30_load_cast in_data 0 16 } } }
	cmp31_30 { ap_none {  { cmp31_30 in_data 0 1 } } }
	coeffs_31_load_cast { ap_none {  { coeffs_31_load_cast in_data 0 16 } } }
	empty { ap_none {  { empty in_data 0 1 } } }
	sext_ln44 { ap_none {  { sext_ln44 in_data 0 11 } } }
	out_stream_V_data_V { axis {  { out_stream_TREADY out_acc 0 1 }  { out_stream_TDATA out_data 1 32 } } }
	out_stream_V_keep_V { axis {  { out_stream_TKEEP out_data 1 4 } } }
	out_stream_V_strb_V { axis {  { out_stream_TSTRB out_data 1 4 } } }
	out_stream_V_last_V { axis {  { out_stream_TVALID out_vld 1 1 }  { out_stream_TLAST out_data 1 1 } } }
}
