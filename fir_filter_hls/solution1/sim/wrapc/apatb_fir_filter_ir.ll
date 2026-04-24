; ModuleID = 'C:/Users/jaysh/OneDrive/Desktop/applied_hardware_project/Hardware-IP/fir_filter_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" = type { %"struct.hls::axis<ap_uint<32>, 0, 0, 0, '8', false>" }
%"struct.hls::axis<ap_uint<32>, 0, 0, 0, '8', false>" = type { %"struct.ap_uint<32>", %"struct.ap_uint<4>", %"struct.ap_uint<4>", %"struct.hls::axis_disabled_signal", %"struct.ap_uint<1>", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal" }
%"struct.ap_uint<32>" = type { %"struct.ap_int_base<32, false>" }
%"struct.ap_int_base<32, false>" = type { %"struct.ssdm_int<32, false>" }
%"struct.ssdm_int<32, false>" = type { i32 }
%"struct.ap_uint<4>" = type { %"struct.ap_int_base<4, false>" }
%"struct.ap_int_base<4, false>" = type { %"struct.ssdm_int<4, false>" }
%"struct.ssdm_int<4, false>" = type { i4 }
%"struct.ap_uint<1>" = type { %"struct.ap_int_base<1, false>" }
%"struct.ap_int_base<1, false>" = type { %"struct.ssdm_int<1, false>" }
%"struct.ssdm_int<1, false>" = type { i1 }
%"struct.hls::axis_disabled_signal" = type { i8 }
%"struct.ap_int<16>" = type { %"struct.ap_int_base<16, true>" }
%"struct.ap_int_base<16, true>" = type { %"struct.ssdm_int<16, true>" }
%"struct.ssdm_int<16, true>" = type { i16 }

; Function Attrs: noinline willreturn
define void @apatb_fir_filter_ir(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nonnull dereferenceable(12) %in_stream, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nonnull dereferenceable(12) %out_stream, %"struct.ap_int<16>"* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="32" "partition" %coeffs, i32 %num_taps, i32 %num_samples) local_unnamed_addr #0 {
entry:
  %in_stream_copy.data = alloca i32, align 512
  %in_stream_copy.keep = alloca i4, align 512
  %in_stream_copy.strb = alloca i4, align 512
  %in_stream_copy.last = alloca i1, align 512
  %out_stream_copy.data = alloca i32, align 512
  %out_stream_copy.keep = alloca i4, align 512
  %out_stream_copy.strb = alloca i4, align 512
  %out_stream_copy.last = alloca i1, align 512
  %coeffs_copy_0 = alloca i16, align 512
  %coeffs_copy_1 = alloca i16, align 512
  %coeffs_copy_2 = alloca i16, align 512
  %coeffs_copy_3 = alloca i16, align 512
  %coeffs_copy_4 = alloca i16, align 512
  %coeffs_copy_5 = alloca i16, align 512
  %coeffs_copy_6 = alloca i16, align 512
  %coeffs_copy_7 = alloca i16, align 512
  %coeffs_copy_8 = alloca i16, align 512
  %coeffs_copy_9 = alloca i16, align 512
  %coeffs_copy_10 = alloca i16, align 512
  %coeffs_copy_11 = alloca i16, align 512
  %coeffs_copy_12 = alloca i16, align 512
  %coeffs_copy_13 = alloca i16, align 512
  %coeffs_copy_14 = alloca i16, align 512
  %coeffs_copy_15 = alloca i16, align 512
  %coeffs_copy_16 = alloca i16, align 512
  %coeffs_copy_17 = alloca i16, align 512
  %coeffs_copy_18 = alloca i16, align 512
  %coeffs_copy_19 = alloca i16, align 512
  %coeffs_copy_20 = alloca i16, align 512
  %coeffs_copy_21 = alloca i16, align 512
  %coeffs_copy_22 = alloca i16, align 512
  %coeffs_copy_23 = alloca i16, align 512
  %coeffs_copy_24 = alloca i16, align 512
  %coeffs_copy_25 = alloca i16, align 512
  %coeffs_copy_26 = alloca i16, align 512
  %coeffs_copy_27 = alloca i16, align 512
  %coeffs_copy_28 = alloca i16, align 512
  %coeffs_copy_29 = alloca i16, align 512
  %coeffs_copy_30 = alloca i16, align 512
  %coeffs_copy_31 = alloca i16, align 512
  %0 = bitcast %"struct.ap_int<16>"* %coeffs to [32 x %"struct.ap_int<16>"]*
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* nonnull %in_stream, i32* nonnull align 512 %in_stream_copy.data, i4* nonnull align 512 %in_stream_copy.keep, i4* nonnull align 512 %in_stream_copy.strb, i1* nonnull align 512 %in_stream_copy.last, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* nonnull %out_stream, i32* nonnull align 512 %out_stream_copy.data, i4* nonnull align 512 %out_stream_copy.keep, i4* nonnull align 512 %out_stream_copy.strb, i1* nonnull align 512 %out_stream_copy.last, [32 x %"struct.ap_int<16>"]* nonnull %0, i16* nonnull align 512 %coeffs_copy_0, i16* nonnull align 512 %coeffs_copy_1, i16* nonnull align 512 %coeffs_copy_2, i16* nonnull align 512 %coeffs_copy_3, i16* nonnull align 512 %coeffs_copy_4, i16* nonnull align 512 %coeffs_copy_5, i16* nonnull align 512 %coeffs_copy_6, i16* nonnull align 512 %coeffs_copy_7, i16* nonnull align 512 %coeffs_copy_8, i16* nonnull align 512 %coeffs_copy_9, i16* nonnull align 512 %coeffs_copy_10, i16* nonnull align 512 %coeffs_copy_11, i16* nonnull align 512 %coeffs_copy_12, i16* nonnull align 512 %coeffs_copy_13, i16* nonnull align 512 %coeffs_copy_14, i16* nonnull align 512 %coeffs_copy_15, i16* nonnull align 512 %coeffs_copy_16, i16* nonnull align 512 %coeffs_copy_17, i16* nonnull align 512 %coeffs_copy_18, i16* nonnull align 512 %coeffs_copy_19, i16* nonnull align 512 %coeffs_copy_20, i16* nonnull align 512 %coeffs_copy_21, i16* nonnull align 512 %coeffs_copy_22, i16* nonnull align 512 %coeffs_copy_23, i16* nonnull align 512 %coeffs_copy_24, i16* nonnull align 512 %coeffs_copy_25, i16* nonnull align 512 %coeffs_copy_26, i16* nonnull align 512 %coeffs_copy_27, i16* nonnull align 512 %coeffs_copy_28, i16* nonnull align 512 %coeffs_copy_29, i16* nonnull align 512 %coeffs_copy_30, i16* nonnull align 512 %coeffs_copy_31)
  call void @apatb_fir_filter_hw(i32* %in_stream_copy.data, i4* %in_stream_copy.keep, i4* %in_stream_copy.strb, i1* %in_stream_copy.last, i32* %out_stream_copy.data, i4* %out_stream_copy.keep, i4* %out_stream_copy.strb, i1* %out_stream_copy.last, i16* %coeffs_copy_0, i16* %coeffs_copy_1, i16* %coeffs_copy_2, i16* %coeffs_copy_3, i16* %coeffs_copy_4, i16* %coeffs_copy_5, i16* %coeffs_copy_6, i16* %coeffs_copy_7, i16* %coeffs_copy_8, i16* %coeffs_copy_9, i16* %coeffs_copy_10, i16* %coeffs_copy_11, i16* %coeffs_copy_12, i16* %coeffs_copy_13, i16* %coeffs_copy_14, i16* %coeffs_copy_15, i16* %coeffs_copy_16, i16* %coeffs_copy_17, i16* %coeffs_copy_18, i16* %coeffs_copy_19, i16* %coeffs_copy_20, i16* %coeffs_copy_21, i16* %coeffs_copy_22, i16* %coeffs_copy_23, i16* %coeffs_copy_24, i16* %coeffs_copy_25, i16* %coeffs_copy_26, i16* %coeffs_copy_27, i16* %coeffs_copy_28, i16* %coeffs_copy_29, i16* %coeffs_copy_30, i16* %coeffs_copy_31, i32 %num_taps, i32 %num_samples)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %in_stream, i32* %in_stream_copy.data, i4* %in_stream_copy.keep, i4* %in_stream_copy.strb, i1* %in_stream_copy.last, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %out_stream, i32* %out_stream_copy.data, i4* %out_stream_copy.keep, i4* %out_stream_copy.strb, i1* %out_stream_copy.last, [32 x %"struct.ap_int<16>"]* %0, i16* %coeffs_copy_0, i16* %coeffs_copy_1, i16* %coeffs_copy_2, i16* %coeffs_copy_3, i16* %coeffs_copy_4, i16* %coeffs_copy_5, i16* %coeffs_copy_6, i16* %coeffs_copy_7, i16* %coeffs_copy_8, i16* %coeffs_copy_9, i16* %coeffs_copy_10, i16* %coeffs_copy_11, i16* %coeffs_copy_12, i16* %coeffs_copy_13, i16* %coeffs_copy_14, i16* %coeffs_copy_15, i16* %coeffs_copy_16, i16* %coeffs_copy_17, i16* %coeffs_copy_18, i16* %coeffs_copy_19, i16* %coeffs_copy_20, i16* %coeffs_copy_21, i16* %coeffs_copy_22, i16* %coeffs_copy_23, i16* %coeffs_copy_24, i16* %coeffs_copy_25, i16* %coeffs_copy_26, i16* %coeffs_copy_27, i16* %coeffs_copy_28, i16* %coeffs_copy_29, i16* %coeffs_copy_30, i16* %coeffs_copy_31)
  ret void
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #1

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<16>"(i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.5" %dst_5, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.6" %dst_6, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.7" %dst_7, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.8" %dst_8, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.9" %dst_9, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.10" %dst_10, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.11" %dst_11, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.12" %dst_12, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.13" %dst_13, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.14" %dst_14, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.15" %dst_15, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.16" %dst_16, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.17" %dst_17, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.18" %dst_18, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.19" %dst_19, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.20" %dst_20, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.21" %dst_21, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.22" %dst_22, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.23" %dst_23, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.24" %dst_24, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.25" %dst_25, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.26" %dst_26, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.27" %dst_27, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.28" %dst_28, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.29" %dst_29, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.30" %dst_30, i16* nocapture "orig.arg.no"="0" "unpacked"="0.0.31" %dst_31, [32 x %"struct.ap_int<16>"]* readonly "orig.arg.no"="1" "unpacked"="1" %src, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.0.0.06.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.0.0.06.exit ]
  %src.addr.0.0.05 = getelementptr [32 x %"struct.ap_int<16>"], [32 x %"struct.ap_int<16>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i16, i16* %src.addr.0.0.05, align 2
  switch i64 %for.loop.idx2, label %dst.addr.0.0.06.case.31 [
    i64 0, label %dst.addr.0.0.06.case.0
    i64 1, label %dst.addr.0.0.06.case.1
    i64 2, label %dst.addr.0.0.06.case.2
    i64 3, label %dst.addr.0.0.06.case.3
    i64 4, label %dst.addr.0.0.06.case.4
    i64 5, label %dst.addr.0.0.06.case.5
    i64 6, label %dst.addr.0.0.06.case.6
    i64 7, label %dst.addr.0.0.06.case.7
    i64 8, label %dst.addr.0.0.06.case.8
    i64 9, label %dst.addr.0.0.06.case.9
    i64 10, label %dst.addr.0.0.06.case.10
    i64 11, label %dst.addr.0.0.06.case.11
    i64 12, label %dst.addr.0.0.06.case.12
    i64 13, label %dst.addr.0.0.06.case.13
    i64 14, label %dst.addr.0.0.06.case.14
    i64 15, label %dst.addr.0.0.06.case.15
    i64 16, label %dst.addr.0.0.06.case.16
    i64 17, label %dst.addr.0.0.06.case.17
    i64 18, label %dst.addr.0.0.06.case.18
    i64 19, label %dst.addr.0.0.06.case.19
    i64 20, label %dst.addr.0.0.06.case.20
    i64 21, label %dst.addr.0.0.06.case.21
    i64 22, label %dst.addr.0.0.06.case.22
    i64 23, label %dst.addr.0.0.06.case.23
    i64 24, label %dst.addr.0.0.06.case.24
    i64 25, label %dst.addr.0.0.06.case.25
    i64 26, label %dst.addr.0.0.06.case.26
    i64 27, label %dst.addr.0.0.06.case.27
    i64 28, label %dst.addr.0.0.06.case.28
    i64 29, label %dst.addr.0.0.06.case.29
    i64 30, label %dst.addr.0.0.06.case.30
  ]

dst.addr.0.0.06.case.0:                           ; preds = %for.loop
  store i16 %1, i16* %dst_0, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.1:                           ; preds = %for.loop
  store i16 %1, i16* %dst_1, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.2:                           ; preds = %for.loop
  store i16 %1, i16* %dst_2, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.3:                           ; preds = %for.loop
  store i16 %1, i16* %dst_3, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.4:                           ; preds = %for.loop
  store i16 %1, i16* %dst_4, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.5:                           ; preds = %for.loop
  store i16 %1, i16* %dst_5, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.6:                           ; preds = %for.loop
  store i16 %1, i16* %dst_6, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.7:                           ; preds = %for.loop
  store i16 %1, i16* %dst_7, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.8:                           ; preds = %for.loop
  store i16 %1, i16* %dst_8, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.9:                           ; preds = %for.loop
  store i16 %1, i16* %dst_9, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.10:                          ; preds = %for.loop
  store i16 %1, i16* %dst_10, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.11:                          ; preds = %for.loop
  store i16 %1, i16* %dst_11, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.12:                          ; preds = %for.loop
  store i16 %1, i16* %dst_12, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.13:                          ; preds = %for.loop
  store i16 %1, i16* %dst_13, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.14:                          ; preds = %for.loop
  store i16 %1, i16* %dst_14, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.15:                          ; preds = %for.loop
  store i16 %1, i16* %dst_15, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.16:                          ; preds = %for.loop
  store i16 %1, i16* %dst_16, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.17:                          ; preds = %for.loop
  store i16 %1, i16* %dst_17, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.18:                          ; preds = %for.loop
  store i16 %1, i16* %dst_18, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.19:                          ; preds = %for.loop
  store i16 %1, i16* %dst_19, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.20:                          ; preds = %for.loop
  store i16 %1, i16* %dst_20, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.21:                          ; preds = %for.loop
  store i16 %1, i16* %dst_21, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.22:                          ; preds = %for.loop
  store i16 %1, i16* %dst_22, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.23:                          ; preds = %for.loop
  store i16 %1, i16* %dst_23, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.24:                          ; preds = %for.loop
  store i16 %1, i16* %dst_24, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.25:                          ; preds = %for.loop
  store i16 %1, i16* %dst_25, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.26:                          ; preds = %for.loop
  store i16 %1, i16* %dst_26, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.27:                          ; preds = %for.loop
  store i16 %1, i16* %dst_27, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.28:                          ; preds = %for.loop
  store i16 %1, i16* %dst_28, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.29:                          ; preds = %for.loop
  store i16 %1, i16* %dst_29, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.30:                          ; preds = %for.loop
  store i16 %1, i16* %dst_30, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.case.31:                          ; preds = %for.loop
  %2 = icmp eq i64 %for.loop.idx2, 31
  call void @llvm.assume(i1 %2)
  store i16 %1, i16* %dst_31, align 2
  br label %dst.addr.0.0.06.exit

dst.addr.0.0.06.exit:                             ; preds = %dst.addr.0.0.06.case.31, %dst.addr.0.0.06.case.30, %dst.addr.0.0.06.case.29, %dst.addr.0.0.06.case.28, %dst.addr.0.0.06.case.27, %dst.addr.0.0.06.case.26, %dst.addr.0.0.06.case.25, %dst.addr.0.0.06.case.24, %dst.addr.0.0.06.case.23, %dst.addr.0.0.06.case.22, %dst.addr.0.0.06.case.21, %dst.addr.0.0.06.case.20, %dst.addr.0.0.06.case.19, %dst.addr.0.0.06.case.18, %dst.addr.0.0.06.case.17, %dst.addr.0.0.06.case.16, %dst.addr.0.0.06.case.15, %dst.addr.0.0.06.case.14, %dst.addr.0.0.06.case.13, %dst.addr.0.0.06.case.12, %dst.addr.0.0.06.case.11, %dst.addr.0.0.06.case.10, %dst.addr.0.0.06.case.9, %dst.addr.0.0.06.case.8, %dst.addr.0.0.06.case.7, %dst.addr.0.0.06.case.6, %dst.addr.0.0.06.case.5, %dst.addr.0.0.06.case.4, %dst.addr.0.0.06.case.3, %dst.addr.0.0.06.case.2, %dst.addr.0.0.06.case.1, %dst.addr.0.0.06.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.0.0.06.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a32struct.ap_int<16>"(i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.0" %dst_0, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.1" %dst_1, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.2" %dst_2, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.3" %dst_3, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.4" %dst_4, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.5" %dst_5, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.6" %dst_6, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.7" %dst_7, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.8" %dst_8, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.9" %dst_9, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.10" %dst_10, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.11" %dst_11, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.12" %dst_12, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.13" %dst_13, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.14" %dst_14, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.15" %dst_15, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.16" %dst_16, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.17" %dst_17, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.18" %dst_18, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.19" %dst_19, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.20" %dst_20, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.21" %dst_21, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.22" %dst_22, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.23" %dst_23, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.24" %dst_24, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.25" %dst_25, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.26" %dst_26, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.27" %dst_27, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.28" %dst_28, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.29" %dst_29, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.30" %dst_30, i16* noalias nocapture align 512 "orig.arg.no"="0" "unpacked"="0.0.31" %dst_31, [32 x %"struct.ap_int<16>"]* noalias readonly "orig.arg.no"="1" "unpacked"="1" %src) #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<16>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32struct.ap_int<16>"(i16* %dst_0, i16* %dst_1, i16* %dst_2, i16* %dst_3, i16* %dst_4, i16* %dst_5, i16* %dst_6, i16* %dst_7, i16* %dst_8, i16* %dst_9, i16* %dst_10, i16* %dst_11, i16* %dst_12, i16* %dst_13, i16* %dst_14, i16* %dst_15, i16* %dst_16, i16* %dst_17, i16* %dst_18, i16* %dst_19, i16* %dst_20, i16* %dst_21, i16* %dst_22, i16* %dst_23, i16* %dst_24, i16* %dst_25, i16* %dst_26, i16* %dst_27, i16* %dst_28, i16* %dst_29, i16* %dst_30, i16* %dst_31, [32 x %"struct.ap_int<16>"]* nonnull %src, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="0" "unpacked"="0", i32* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="2" "unpacked"="2", i32* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_V_data_V1, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_V_keep_V2, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "orig.arg.no"="3" "unpacked"="3.3" %_V_last_V4, [32 x %"struct.ap_int<16>"]* noalias readonly "orig.arg.no"="4" "unpacked"="4", i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.0" %_0, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.1" %_1, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.2" %_2, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.3" %_3, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.4" %_4, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.5" %_5, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.6" %_6, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.7" %_7, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.8" %_8, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.9" %_9, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.10" %_10, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.11" %_11, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.12" %_12, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.13" %_13, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.14" %_14, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.15" %_15, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.16" %_16, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.17" %_17, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.18" %_18, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.19" %_19, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.20" %_20, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.21" %_21, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.22" %_22, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.23" %_23, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.24" %_24, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.25" %_25, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.26" %_26, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.27" %_27, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.28" %_28, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.29" %_29, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.30" %_30, i16* noalias nocapture align 512 "orig.arg.no"="5" "unpacked"="5.0.31" %_31) #4 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.38"(i32* align 512 %_V_data_V, i4* align 512 %_V_keep_V, i4* align 512 %_V_strb_V, i1* align 512 %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.38"(i32* align 512 %_V_data_V1, i4* align 512 %_V_keep_V2, i4* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %1)
  call void @"onebyonecpy_hls.p0a32struct.ap_int<16>"(i16* align 512 %_0, i16* align 512 %_1, i16* align 512 %_2, i16* align 512 %_3, i16* align 512 %_4, i16* align 512 %_5, i16* align 512 %_6, i16* align 512 %_7, i16* align 512 %_8, i16* align 512 %_9, i16* align 512 %_10, i16* align 512 %_11, i16* align 512 %_12, i16* align 512 %_13, i16* align 512 %_14, i16* align 512 %_15, i16* align 512 %_16, i16* align 512 %_17, i16* align 512 %_18, i16* align 512 %_19, i16* align 512 %_20, i16* align 512 %_21, i16* align 512 %_22, i16* align 512 %_23, i16* align 512 %_24, i16* align 512 %_25, i16* align 512 %_26, i16* align 512 %_27, i16* align 512 %_28, i16* align 512 %_29, i16* align 512 %_30, i16* align 512 %_31, [32 x %"struct.ap_int<16>"]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define void @"arraycpy_hls.p0a32struct.ap_int<16>.8"([32 x %"struct.ap_int<16>"]* "orig.arg.no"="0" "unpacked"="0" %dst, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.4" %src_4, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.5" %src_5, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.6" %src_6, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.7" %src_7, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.8" %src_8, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.9" %src_9, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.10" %src_10, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.11" %src_11, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.12" %src_12, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.13" %src_13, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.14" %src_14, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.15" %src_15, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.16" %src_16, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.17" %src_17, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.18" %src_18, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.19" %src_19, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.20" %src_20, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.21" %src_21, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.22" %src_22, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.23" %src_23, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.24" %src_24, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.25" %src_25, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.26" %src_26, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.27" %src_27, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.28" %src_28, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.29" %src_29, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.30" %src_30, i16* nocapture readonly "orig.arg.no"="1" "unpacked"="1.0.31" %src_31, i64 "orig.arg.no"="2" "unpacked"="2" %num) #2 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.0.0.05.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.0.0.05.exit ]
  %dst.addr.0.0.06 = getelementptr [32 x %"struct.ap_int<16>"], [32 x %"struct.ap_int<16>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  switch i64 %for.loop.idx2, label %src.addr.0.0.05.case.31 [
    i64 0, label %src.addr.0.0.05.case.0
    i64 1, label %src.addr.0.0.05.case.1
    i64 2, label %src.addr.0.0.05.case.2
    i64 3, label %src.addr.0.0.05.case.3
    i64 4, label %src.addr.0.0.05.case.4
    i64 5, label %src.addr.0.0.05.case.5
    i64 6, label %src.addr.0.0.05.case.6
    i64 7, label %src.addr.0.0.05.case.7
    i64 8, label %src.addr.0.0.05.case.8
    i64 9, label %src.addr.0.0.05.case.9
    i64 10, label %src.addr.0.0.05.case.10
    i64 11, label %src.addr.0.0.05.case.11
    i64 12, label %src.addr.0.0.05.case.12
    i64 13, label %src.addr.0.0.05.case.13
    i64 14, label %src.addr.0.0.05.case.14
    i64 15, label %src.addr.0.0.05.case.15
    i64 16, label %src.addr.0.0.05.case.16
    i64 17, label %src.addr.0.0.05.case.17
    i64 18, label %src.addr.0.0.05.case.18
    i64 19, label %src.addr.0.0.05.case.19
    i64 20, label %src.addr.0.0.05.case.20
    i64 21, label %src.addr.0.0.05.case.21
    i64 22, label %src.addr.0.0.05.case.22
    i64 23, label %src.addr.0.0.05.case.23
    i64 24, label %src.addr.0.0.05.case.24
    i64 25, label %src.addr.0.0.05.case.25
    i64 26, label %src.addr.0.0.05.case.26
    i64 27, label %src.addr.0.0.05.case.27
    i64 28, label %src.addr.0.0.05.case.28
    i64 29, label %src.addr.0.0.05.case.29
    i64 30, label %src.addr.0.0.05.case.30
  ]

src.addr.0.0.05.case.0:                           ; preds = %for.loop
  %_0 = load i16, i16* %src_0, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.1:                           ; preds = %for.loop
  %_1 = load i16, i16* %src_1, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.2:                           ; preds = %for.loop
  %_2 = load i16, i16* %src_2, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.3:                           ; preds = %for.loop
  %_3 = load i16, i16* %src_3, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.4:                           ; preds = %for.loop
  %_4 = load i16, i16* %src_4, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.5:                           ; preds = %for.loop
  %_5 = load i16, i16* %src_5, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.6:                           ; preds = %for.loop
  %_6 = load i16, i16* %src_6, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.7:                           ; preds = %for.loop
  %_7 = load i16, i16* %src_7, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.8:                           ; preds = %for.loop
  %_8 = load i16, i16* %src_8, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.9:                           ; preds = %for.loop
  %_9 = load i16, i16* %src_9, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.10:                          ; preds = %for.loop
  %_10 = load i16, i16* %src_10, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.11:                          ; preds = %for.loop
  %_11 = load i16, i16* %src_11, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.12:                          ; preds = %for.loop
  %_12 = load i16, i16* %src_12, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.13:                          ; preds = %for.loop
  %_13 = load i16, i16* %src_13, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.14:                          ; preds = %for.loop
  %_14 = load i16, i16* %src_14, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.15:                          ; preds = %for.loop
  %_15 = load i16, i16* %src_15, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.16:                          ; preds = %for.loop
  %_16 = load i16, i16* %src_16, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.17:                          ; preds = %for.loop
  %_17 = load i16, i16* %src_17, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.18:                          ; preds = %for.loop
  %_18 = load i16, i16* %src_18, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.19:                          ; preds = %for.loop
  %_19 = load i16, i16* %src_19, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.20:                          ; preds = %for.loop
  %_20 = load i16, i16* %src_20, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.21:                          ; preds = %for.loop
  %_21 = load i16, i16* %src_21, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.22:                          ; preds = %for.loop
  %_22 = load i16, i16* %src_22, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.23:                          ; preds = %for.loop
  %_23 = load i16, i16* %src_23, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.24:                          ; preds = %for.loop
  %_24 = load i16, i16* %src_24, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.25:                          ; preds = %for.loop
  %_25 = load i16, i16* %src_25, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.26:                          ; preds = %for.loop
  %_26 = load i16, i16* %src_26, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.27:                          ; preds = %for.loop
  %_27 = load i16, i16* %src_27, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.28:                          ; preds = %for.loop
  %_28 = load i16, i16* %src_28, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.29:                          ; preds = %for.loop
  %_29 = load i16, i16* %src_29, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.30:                          ; preds = %for.loop
  %_30 = load i16, i16* %src_30, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.case.31:                          ; preds = %for.loop
  %1 = icmp eq i64 %for.loop.idx2, 31
  call void @llvm.assume(i1 %1)
  %_31 = load i16, i16* %src_31, align 2
  br label %src.addr.0.0.05.exit

src.addr.0.0.05.exit:                             ; preds = %src.addr.0.0.05.case.31, %src.addr.0.0.05.case.30, %src.addr.0.0.05.case.29, %src.addr.0.0.05.case.28, %src.addr.0.0.05.case.27, %src.addr.0.0.05.case.26, %src.addr.0.0.05.case.25, %src.addr.0.0.05.case.24, %src.addr.0.0.05.case.23, %src.addr.0.0.05.case.22, %src.addr.0.0.05.case.21, %src.addr.0.0.05.case.20, %src.addr.0.0.05.case.19, %src.addr.0.0.05.case.18, %src.addr.0.0.05.case.17, %src.addr.0.0.05.case.16, %src.addr.0.0.05.case.15, %src.addr.0.0.05.case.14, %src.addr.0.0.05.case.13, %src.addr.0.0.05.case.12, %src.addr.0.0.05.case.11, %src.addr.0.0.05.case.10, %src.addr.0.0.05.case.9, %src.addr.0.0.05.case.8, %src.addr.0.0.05.case.7, %src.addr.0.0.05.case.6, %src.addr.0.0.05.case.5, %src.addr.0.0.05.case.4, %src.addr.0.0.05.case.3, %src.addr.0.0.05.case.2, %src.addr.0.0.05.case.1, %src.addr.0.0.05.case.0
  %2 = phi i16 [ %_0, %src.addr.0.0.05.case.0 ], [ %_1, %src.addr.0.0.05.case.1 ], [ %_2, %src.addr.0.0.05.case.2 ], [ %_3, %src.addr.0.0.05.case.3 ], [ %_4, %src.addr.0.0.05.case.4 ], [ %_5, %src.addr.0.0.05.case.5 ], [ %_6, %src.addr.0.0.05.case.6 ], [ %_7, %src.addr.0.0.05.case.7 ], [ %_8, %src.addr.0.0.05.case.8 ], [ %_9, %src.addr.0.0.05.case.9 ], [ %_10, %src.addr.0.0.05.case.10 ], [ %_11, %src.addr.0.0.05.case.11 ], [ %_12, %src.addr.0.0.05.case.12 ], [ %_13, %src.addr.0.0.05.case.13 ], [ %_14, %src.addr.0.0.05.case.14 ], [ %_15, %src.addr.0.0.05.case.15 ], [ %_16, %src.addr.0.0.05.case.16 ], [ %_17, %src.addr.0.0.05.case.17 ], [ %_18, %src.addr.0.0.05.case.18 ], [ %_19, %src.addr.0.0.05.case.19 ], [ %_20, %src.addr.0.0.05.case.20 ], [ %_21, %src.addr.0.0.05.case.21 ], [ %_22, %src.addr.0.0.05.case.22 ], [ %_23, %src.addr.0.0.05.case.23 ], [ %_24, %src.addr.0.0.05.case.24 ], [ %_25, %src.addr.0.0.05.case.25 ], [ %_26, %src.addr.0.0.05.case.26 ], [ %_27, %src.addr.0.0.05.case.27 ], [ %_28, %src.addr.0.0.05.case.28 ], [ %_29, %src.addr.0.0.05.case.29 ], [ %_30, %src.addr.0.0.05.case.30 ], [ %_31, %src.addr.0.0.05.case.31 ]
  store i16 %2, i16* %dst.addr.0.0.06, align 2
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.0.0.05.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal void @"onebyonecpy_hls.p0a32struct.ap_int<16>.5"([32 x %"struct.ap_int<16>"]* noalias "orig.arg.no"="0" "unpacked"="0" %dst, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.0" %src_0, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.1" %src_1, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.2" %src_2, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.3" %src_3, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.4" %src_4, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.5" %src_5, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.6" %src_6, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.7" %src_7, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.8" %src_8, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.9" %src_9, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.10" %src_10, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.11" %src_11, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.12" %src_12, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.13" %src_13, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.14" %src_14, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.15" %src_15, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.16" %src_16, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.17" %src_17, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.18" %src_18, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.19" %src_19, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.20" %src_20, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.21" %src_21, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.22" %src_22, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.23" %src_23, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.24" %src_24, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.25" %src_25, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.26" %src_26, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.27" %src_27, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.28" %src_28, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.29" %src_29, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.30" %src_30, i16* noalias nocapture readonly align 512 "orig.arg.no"="1" "unpacked"="1.0.31" %src_31) #3 {
entry:
  %0 = icmp eq [32 x %"struct.ap_int<16>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a32struct.ap_int<16>.8"([32 x %"struct.ap_int<16>"]* nonnull %dst, i16* %src_0, i16* %src_1, i16* %src_2, i16* %src_3, i16* %src_4, i16* %src_5, i16* %src_6, i16* %src_7, i16* %src_8, i16* %src_9, i16* %src_10, i16* %src_11, i16* %src_12, i16* %src_13, i16* %src_14, i16* %src_15, i16* %src_16, i16* %src_17, i16* %src_18, i16* %src_19, i16* %src_20, i16* %src_21, i16* %src_22, i16* %src_23, i16* %src_24, i16* %src_25, i16* %src_26, i16* %src_27, i16* %src_28, i16* %src_29, i16* %src_30, i16* %src_31, i64 32)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="0" "unpacked"="0", i32* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="2" "unpacked"="2", i32* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_V_data_V1, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_V_keep_V2, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "orig.arg.no"="3" "unpacked"="3.3" %_V_last_V4, [32 x %"struct.ap_int<16>"]* noalias "orig.arg.no"="4" "unpacked"="4", i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.0" %_0, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.1" %_1, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.2" %_2, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.3" %_3, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.4" %_4, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.5" %_5, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.6" %_6, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.7" %_7, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.8" %_8, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.9" %_9, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.10" %_10, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.11" %_11, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.12" %_12, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.13" %_13, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.14" %_14, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.15" %_15, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.16" %_16, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.17" %_17, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.18" %_18, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.19" %_19, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.20" %_20, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.21" %_21, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.22" %_22, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.23" %_23, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.24" %_24, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.25" %_25, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.26" %_26, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.27" %_27, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.28" %_28, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.29" %_29, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.30" %_30, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.31" %_31) #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0, i32* align 512 %_V_data_V, i4* align 512 %_V_keep_V, i4* align 512 %_V_strb_V, i1* align 512 %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %1, i32* align 512 %_V_data_V1, i4* align 512 %_V_keep_V2, i4* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4)
  call void @"onebyonecpy_hls.p0a32struct.ap_int<16>.5"([32 x %"struct.ap_int<16>"]* %2, i16* align 512 %_0, i16* align 512 %_1, i16* align 512 %_2, i16* align 512 %_3, i16* align 512 %_4, i16* align 512 %_5, i16* align 512 %_6, i16* align 512 %_7, i16* align 512 %_8, i16* align 512 %_9, i16* align 512 %_10, i16* align 512 %_11, i16* align 512 %_12, i16* align 512 %_13, i16* align 512 %_14, i16* align 512 %_15, i16* align 512 %_16, i16* align 512 %_17, i16* align 512 %_18, i16* align 512 %_19, i16* align 512 %_20, i16* align 512 %_21, i16* align 512 %_22, i16* align 512 %_23, i16* align 512 %_24, i16* align 512 %_25, i16* align 512 %_26, i16* align 512 %_27, i16* align 512 %_28, i16* align 512 %_29, i16* align 512 %_30, i16* align 512 %_31)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias %dst, i32* noalias align 512 "unpacked"="1.0" %src_V_data_V, i4* noalias align 512 "unpacked"="1.1" %src_V_keep_V, i4* noalias align 512 "unpacked"="1.2" %src_V_strb_V, i1* noalias align 512 "unpacked"="1.3" %src_V_last_V) unnamed_addr #6 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.33"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* nonnull %dst, i32* align 512 %src_V_data_V, i4* align 512 %src_V_keep_V, i4* align 512 %src_V_strb_V, i1* align 512 %src_V_last_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.33"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nocapture, i32* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V, i4* noalias nocapture align 512 "unpacked"="1.1" %_V_keep_V, i4* noalias nocapture align 512 "unpacked"="1.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="1.3" %_V_last_V) unnamed_addr #7 {
entry:
  %1 = alloca i32
  %2 = alloca i4
  %3 = alloca i4
  %4 = alloca i1
  %5 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast i32* %_V_data_V to i8*
  %7 = call i1 @fpga_fifo_not_empty_4(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast i32* %1 to i8*
  %9 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_pop_4(i8* %8, i8* %9)
  %10 = load volatile i32, i32* %1
  %11 = bitcast i4* %3 to i8*
  %12 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_pop_1(i8* %11, i8* %12)
  %13 = bitcast i4* %3 to i8*
  %14 = load i8, i8* %13
  %15 = trunc i8 %14 to i4
  %16 = bitcast i4* %2 to i8*
  %17 = bitcast i4* %_V_strb_V to i8*
  call void @fpga_fifo_pop_1(i8* %16, i8* %17)
  %18 = bitcast i4* %2 to i8*
  %19 = load i8, i8* %18
  %20 = trunc i8 %19 to i4
  %21 = bitcast i1* %4 to i8*
  %22 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_pop_1(i8* %21, i8* %22)
  %23 = bitcast i1* %4 to i8*
  %24 = load i8, i8* %23
  %25 = trunc i8 %24 to i1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" undef, i32 %10, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %.fca.0.0.0.0.0.insert, i4 %15, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %.fca.0.1.0.0.0.insert, i4 %20, 0, 2, 0, 0, 0
  %.fca.0.4.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %.fca.0.2.0.0.0.insert, i1 %25, 0, 4, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %.fca.0.4.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %5
  %26 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %5 to i8*
  %27 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_12(i8* %26, i8* %27)
  br label %empty, !llvm.loop !43

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.38"(i32* noalias align 512 "unpacked"="0.0" %dst_V_data_V, i4* noalias align 512 "unpacked"="0.1" %dst_V_keep_V, i4* noalias align 512 "unpacked"="0.2" %dst_V_strb_V, i1* noalias align 512 "unpacked"="0.3" %dst_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias %src) unnamed_addr #6 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.41"(i32* align 512 %dst_V_data_V, i4* align 512 %dst_V_keep_V, i4* align 512 %dst_V_strb_V, i1* align 512 %dst_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>.41"(i32* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, i4* noalias nocapture align 512 "unpacked"="0.1" %_V_keep_V, i4* noalias nocapture align 512 "unpacked"="0.2" %_V_strb_V, i1* noalias nocapture align 512 "unpacked"="0.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nocapture) unnamed_addr #7 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"
  %2 = alloca i32
  %3 = alloca i4
  %4 = alloca i4
  %5 = alloca i1
  br label %empty

empty:                                            ; preds = %push, %entry
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  %7 = call i1 @fpga_fifo_not_empty_12(i8* %6)
  br i1 %7, label %push, label %ret

push:                                             ; preds = %empty
  %8 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %1 to i8*
  %9 = bitcast %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_12(i8* %8, i8* %9)
  %10 = load volatile %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %10, 0, 0, 0, 0, 0
  %.fca.0.1.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %10, 0, 1, 0, 0, 0
  %.fca.0.2.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %10, 0, 2, 0, 0, 0
  %.fca.0.4.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>" %10, 0, 4, 0, 0, 0
  store i32 %.fca.0.0.0.0.0.extract, i32* %2
  %11 = bitcast i32* %2 to i8*
  %12 = bitcast i32* %_V_data_V to i8*
  call void @fpga_fifo_push_4(i8* %11, i8* %12)
  store i4 %.fca.0.1.0.0.0.extract, i4* %4
  %13 = bitcast i4* %4 to i8*
  %14 = bitcast i4* %_V_keep_V to i8*
  call void @fpga_fifo_push_1(i8* %13, i8* %14)
  store i4 %.fca.0.2.0.0.0.extract, i4* %3
  %15 = bitcast i4* %3 to i8*
  %16 = bitcast i4* %_V_strb_V to i8*
  call void @fpga_fifo_push_1(i8* %15, i8* %16)
  store i1 %.fca.0.4.0.0.0.extract, i1* %5
  %17 = bitcast i1* %5 to i8*
  %18 = bitcast i1* %_V_last_V to i8*
  call void @fpga_fifo_push_1(i8* %17, i8* %18)
  br label %empty, !llvm.loop !43

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_fir_filter_hw(i32*, i4*, i4*, i1*, i32*, i4*, i4*, i1*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i32, i32)

; Function Attrs: argmemonly noinline willreturn
define internal void @copy_back(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="0" "unpacked"="0", i32* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_V_data_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_V_keep_V, i4* noalias align 512 "orig.arg.no"="1" "unpacked"="1.2" %_V_strb_V, i1* noalias align 512 "orig.arg.no"="1" "unpacked"="1.3" %_V_last_V, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias "orig.arg.no"="2" "unpacked"="2", i32* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_V_data_V1, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_V_keep_V2, i4* noalias align 512 "orig.arg.no"="3" "unpacked"="3.2" %_V_strb_V3, i1* noalias align 512 "orig.arg.no"="3" "unpacked"="3.3" %_V_last_V4, [32 x %"struct.ap_int<16>"]* noalias "orig.arg.no"="4" "unpacked"="4", i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.0" %_0, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.1" %_1, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.2" %_2, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.3" %_3, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.4" %_4, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.5" %_5, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.6" %_6, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.7" %_7, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.8" %_8, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.9" %_9, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.10" %_10, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.11" %_11, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.12" %_12, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.13" %_13, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.14" %_14, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.15" %_15, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.16" %_16, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.17" %_17, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.18" %_18, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.19" %_19, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.20" %_20, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.21" %_21, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.22" %_22, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.23" %_23, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.24" %_24, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.25" %_25, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.26" %_26, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.27" %_27, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.28" %_28, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.29" %_29, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.30" %_30, i16* noalias nocapture readonly align 512 "orig.arg.no"="5" "unpacked"="5.0.31" %_31) #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %0, i32* align 512 %_V_data_V, i4* align 512 %_V_keep_V, i4* align 512 %_V_strb_V, i1* align 512 %_V_last_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %1, i32* align 512 %_V_data_V1, i4* align 512 %_V_keep_V2, i4* align 512 %_V_strb_V3, i1* align 512 %_V_last_V4)
  ret void
}

define void @fir_filter_hw_stub_wrapper(i32*, i4*, i4*, i1*, i32*, i4*, i4*, i1*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i32, i32) #8 {
entry:
  %42 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"
  %43 = alloca %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"
  %44 = alloca [32 x %"struct.ap_int<16>"]
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %42, i32* %0, i4* %1, i4* %2, i1* %3, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %43, i32* %4, i4* %5, i4* %6, i1* %7, [32 x %"struct.ap_int<16>"]* %44, i16* %8, i16* %9, i16* %10, i16* %11, i16* %12, i16* %13, i16* %14, i16* %15, i16* %16, i16* %17, i16* %18, i16* %19, i16* %20, i16* %21, i16* %22, i16* %23, i16* %24, i16* %25, i16* %26, i16* %27, i16* %28, i16* %29, i16* %30, i16* %31, i16* %32, i16* %33, i16* %34, i16* %35, i16* %36, i16* %37, i16* %38, i16* %39)
  %45 = bitcast [32 x %"struct.ap_int<16>"]* %44 to %"struct.ap_int<16>"*
  call void @fir_filter_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %42, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %43, %"struct.ap_int<16>"* %45, i32 %40, i32 %41)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %42, i32* %0, i4* %1, i4* %2, i1* %3, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* %43, i32* %4, i4* %5, i4* %6, i1* %7, [32 x %"struct.ap_int<16>"]* %44, i16* %8, i16* %9, i16* %10, i16* %11, i16* %12, i16* %13, i16* %14, i16* %15, i16* %16, i16* %17, i16* %18, i16* %19, i16* %20, i16* %21, i16* %22, i16* %23, i16* %24, i16* %25, i16* %26, i16* %27, i16* %28, i16* %29, i16* %30, i16* %31, i16* %32, i16* %33, i16* %34, i16* %35, i16* %36, i16* %37, i16* %38, i16* %39)
  ret void
}

