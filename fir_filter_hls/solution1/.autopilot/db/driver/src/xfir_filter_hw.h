// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// CTRL
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of coeffs_0
//         bit 15~0 - coeffs_0[15:0] (Read/Write)
//         others   - reserved
// 0x014 : reserved
// 0x018 : Data signal of coeffs_1
//         bit 15~0 - coeffs_1[15:0] (Read/Write)
//         others   - reserved
// 0x01c : reserved
// 0x020 : Data signal of coeffs_2
//         bit 15~0 - coeffs_2[15:0] (Read/Write)
//         others   - reserved
// 0x024 : reserved
// 0x028 : Data signal of coeffs_3
//         bit 15~0 - coeffs_3[15:0] (Read/Write)
//         others   - reserved
// 0x02c : reserved
// 0x030 : Data signal of coeffs_4
//         bit 15~0 - coeffs_4[15:0] (Read/Write)
//         others   - reserved
// 0x034 : reserved
// 0x038 : Data signal of coeffs_5
//         bit 15~0 - coeffs_5[15:0] (Read/Write)
//         others   - reserved
// 0x03c : reserved
// 0x040 : Data signal of coeffs_6
//         bit 15~0 - coeffs_6[15:0] (Read/Write)
//         others   - reserved
// 0x044 : reserved
// 0x048 : Data signal of coeffs_7
//         bit 15~0 - coeffs_7[15:0] (Read/Write)
//         others   - reserved
// 0x04c : reserved
// 0x050 : Data signal of coeffs_8
//         bit 15~0 - coeffs_8[15:0] (Read/Write)
//         others   - reserved
// 0x054 : reserved
// 0x058 : Data signal of coeffs_9
//         bit 15~0 - coeffs_9[15:0] (Read/Write)
//         others   - reserved
// 0x05c : reserved
// 0x060 : Data signal of coeffs_10
//         bit 15~0 - coeffs_10[15:0] (Read/Write)
//         others   - reserved
// 0x064 : reserved
// 0x068 : Data signal of coeffs_11
//         bit 15~0 - coeffs_11[15:0] (Read/Write)
//         others   - reserved
// 0x06c : reserved
// 0x070 : Data signal of coeffs_12
//         bit 15~0 - coeffs_12[15:0] (Read/Write)
//         others   - reserved
// 0x074 : reserved
// 0x078 : Data signal of coeffs_13
//         bit 15~0 - coeffs_13[15:0] (Read/Write)
//         others   - reserved
// 0x07c : reserved
// 0x080 : Data signal of coeffs_14
//         bit 15~0 - coeffs_14[15:0] (Read/Write)
//         others   - reserved
// 0x084 : reserved
// 0x088 : Data signal of coeffs_15
//         bit 15~0 - coeffs_15[15:0] (Read/Write)
//         others   - reserved
// 0x08c : reserved
// 0x090 : Data signal of coeffs_16
//         bit 15~0 - coeffs_16[15:0] (Read/Write)
//         others   - reserved
// 0x094 : reserved
// 0x098 : Data signal of coeffs_17
//         bit 15~0 - coeffs_17[15:0] (Read/Write)
//         others   - reserved
// 0x09c : reserved
// 0x0a0 : Data signal of coeffs_18
//         bit 15~0 - coeffs_18[15:0] (Read/Write)
//         others   - reserved
// 0x0a4 : reserved
// 0x0a8 : Data signal of coeffs_19
//         bit 15~0 - coeffs_19[15:0] (Read/Write)
//         others   - reserved
// 0x0ac : reserved
// 0x0b0 : Data signal of coeffs_20
//         bit 15~0 - coeffs_20[15:0] (Read/Write)
//         others   - reserved
// 0x0b4 : reserved
// 0x0b8 : Data signal of coeffs_21
//         bit 15~0 - coeffs_21[15:0] (Read/Write)
//         others   - reserved
// 0x0bc : reserved
// 0x0c0 : Data signal of coeffs_22
//         bit 15~0 - coeffs_22[15:0] (Read/Write)
//         others   - reserved
// 0x0c4 : reserved
// 0x0c8 : Data signal of coeffs_23
//         bit 15~0 - coeffs_23[15:0] (Read/Write)
//         others   - reserved
// 0x0cc : reserved
// 0x0d0 : Data signal of coeffs_24
//         bit 15~0 - coeffs_24[15:0] (Read/Write)
//         others   - reserved
// 0x0d4 : reserved
// 0x0d8 : Data signal of coeffs_25
//         bit 15~0 - coeffs_25[15:0] (Read/Write)
//         others   - reserved
// 0x0dc : reserved
// 0x0e0 : Data signal of coeffs_26
//         bit 15~0 - coeffs_26[15:0] (Read/Write)
//         others   - reserved
// 0x0e4 : reserved
// 0x0e8 : Data signal of coeffs_27
//         bit 15~0 - coeffs_27[15:0] (Read/Write)
//         others   - reserved
// 0x0ec : reserved
// 0x0f0 : Data signal of coeffs_28
//         bit 15~0 - coeffs_28[15:0] (Read/Write)
//         others   - reserved
// 0x0f4 : reserved
// 0x0f8 : Data signal of coeffs_29
//         bit 15~0 - coeffs_29[15:0] (Read/Write)
//         others   - reserved
// 0x0fc : reserved
// 0x100 : Data signal of coeffs_30
//         bit 15~0 - coeffs_30[15:0] (Read/Write)
//         others   - reserved
// 0x104 : reserved
// 0x108 : Data signal of coeffs_31
//         bit 15~0 - coeffs_31[15:0] (Read/Write)
//         others   - reserved
// 0x10c : reserved
// 0x110 : Data signal of num_taps
//         bit 31~0 - num_taps[31:0] (Read/Write)
// 0x114 : reserved
// 0x118 : Data signal of num_samples
//         bit 31~0 - num_samples[31:0] (Read/Write)
// 0x11c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XFIR_FILTER_CTRL_ADDR_AP_CTRL          0x000
#define XFIR_FILTER_CTRL_ADDR_GIE              0x004
#define XFIR_FILTER_CTRL_ADDR_IER              0x008
#define XFIR_FILTER_CTRL_ADDR_ISR              0x00c
#define XFIR_FILTER_CTRL_ADDR_COEFFS_0_DATA    0x010
#define XFIR_FILTER_CTRL_BITS_COEFFS_0_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_1_DATA    0x018
#define XFIR_FILTER_CTRL_BITS_COEFFS_1_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_2_DATA    0x020
#define XFIR_FILTER_CTRL_BITS_COEFFS_2_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_3_DATA    0x028
#define XFIR_FILTER_CTRL_BITS_COEFFS_3_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_4_DATA    0x030
#define XFIR_FILTER_CTRL_BITS_COEFFS_4_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_5_DATA    0x038
#define XFIR_FILTER_CTRL_BITS_COEFFS_5_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_6_DATA    0x040
#define XFIR_FILTER_CTRL_BITS_COEFFS_6_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_7_DATA    0x048
#define XFIR_FILTER_CTRL_BITS_COEFFS_7_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_8_DATA    0x050
#define XFIR_FILTER_CTRL_BITS_COEFFS_8_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_9_DATA    0x058
#define XFIR_FILTER_CTRL_BITS_COEFFS_9_DATA    16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_10_DATA   0x060
#define XFIR_FILTER_CTRL_BITS_COEFFS_10_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_11_DATA   0x068
#define XFIR_FILTER_CTRL_BITS_COEFFS_11_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_12_DATA   0x070
#define XFIR_FILTER_CTRL_BITS_COEFFS_12_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_13_DATA   0x078
#define XFIR_FILTER_CTRL_BITS_COEFFS_13_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_14_DATA   0x080
#define XFIR_FILTER_CTRL_BITS_COEFFS_14_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_15_DATA   0x088
#define XFIR_FILTER_CTRL_BITS_COEFFS_15_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_16_DATA   0x090
#define XFIR_FILTER_CTRL_BITS_COEFFS_16_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_17_DATA   0x098
#define XFIR_FILTER_CTRL_BITS_COEFFS_17_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_18_DATA   0x0a0
#define XFIR_FILTER_CTRL_BITS_COEFFS_18_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_19_DATA   0x0a8
#define XFIR_FILTER_CTRL_BITS_COEFFS_19_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_20_DATA   0x0b0
#define XFIR_FILTER_CTRL_BITS_COEFFS_20_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_21_DATA   0x0b8
#define XFIR_FILTER_CTRL_BITS_COEFFS_21_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_22_DATA   0x0c0
#define XFIR_FILTER_CTRL_BITS_COEFFS_22_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_23_DATA   0x0c8
#define XFIR_FILTER_CTRL_BITS_COEFFS_23_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_24_DATA   0x0d0
#define XFIR_FILTER_CTRL_BITS_COEFFS_24_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_25_DATA   0x0d8
#define XFIR_FILTER_CTRL_BITS_COEFFS_25_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_26_DATA   0x0e0
#define XFIR_FILTER_CTRL_BITS_COEFFS_26_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_27_DATA   0x0e8
#define XFIR_FILTER_CTRL_BITS_COEFFS_27_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_28_DATA   0x0f0
#define XFIR_FILTER_CTRL_BITS_COEFFS_28_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_29_DATA   0x0f8
#define XFIR_FILTER_CTRL_BITS_COEFFS_29_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_30_DATA   0x100
#define XFIR_FILTER_CTRL_BITS_COEFFS_30_DATA   16
#define XFIR_FILTER_CTRL_ADDR_COEFFS_31_DATA   0x108
#define XFIR_FILTER_CTRL_BITS_COEFFS_31_DATA   16
#define XFIR_FILTER_CTRL_ADDR_NUM_TAPS_DATA    0x110
#define XFIR_FILTER_CTRL_BITS_NUM_TAPS_DATA    32
#define XFIR_FILTER_CTRL_ADDR_NUM_SAMPLES_DATA 0x118
#define XFIR_FILTER_CTRL_BITS_NUM_SAMPLES_DATA 32

