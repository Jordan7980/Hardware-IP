# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
set port_CTRL {
coeffs_0 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
coeffs_1 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 24
	offset_end 31
}
coeffs_2 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
coeffs_3 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 40
	offset_end 47
}
coeffs_4 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
coeffs_5 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 56
	offset_end 63
}
coeffs_6 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
coeffs_7 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
coeffs_8 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
coeffs_9 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 88
	offset_end 95
}
coeffs_10 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
coeffs_11 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 104
	offset_end 111
}
coeffs_12 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
coeffs_13 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 120
	offset_end 127
}
coeffs_14 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
coeffs_15 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 136
	offset_end 143
}
coeffs_16 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
coeffs_17 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 152
	offset_end 159
}
coeffs_18 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
coeffs_19 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 168
	offset_end 175
}
coeffs_20 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 176
	offset_end 183
}
coeffs_21 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 184
	offset_end 191
}
coeffs_22 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 192
	offset_end 199
}
coeffs_23 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 200
	offset_end 207
}
coeffs_24 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 208
	offset_end 215
}
coeffs_25 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 216
	offset_end 223
}
coeffs_26 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 224
	offset_end 231
}
coeffs_27 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 232
	offset_end 239
}
coeffs_28 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 240
	offset_end 247
}
coeffs_29 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 248
	offset_end 255
}
coeffs_30 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 256
	offset_end 263
}
coeffs_31 { 
	dir I
	width 16
	depth 1
	mode ap_none
	offset 264
	offset_end 271
}
num_taps { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 272
	offset_end 279
}
num_samples { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 280
	offset_end 287
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict CTRL $port_CTRL


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 109 \
			corename fir_filter_CTRL_axilite \
			name fir_filter_CTRL_s_axi \
			ports {$port_CTRL} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'CTRL'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_CTRL_s_axi BINDTYPE interface TYPE interface_s_axilite
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 110 \
    name in_stream_V_data_V \
    reset_level 0 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TDATA { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 111 \
    name in_stream_V_keep_V \
    reset_level 0 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TKEEP { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 112 \
    name in_stream_V_strb_V \
    reset_level 0 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TSTRB { I 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 113 \
    name in_stream_V_last_V \
    reset_level 0 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TVALID { I 1 bit } in_stream_TREADY { O 1 bit } in_stream_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 114 \
    name out_stream_V_data_V \
    reset_level 0 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TDATA { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 115 \
    name out_stream_V_keep_V \
    reset_level 0 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TKEEP { O 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 116 \
    name out_stream_V_strb_V \
    reset_level 0 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TSTRB { O 4 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 117 \
    name out_stream_V_last_V \
    reset_level 0 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TVALID { O 1 bit } out_stream_TREADY { I 1 bit } out_stream_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_last_V'"
}
}



# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_regslice_both BINDTYPE {interface} TYPE {adapter} IMPL {reg_slice}
}


