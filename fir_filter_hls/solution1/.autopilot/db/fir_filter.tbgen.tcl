set moduleName fir_filter
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {fir_filter}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ in_stream_V_data_V int 32 regular {axi_s 0 volatile  { in_stream Data } }  }
	{ in_stream_V_keep_V int 4 regular {axi_s 0 volatile  { in_stream Keep } }  }
	{ in_stream_V_strb_V int 4 regular {axi_s 0 volatile  { in_stream Strb } }  }
	{ in_stream_V_last_V int 1 regular {axi_s 0 volatile  { in_stream Last } }  }
	{ out_stream_V_data_V int 32 regular {axi_s 1 volatile  { out_stream Data } }  }
	{ out_stream_V_keep_V int 4 regular {axi_s 1 volatile  { out_stream Keep } }  }
	{ out_stream_V_strb_V int 4 regular {axi_s 1 volatile  { out_stream Strb } }  }
	{ out_stream_V_last_V int 1 regular {axi_s 1 volatile  { out_stream Last } }  }
	{ coeffs_0 int 16 regular {axi_slave 0}  }
	{ coeffs_1 int 16 regular {axi_slave 0}  }
	{ coeffs_2 int 16 regular {axi_slave 0}  }
	{ coeffs_3 int 16 regular {axi_slave 0}  }
	{ coeffs_4 int 16 regular {axi_slave 0}  }
	{ coeffs_5 int 16 regular {axi_slave 0}  }
	{ coeffs_6 int 16 regular {axi_slave 0}  }
	{ coeffs_7 int 16 regular {axi_slave 0}  }
	{ coeffs_8 int 16 regular {axi_slave 0}  }
	{ coeffs_9 int 16 regular {axi_slave 0}  }
	{ coeffs_10 int 16 regular {axi_slave 0}  }
	{ coeffs_11 int 16 regular {axi_slave 0}  }
	{ coeffs_12 int 16 regular {axi_slave 0}  }
	{ coeffs_13 int 16 regular {axi_slave 0}  }
	{ coeffs_14 int 16 regular {axi_slave 0}  }
	{ coeffs_15 int 16 regular {axi_slave 0}  }
	{ coeffs_16 int 16 regular {axi_slave 0}  }
	{ coeffs_17 int 16 regular {axi_slave 0}  }
	{ coeffs_18 int 16 regular {axi_slave 0}  }
	{ coeffs_19 int 16 regular {axi_slave 0}  }
	{ coeffs_20 int 16 regular {axi_slave 0}  }
	{ coeffs_21 int 16 regular {axi_slave 0}  }
	{ coeffs_22 int 16 regular {axi_slave 0}  }
	{ coeffs_23 int 16 regular {axi_slave 0}  }
	{ coeffs_24 int 16 regular {axi_slave 0}  }
	{ coeffs_25 int 16 regular {axi_slave 0}  }
	{ coeffs_26 int 16 regular {axi_slave 0}  }
	{ coeffs_27 int 16 regular {axi_slave 0}  }
	{ coeffs_28 int 16 regular {axi_slave 0}  }
	{ coeffs_29 int 16 regular {axi_slave 0}  }
	{ coeffs_30 int 16 regular {axi_slave 0}  }
	{ coeffs_31 int 16 regular {axi_slave 0}  }
	{ num_taps int 32 regular {axi_slave 0}  }
	{ num_samples int 32 regular {axi_slave 0}  }
}
set hasAXIMCache 0
set hasAXIML2Cache 0
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "in_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_stream_V_data_V", "interface" : "axis", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_keep_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_strb_V", "interface" : "axis", "bitwidth" : 4, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "coeffs_0", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "coeffs_1", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "coeffs_2", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} , 
 	{ "Name" : "coeffs_3", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":47}} , 
 	{ "Name" : "coeffs_4", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":48}, "offset_end" : {"in":55}} , 
 	{ "Name" : "coeffs_5", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":56}, "offset_end" : {"in":63}} , 
 	{ "Name" : "coeffs_6", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":64}, "offset_end" : {"in":71}} , 
 	{ "Name" : "coeffs_7", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "coeffs_8", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":80}, "offset_end" : {"in":87}} , 
 	{ "Name" : "coeffs_9", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":88}, "offset_end" : {"in":95}} , 
 	{ "Name" : "coeffs_10", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":96}, "offset_end" : {"in":103}} , 
 	{ "Name" : "coeffs_11", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":104}, "offset_end" : {"in":111}} , 
 	{ "Name" : "coeffs_12", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":112}, "offset_end" : {"in":119}} , 
 	{ "Name" : "coeffs_13", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":120}, "offset_end" : {"in":127}} , 
 	{ "Name" : "coeffs_14", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":128}, "offset_end" : {"in":135}} , 
 	{ "Name" : "coeffs_15", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":136}, "offset_end" : {"in":143}} , 
 	{ "Name" : "coeffs_16", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":144}, "offset_end" : {"in":151}} , 
 	{ "Name" : "coeffs_17", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":152}, "offset_end" : {"in":159}} , 
 	{ "Name" : "coeffs_18", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":160}, "offset_end" : {"in":167}} , 
 	{ "Name" : "coeffs_19", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":168}, "offset_end" : {"in":175}} , 
 	{ "Name" : "coeffs_20", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":176}, "offset_end" : {"in":183}} , 
 	{ "Name" : "coeffs_21", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":184}, "offset_end" : {"in":191}} , 
 	{ "Name" : "coeffs_22", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":192}, "offset_end" : {"in":199}} , 
 	{ "Name" : "coeffs_23", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":200}, "offset_end" : {"in":207}} , 
 	{ "Name" : "coeffs_24", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":208}, "offset_end" : {"in":215}} , 
 	{ "Name" : "coeffs_25", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":216}, "offset_end" : {"in":223}} , 
 	{ "Name" : "coeffs_26", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":224}, "offset_end" : {"in":231}} , 
 	{ "Name" : "coeffs_27", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":232}, "offset_end" : {"in":239}} , 
 	{ "Name" : "coeffs_28", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":240}, "offset_end" : {"in":247}} , 
 	{ "Name" : "coeffs_29", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":248}, "offset_end" : {"in":255}} , 
 	{ "Name" : "coeffs_30", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":256}, "offset_end" : {"in":263}} , 
 	{ "Name" : "coeffs_31", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 16, "direction" : "READONLY", "offset" : {"in":264}, "offset_end" : {"in":271}} , 
 	{ "Name" : "num_taps", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":272}, "offset_end" : {"in":279}} , 
 	{ "Name" : "num_samples", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":280}, "offset_end" : {"in":287}} ]}
# RTL Port declarations: 
set portNum 32
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_stream_TDATA sc_in sc_lv 32 signal 0 } 
	{ in_stream_TVALID sc_in sc_logic 1 invld 3 } 
	{ in_stream_TREADY sc_out sc_logic 1 inacc 3 } 
	{ in_stream_TKEEP sc_in sc_lv 4 signal 1 } 
	{ in_stream_TSTRB sc_in sc_lv 4 signal 2 } 
	{ in_stream_TLAST sc_in sc_lv 1 signal 3 } 
	{ out_stream_TDATA sc_out sc_lv 32 signal 4 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 7 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 7 } 
	{ out_stream_TKEEP sc_out sc_lv 4 signal 5 } 
	{ out_stream_TSTRB sc_out sc_lv 4 signal 6 } 
	{ out_stream_TLAST sc_out sc_lv 1 signal 7 } 
	{ s_axi_CTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_CTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_CTRL_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "CTRL", "role": "AWADDR" },"address":[{"name":"fir_filter","role":"start","value":"0","valid_bit":"0"},{"name":"fir_filter","role":"continue","value":"0","valid_bit":"4"},{"name":"fir_filter","role":"auto_start","value":"0","valid_bit":"7"},{"name":"coeffs_0","role":"data","value":"16"},{"name":"coeffs_1","role":"data","value":"24"},{"name":"coeffs_2","role":"data","value":"32"},{"name":"coeffs_3","role":"data","value":"40"},{"name":"coeffs_4","role":"data","value":"48"},{"name":"coeffs_5","role":"data","value":"56"},{"name":"coeffs_6","role":"data","value":"64"},{"name":"coeffs_7","role":"data","value":"72"},{"name":"coeffs_8","role":"data","value":"80"},{"name":"coeffs_9","role":"data","value":"88"},{"name":"coeffs_10","role":"data","value":"96"},{"name":"coeffs_11","role":"data","value":"104"},{"name":"coeffs_12","role":"data","value":"112"},{"name":"coeffs_13","role":"data","value":"120"},{"name":"coeffs_14","role":"data","value":"128"},{"name":"coeffs_15","role":"data","value":"136"},{"name":"coeffs_16","role":"data","value":"144"},{"name":"coeffs_17","role":"data","value":"152"},{"name":"coeffs_18","role":"data","value":"160"},{"name":"coeffs_19","role":"data","value":"168"},{"name":"coeffs_20","role":"data","value":"176"},{"name":"coeffs_21","role":"data","value":"184"},{"name":"coeffs_22","role":"data","value":"192"},{"name":"coeffs_23","role":"data","value":"200"},{"name":"coeffs_24","role":"data","value":"208"},{"name":"coeffs_25","role":"data","value":"216"},{"name":"coeffs_26","role":"data","value":"224"},{"name":"coeffs_27","role":"data","value":"232"},{"name":"coeffs_28","role":"data","value":"240"},{"name":"coeffs_29","role":"data","value":"248"},{"name":"coeffs_30","role":"data","value":"256"},{"name":"coeffs_31","role":"data","value":"264"},{"name":"num_taps","role":"data","value":"272"},{"name":"num_samples","role":"data","value":"280"}] },
	{ "name": "s_axi_CTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "CTRL", "role": "ARADDR" },"address":[{"name":"fir_filter","role":"start","value":"0","valid_bit":"0"},{"name":"fir_filter","role":"done","value":"0","valid_bit":"1"},{"name":"fir_filter","role":"idle","value":"0","valid_bit":"2"},{"name":"fir_filter","role":"ready","value":"0","valid_bit":"3"},{"name":"fir_filter","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_CTRL_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "in_stream_V_data_V", "role": "default" }} , 
 	{ "name": "in_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "in_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "in_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "in_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "in_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "in_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "out_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "out_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "out_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "35", "36", "37", "38", "39", "40", "41", "42", "43"],
		"CDFG" : "fir_filter",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "33", "EstimateLatencyMax" : "1061",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "in_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "in_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "in_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "in_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "in_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "out_stream_V_data_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "out_stream_V_keep_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "out_stream_V_strb_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_fir_filter_Pipeline_sample_loop_fu_498", "Port" : "out_stream_V_last_V", "Inst_start_state" : "2", "Inst_end_state" : "3"}]},
			{"Name" : "coeffs_0", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_2", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_3", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_4", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_6", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_7", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_8", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_11", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_13", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_14", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_15", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_16", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_17", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_18", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_19", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_20", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_21", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_22", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_23", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_24", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_25", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_26", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_27", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_28", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_29", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_30", "Type" : "None", "Direction" : "I"},
			{"Name" : "coeffs_31", "Type" : "None", "Direction" : "I"},
			{"Name" : "num_taps", "Type" : "None", "Direction" : "I"},
			{"Name" : "num_samples", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34"],
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
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mul_16s_16s_32_1_1_U1", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32s_32_4_1_U2", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U3", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U4", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U5", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U6", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U7", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U8", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U9", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U10", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U11", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U12", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U13", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U14", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U15", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U16", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U17", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U18", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U19", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U20", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U21", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U22", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U23", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U24", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U25", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U26", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U27", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U28", "Parent" : "1"},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U29", "Parent" : "1"},
	{"ID" : "31", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U30", "Parent" : "1"},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U31", "Parent" : "1"},
	{"ID" : "33", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.mac_muladd_16s_16s_32ns_32_4_1_U32", "Parent" : "1"},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_fir_filter_Pipeline_sample_loop_fu_498.flow_control_loop_pipe_sequential_init_U", "Parent" : "1"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CTRL_s_axi_U", "Parent" : "0"},
	{"ID" : "36", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "38", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "39", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "40", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "41", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "42", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "43", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	fir_filter {
		in_stream_V_data_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_keep_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_strb_V {Type I LastRead 1 FirstWrite -1}
		in_stream_V_last_V {Type I LastRead 1 FirstWrite -1}
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 34}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 34}
		coeffs_0 {Type I LastRead 0 FirstWrite -1}
		coeffs_1 {Type I LastRead 0 FirstWrite -1}
		coeffs_2 {Type I LastRead 0 FirstWrite -1}
		coeffs_3 {Type I LastRead 0 FirstWrite -1}
		coeffs_4 {Type I LastRead 0 FirstWrite -1}
		coeffs_5 {Type I LastRead 0 FirstWrite -1}
		coeffs_6 {Type I LastRead 0 FirstWrite -1}
		coeffs_7 {Type I LastRead 0 FirstWrite -1}
		coeffs_8 {Type I LastRead 0 FirstWrite -1}
		coeffs_9 {Type I LastRead 0 FirstWrite -1}
		coeffs_10 {Type I LastRead 0 FirstWrite -1}
		coeffs_11 {Type I LastRead 0 FirstWrite -1}
		coeffs_12 {Type I LastRead 0 FirstWrite -1}
		coeffs_13 {Type I LastRead 0 FirstWrite -1}
		coeffs_14 {Type I LastRead 0 FirstWrite -1}
		coeffs_15 {Type I LastRead 0 FirstWrite -1}
		coeffs_16 {Type I LastRead 0 FirstWrite -1}
		coeffs_17 {Type I LastRead 0 FirstWrite -1}
		coeffs_18 {Type I LastRead 0 FirstWrite -1}
		coeffs_19 {Type I LastRead 0 FirstWrite -1}
		coeffs_20 {Type I LastRead 0 FirstWrite -1}
		coeffs_21 {Type I LastRead 0 FirstWrite -1}
		coeffs_22 {Type I LastRead 0 FirstWrite -1}
		coeffs_23 {Type I LastRead 0 FirstWrite -1}
		coeffs_24 {Type I LastRead 0 FirstWrite -1}
		coeffs_25 {Type I LastRead 0 FirstWrite -1}
		coeffs_26 {Type I LastRead 0 FirstWrite -1}
		coeffs_27 {Type I LastRead 0 FirstWrite -1}
		coeffs_28 {Type I LastRead 0 FirstWrite -1}
		coeffs_29 {Type I LastRead 0 FirstWrite -1}
		coeffs_30 {Type I LastRead 0 FirstWrite -1}
		coeffs_31 {Type I LastRead 0 FirstWrite -1}
		num_taps {Type I LastRead 0 FirstWrite -1}
		num_samples {Type I LastRead 0 FirstWrite -1}}
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
	{"Name" : "Latency", "Min" : "33", "Max" : "1061"}
	, {"Name" : "Interval", "Min" : "34", "Max" : "1062"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_stream_V_data_V { axis {  { in_stream_TDATA in_data 0 32 } } }
	in_stream_V_keep_V { axis {  { in_stream_TKEEP in_data 0 4 } } }
	in_stream_V_strb_V { axis {  { in_stream_TSTRB in_data 0 4 } } }
	in_stream_V_last_V { axis {  { in_stream_TVALID in_vld 0 1 }  { in_stream_TREADY in_acc 1 1 }  { in_stream_TLAST in_data 0 1 } } }
	out_stream_V_data_V { axis {  { out_stream_TDATA out_data 1 32 } } }
	out_stream_V_keep_V { axis {  { out_stream_TKEEP out_data 1 4 } } }
	out_stream_V_strb_V { axis {  { out_stream_TSTRB out_data 1 4 } } }
	out_stream_V_last_V { axis {  { out_stream_TVALID out_vld 1 1 }  { out_stream_TREADY out_acc 0 1 }  { out_stream_TLAST out_data 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
