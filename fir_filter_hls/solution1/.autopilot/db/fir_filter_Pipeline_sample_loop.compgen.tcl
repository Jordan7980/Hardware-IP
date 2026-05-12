# This script segment is generated automatically by AutoPilot

set name fir_filter_mul_16s_16s_32_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_mac_muladd_16s_16s_32s_32_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler fir_filter_mac_muladd_16s_16s_32ns_32_4_1 BINDTYPE {op} TYPE {all} IMPL {dsp_slice} LATENCY 3
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 37 \
    name in_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TVALID { I 1 bit } in_stream_TDATA { I 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 38 \
    name in_stream_V_keep_V \
    reset_level 1 \
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
    id 39 \
    name in_stream_V_strb_V \
    reset_level 1 \
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
    id 40 \
    name in_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TREADY { O 1 bit } in_stream_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 105 \
    name out_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TREADY { I 1 bit } out_stream_TDATA { O 32 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 106 \
    name out_stream_V_keep_V \
    reset_level 1 \
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
    id 107 \
    name out_stream_V_strb_V \
    reset_level 1 \
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
    id 108 \
    name out_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TVALID { O 1 bit } out_stream_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_last_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name select_ln44_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_select_ln44_1 \
    op interface \
    ports { select_ln44_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name coeffs_0_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_0_load_cast \
    op interface \
    ports { coeffs_0_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name coeffs_1_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_1_load_cast \
    op interface \
    ports { coeffs_1_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name icmp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp \
    op interface \
    ports { icmp { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name coeffs_2_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_2_load_cast \
    op interface \
    ports { coeffs_2_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name cmp31_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_2 \
    op interface \
    ports { cmp31_2 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name coeffs_3_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_3_load_cast \
    op interface \
    ports { coeffs_3_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name icmp4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp4 \
    op interface \
    ports { icmp4 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name coeffs_4_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_4_load_cast \
    op interface \
    ports { coeffs_4_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name cmp31_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_4 \
    op interface \
    ports { cmp31_4 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name coeffs_5_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_5_load_cast \
    op interface \
    ports { coeffs_5_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name cmp31_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_5 \
    op interface \
    ports { cmp31_5 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name coeffs_6_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_6_load_cast \
    op interface \
    ports { coeffs_6_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name cmp31_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_6 \
    op interface \
    ports { cmp31_6 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name coeffs_7_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_7_load_cast \
    op interface \
    ports { coeffs_7_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name icmp7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp7 \
    op interface \
    ports { icmp7 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name coeffs_8_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_8_load_cast \
    op interface \
    ports { coeffs_8_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name cmp31_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_8 \
    op interface \
    ports { cmp31_8 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name coeffs_9_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_9_load_cast \
    op interface \
    ports { coeffs_9_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name cmp31_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_9 \
    op interface \
    ports { cmp31_9 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name coeffs_10_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_10_load_cast \
    op interface \
    ports { coeffs_10_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name cmp31_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_10 \
    op interface \
    ports { cmp31_10 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name coeffs_11_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_11_load_cast \
    op interface \
    ports { coeffs_11_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name cmp31_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_11 \
    op interface \
    ports { cmp31_11 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name coeffs_12_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_12_load_cast \
    op interface \
    ports { coeffs_12_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name cmp31_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_12 \
    op interface \
    ports { cmp31_12 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name coeffs_13_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_13_load_cast \
    op interface \
    ports { coeffs_13_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name cmp31_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_13 \
    op interface \
    ports { cmp31_13 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name coeffs_14_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_14_load_cast \
    op interface \
    ports { coeffs_14_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name cmp31_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_14 \
    op interface \
    ports { cmp31_14 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name coeffs_15_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_15_load_cast \
    op interface \
    ports { coeffs_15_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name icmp10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_icmp10 \
    op interface \
    ports { icmp10 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name coeffs_16_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_16_load_cast \
    op interface \
    ports { coeffs_16_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name cmp31_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_16 \
    op interface \
    ports { cmp31_16 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name coeffs_17_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_17_load_cast \
    op interface \
    ports { coeffs_17_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name cmp31_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_17 \
    op interface \
    ports { cmp31_17 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name coeffs_18_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_18_load_cast \
    op interface \
    ports { coeffs_18_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name cmp31_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_18 \
    op interface \
    ports { cmp31_18 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name coeffs_19_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_19_load_cast \
    op interface \
    ports { coeffs_19_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name cmp31_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_19 \
    op interface \
    ports { cmp31_19 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name coeffs_20_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_20_load_cast \
    op interface \
    ports { coeffs_20_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name cmp31_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_20 \
    op interface \
    ports { cmp31_20 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name coeffs_21_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_21_load_cast \
    op interface \
    ports { coeffs_21_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name cmp31_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_21 \
    op interface \
    ports { cmp31_21 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name coeffs_22_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_22_load_cast \
    op interface \
    ports { coeffs_22_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name cmp31_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_22 \
    op interface \
    ports { cmp31_22 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name coeffs_23_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_23_load_cast \
    op interface \
    ports { coeffs_23_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name cmp31_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_23 \
    op interface \
    ports { cmp31_23 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name coeffs_24_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_24_load_cast \
    op interface \
    ports { coeffs_24_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name cmp31_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_24 \
    op interface \
    ports { cmp31_24 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name coeffs_25_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_25_load_cast \
    op interface \
    ports { coeffs_25_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name cmp31_25 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_25 \
    op interface \
    ports { cmp31_25 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name coeffs_26_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_26_load_cast \
    op interface \
    ports { coeffs_26_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name cmp31_26 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_26 \
    op interface \
    ports { cmp31_26 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name coeffs_27_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_27_load_cast \
    op interface \
    ports { coeffs_27_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name cmp31_27 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_27 \
    op interface \
    ports { cmp31_27 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name coeffs_28_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_28_load_cast \
    op interface \
    ports { coeffs_28_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name cmp31_28 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_28 \
    op interface \
    ports { cmp31_28 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name coeffs_29_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_29_load_cast \
    op interface \
    ports { coeffs_29_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name cmp31_29 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_29 \
    op interface \
    ports { cmp31_29 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name coeffs_30_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_30_load_cast \
    op interface \
    ports { coeffs_30_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name cmp31_30 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cmp31_30 \
    op interface \
    ports { cmp31_30 { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name coeffs_31_load_cast \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_coeffs_31_load_cast \
    op interface \
    ports { coeffs_31_load_cast { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name sext_ln44 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sext_ln44 \
    op interface \
    ports { sext_ln44 { I 11 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
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
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
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


# flow_control definition:
set InstName fir_filter_flow_control_loop_pipe_sequential_init_U
set CompName fir_filter_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix fir_filter_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