declare void @fir_filter_hw_stub(%"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nonnull, %"class.hls::stream<hls::axis<ap_uint<32>, 0, 0, 0, '8', false>, 0>"* noalias nonnull, %"struct.ap_int<16>"* noalias nocapture nonnull readonly, i32, i32)

declare i1 @fpga_fifo_not_empty_12(i8*)

declare i1 @fpga_fifo_not_empty_4(i8*)

declare void @fpga_fifo_pop_12(i8*, i8*)

declare void @fpga_fifo_pop_4(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_push_12(i8*, i8*)

declare void @fpga_fifo_push_4(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

attributes #0 = { noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { nounwind willreturn }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #6 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #7 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #8 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"2.0", [32 x i16]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Complete", !"dim=1"}
!10 = !{!11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!11 = !{!"2.0.0", i16* null}
!12 = !{!"2.0.1", i16* null}
!13 = !{!"2.0.2", i16* null}
!14 = !{!"2.0.3", i16* null}
!15 = !{!"2.0.4", i16* null}
!16 = !{!"2.0.5", i16* null}
!17 = !{!"2.0.6", i16* null}
!18 = !{!"2.0.7", i16* null}
!19 = !{!"2.0.8", i16* null}
!20 = !{!"2.0.9", i16* null}
!21 = !{!"2.0.10", i16* null}
!22 = !{!"2.0.11", i16* null}
!23 = !{!"2.0.12", i16* null}
!24 = !{!"2.0.13", i16* null}
!25 = !{!"2.0.14", i16* null}
!26 = !{!"2.0.15", i16* null}
!27 = !{!"2.0.16", i16* null}
!28 = !{!"2.0.17", i16* null}
!29 = !{!"2.0.18", i16* null}
!30 = !{!"2.0.19", i16* null}
!31 = !{!"2.0.20", i16* null}
!32 = !{!"2.0.21", i16* null}
!33 = !{!"2.0.22", i16* null}
!34 = !{!"2.0.23", i16* null}
!35 = !{!"2.0.24", i16* null}
!36 = !{!"2.0.25", i16* null}
!37 = !{!"2.0.26", i16* null}
!38 = !{!"2.0.27", i16* null}
!39 = !{!"2.0.28", i16* null}
!40 = !{!"2.0.29", i16* null}
!41 = !{!"2.0.30", i16* null}
!42 = !{!"2.0.31", i16* null}
!43 = distinct !{!43, !44}
!44 = !{!"llvm.loop.rotate.disable"}
