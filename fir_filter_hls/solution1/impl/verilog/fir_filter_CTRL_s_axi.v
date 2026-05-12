// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module fir_filter_CTRL_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [15:0]                   coeffs_0,
    output wire [15:0]                   coeffs_1,
    output wire [15:0]                   coeffs_2,
    output wire [15:0]                   coeffs_3,
    output wire [15:0]                   coeffs_4,
    output wire [15:0]                   coeffs_5,
    output wire [15:0]                   coeffs_6,
    output wire [15:0]                   coeffs_7,
    output wire [15:0]                   coeffs_8,
    output wire [15:0]                   coeffs_9,
    output wire [15:0]                   coeffs_10,
    output wire [15:0]                   coeffs_11,
    output wire [15:0]                   coeffs_12,
    output wire [15:0]                   coeffs_13,
    output wire [15:0]                   coeffs_14,
    output wire [15:0]                   coeffs_15,
    output wire [15:0]                   coeffs_16,
    output wire [15:0]                   coeffs_17,
    output wire [15:0]                   coeffs_18,
    output wire [15:0]                   coeffs_19,
    output wire [15:0]                   coeffs_20,
    output wire [15:0]                   coeffs_21,
    output wire [15:0]                   coeffs_22,
    output wire [15:0]                   coeffs_23,
    output wire [15:0]                   coeffs_24,
    output wire [15:0]                   coeffs_25,
    output wire [15:0]                   coeffs_26,
    output wire [15:0]                   coeffs_27,
    output wire [15:0]                   coeffs_28,
    output wire [15:0]                   coeffs_29,
    output wire [15:0]                   coeffs_30,
    output wire [15:0]                   coeffs_31,
    output wire [31:0]                   num_taps,
    output wire [31:0]                   num_samples,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
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

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL            = 9'h000,
    ADDR_GIE                = 9'h004,
    ADDR_IER                = 9'h008,
    ADDR_ISR                = 9'h00c,
    ADDR_COEFFS_0_DATA_0    = 9'h010,
    ADDR_COEFFS_0_CTRL      = 9'h014,
    ADDR_COEFFS_1_DATA_0    = 9'h018,
    ADDR_COEFFS_1_CTRL      = 9'h01c,
    ADDR_COEFFS_2_DATA_0    = 9'h020,
    ADDR_COEFFS_2_CTRL      = 9'h024,
    ADDR_COEFFS_3_DATA_0    = 9'h028,
    ADDR_COEFFS_3_CTRL      = 9'h02c,
    ADDR_COEFFS_4_DATA_0    = 9'h030,
    ADDR_COEFFS_4_CTRL      = 9'h034,
    ADDR_COEFFS_5_DATA_0    = 9'h038,
    ADDR_COEFFS_5_CTRL      = 9'h03c,
    ADDR_COEFFS_6_DATA_0    = 9'h040,
    ADDR_COEFFS_6_CTRL      = 9'h044,
    ADDR_COEFFS_7_DATA_0    = 9'h048,
    ADDR_COEFFS_7_CTRL      = 9'h04c,
    ADDR_COEFFS_8_DATA_0    = 9'h050,
    ADDR_COEFFS_8_CTRL      = 9'h054,
    ADDR_COEFFS_9_DATA_0    = 9'h058,
    ADDR_COEFFS_9_CTRL      = 9'h05c,
    ADDR_COEFFS_10_DATA_0   = 9'h060,
    ADDR_COEFFS_10_CTRL     = 9'h064,
    ADDR_COEFFS_11_DATA_0   = 9'h068,
    ADDR_COEFFS_11_CTRL     = 9'h06c,
    ADDR_COEFFS_12_DATA_0   = 9'h070,
    ADDR_COEFFS_12_CTRL     = 9'h074,
    ADDR_COEFFS_13_DATA_0   = 9'h078,
    ADDR_COEFFS_13_CTRL     = 9'h07c,
    ADDR_COEFFS_14_DATA_0   = 9'h080,
    ADDR_COEFFS_14_CTRL     = 9'h084,
    ADDR_COEFFS_15_DATA_0   = 9'h088,
    ADDR_COEFFS_15_CTRL     = 9'h08c,
    ADDR_COEFFS_16_DATA_0   = 9'h090,
    ADDR_COEFFS_16_CTRL     = 9'h094,
    ADDR_COEFFS_17_DATA_0   = 9'h098,
    ADDR_COEFFS_17_CTRL     = 9'h09c,
    ADDR_COEFFS_18_DATA_0   = 9'h0a0,
    ADDR_COEFFS_18_CTRL     = 9'h0a4,
    ADDR_COEFFS_19_DATA_0   = 9'h0a8,
    ADDR_COEFFS_19_CTRL     = 9'h0ac,
    ADDR_COEFFS_20_DATA_0   = 9'h0b0,
    ADDR_COEFFS_20_CTRL     = 9'h0b4,
    ADDR_COEFFS_21_DATA_0   = 9'h0b8,
    ADDR_COEFFS_21_CTRL     = 9'h0bc,
    ADDR_COEFFS_22_DATA_0   = 9'h0c0,
    ADDR_COEFFS_22_CTRL     = 9'h0c4,
    ADDR_COEFFS_23_DATA_0   = 9'h0c8,
    ADDR_COEFFS_23_CTRL     = 9'h0cc,
    ADDR_COEFFS_24_DATA_0   = 9'h0d0,
    ADDR_COEFFS_24_CTRL     = 9'h0d4,
    ADDR_COEFFS_25_DATA_0   = 9'h0d8,
    ADDR_COEFFS_25_CTRL     = 9'h0dc,
    ADDR_COEFFS_26_DATA_0   = 9'h0e0,
    ADDR_COEFFS_26_CTRL     = 9'h0e4,
    ADDR_COEFFS_27_DATA_0   = 9'h0e8,
    ADDR_COEFFS_27_CTRL     = 9'h0ec,
    ADDR_COEFFS_28_DATA_0   = 9'h0f0,
    ADDR_COEFFS_28_CTRL     = 9'h0f4,
    ADDR_COEFFS_29_DATA_0   = 9'h0f8,
    ADDR_COEFFS_29_CTRL     = 9'h0fc,
    ADDR_COEFFS_30_DATA_0   = 9'h100,
    ADDR_COEFFS_30_CTRL     = 9'h104,
    ADDR_COEFFS_31_DATA_0   = 9'h108,
    ADDR_COEFFS_31_CTRL     = 9'h10c,
    ADDR_NUM_TAPS_DATA_0    = 9'h110,
    ADDR_NUM_TAPS_CTRL      = 9'h114,
    ADDR_NUM_SAMPLES_DATA_0 = 9'h118,
    ADDR_NUM_SAMPLES_CTRL   = 9'h11c,
    WRIDLE                  = 2'd0,
    WRDATA                  = 2'd1,
    WRRESP                  = 2'd2,
    WRRESET                 = 2'd3,
    RDIDLE                  = 2'd0,
    RDDATA                  = 2'd1,
    RDRESET                 = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [15:0]                   int_coeffs_0 = 'b0;
    reg  [15:0]                   int_coeffs_1 = 'b0;
    reg  [15:0]                   int_coeffs_2 = 'b0;
    reg  [15:0]                   int_coeffs_3 = 'b0;
    reg  [15:0]                   int_coeffs_4 = 'b0;
    reg  [15:0]                   int_coeffs_5 = 'b0;
    reg  [15:0]                   int_coeffs_6 = 'b0;
    reg  [15:0]                   int_coeffs_7 = 'b0;
    reg  [15:0]                   int_coeffs_8 = 'b0;
    reg  [15:0]                   int_coeffs_9 = 'b0;
    reg  [15:0]                   int_coeffs_10 = 'b0;
    reg  [15:0]                   int_coeffs_11 = 'b0;
    reg  [15:0]                   int_coeffs_12 = 'b0;
    reg  [15:0]                   int_coeffs_13 = 'b0;
    reg  [15:0]                   int_coeffs_14 = 'b0;
    reg  [15:0]                   int_coeffs_15 = 'b0;
    reg  [15:0]                   int_coeffs_16 = 'b0;
    reg  [15:0]                   int_coeffs_17 = 'b0;
    reg  [15:0]                   int_coeffs_18 = 'b0;
    reg  [15:0]                   int_coeffs_19 = 'b0;
    reg  [15:0]                   int_coeffs_20 = 'b0;
    reg  [15:0]                   int_coeffs_21 = 'b0;
    reg  [15:0]                   int_coeffs_22 = 'b0;
    reg  [15:0]                   int_coeffs_23 = 'b0;
    reg  [15:0]                   int_coeffs_24 = 'b0;
    reg  [15:0]                   int_coeffs_25 = 'b0;
    reg  [15:0]                   int_coeffs_26 = 'b0;
    reg  [15:0]                   int_coeffs_27 = 'b0;
    reg  [15:0]                   int_coeffs_28 = 'b0;
    reg  [15:0]                   int_coeffs_29 = 'b0;
    reg  [15:0]                   int_coeffs_30 = 'b0;
    reg  [15:0]                   int_coeffs_31 = 'b0;
    reg  [31:0]                   int_num_taps = 'b0;
    reg  [31:0]                   int_num_samples = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_COEFFS_0_DATA_0: begin
                    rdata <= int_coeffs_0[15:0];
                end
                ADDR_COEFFS_1_DATA_0: begin
                    rdata <= int_coeffs_1[15:0];
                end
                ADDR_COEFFS_2_DATA_0: begin
                    rdata <= int_coeffs_2[15:0];
                end
                ADDR_COEFFS_3_DATA_0: begin
                    rdata <= int_coeffs_3[15:0];
                end
                ADDR_COEFFS_4_DATA_0: begin
                    rdata <= int_coeffs_4[15:0];
                end
                ADDR_COEFFS_5_DATA_0: begin
                    rdata <= int_coeffs_5[15:0];
                end
                ADDR_COEFFS_6_DATA_0: begin
                    rdata <= int_coeffs_6[15:0];
                end
                ADDR_COEFFS_7_DATA_0: begin
                    rdata <= int_coeffs_7[15:0];
                end
                ADDR_COEFFS_8_DATA_0: begin
                    rdata <= int_coeffs_8[15:0];
                end
                ADDR_COEFFS_9_DATA_0: begin
                    rdata <= int_coeffs_9[15:0];
                end
                ADDR_COEFFS_10_DATA_0: begin
                    rdata <= int_coeffs_10[15:0];
                end
                ADDR_COEFFS_11_DATA_0: begin
                    rdata <= int_coeffs_11[15:0];
                end
                ADDR_COEFFS_12_DATA_0: begin
                    rdata <= int_coeffs_12[15:0];
                end
                ADDR_COEFFS_13_DATA_0: begin
                    rdata <= int_coeffs_13[15:0];
                end
                ADDR_COEFFS_14_DATA_0: begin
                    rdata <= int_coeffs_14[15:0];
                end
                ADDR_COEFFS_15_DATA_0: begin
                    rdata <= int_coeffs_15[15:0];
                end
                ADDR_COEFFS_16_DATA_0: begin
                    rdata <= int_coeffs_16[15:0];
                end
                ADDR_COEFFS_17_DATA_0: begin
                    rdata <= int_coeffs_17[15:0];
                end
                ADDR_COEFFS_18_DATA_0: begin
                    rdata <= int_coeffs_18[15:0];
                end
                ADDR_COEFFS_19_DATA_0: begin
                    rdata <= int_coeffs_19[15:0];
                end
                ADDR_COEFFS_20_DATA_0: begin
                    rdata <= int_coeffs_20[15:0];
                end
                ADDR_COEFFS_21_DATA_0: begin
                    rdata <= int_coeffs_21[15:0];
                end
                ADDR_COEFFS_22_DATA_0: begin
                    rdata <= int_coeffs_22[15:0];
                end
                ADDR_COEFFS_23_DATA_0: begin
                    rdata <= int_coeffs_23[15:0];
                end
                ADDR_COEFFS_24_DATA_0: begin
                    rdata <= int_coeffs_24[15:0];
                end
                ADDR_COEFFS_25_DATA_0: begin
                    rdata <= int_coeffs_25[15:0];
                end
                ADDR_COEFFS_26_DATA_0: begin
                    rdata <= int_coeffs_26[15:0];
                end
                ADDR_COEFFS_27_DATA_0: begin
                    rdata <= int_coeffs_27[15:0];
                end
                ADDR_COEFFS_28_DATA_0: begin
                    rdata <= int_coeffs_28[15:0];
                end
                ADDR_COEFFS_29_DATA_0: begin
                    rdata <= int_coeffs_29[15:0];
                end
                ADDR_COEFFS_30_DATA_0: begin
                    rdata <= int_coeffs_30[15:0];
                end
                ADDR_COEFFS_31_DATA_0: begin
                    rdata <= int_coeffs_31[15:0];
                end
                ADDR_NUM_TAPS_DATA_0: begin
                    rdata <= int_num_taps[31:0];
                end
                ADDR_NUM_SAMPLES_DATA_0: begin
                    rdata <= int_num_samples[31:0];
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign coeffs_0          = int_coeffs_0;
assign coeffs_1          = int_coeffs_1;
assign coeffs_2          = int_coeffs_2;
assign coeffs_3          = int_coeffs_3;
assign coeffs_4          = int_coeffs_4;
assign coeffs_5          = int_coeffs_5;
assign coeffs_6          = int_coeffs_6;
assign coeffs_7          = int_coeffs_7;
assign coeffs_8          = int_coeffs_8;
assign coeffs_9          = int_coeffs_9;
assign coeffs_10         = int_coeffs_10;
assign coeffs_11         = int_coeffs_11;
assign coeffs_12         = int_coeffs_12;
assign coeffs_13         = int_coeffs_13;
assign coeffs_14         = int_coeffs_14;
assign coeffs_15         = int_coeffs_15;
assign coeffs_16         = int_coeffs_16;
assign coeffs_17         = int_coeffs_17;
assign coeffs_18         = int_coeffs_18;
assign coeffs_19         = int_coeffs_19;
assign coeffs_20         = int_coeffs_20;
assign coeffs_21         = int_coeffs_21;
assign coeffs_22         = int_coeffs_22;
assign coeffs_23         = int_coeffs_23;
assign coeffs_24         = int_coeffs_24;
assign coeffs_25         = int_coeffs_25;
assign coeffs_26         = int_coeffs_26;
assign coeffs_27         = int_coeffs_27;
assign coeffs_28         = int_coeffs_28;
assign coeffs_29         = int_coeffs_29;
assign coeffs_30         = int_coeffs_30;
assign coeffs_31         = int_coeffs_31;
assign num_taps          = int_num_taps;
assign num_samples       = int_num_samples;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_coeffs_0[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_0[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_0_DATA_0)
            int_coeffs_0[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_0[15:0] & ~wmask);
    end
end

// int_coeffs_1[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_1[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_1_DATA_0)
            int_coeffs_1[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_1[15:0] & ~wmask);
    end
end

// int_coeffs_2[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_2[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_2_DATA_0)
            int_coeffs_2[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_2[15:0] & ~wmask);
    end
end

// int_coeffs_3[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_3[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_3_DATA_0)
            int_coeffs_3[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_3[15:0] & ~wmask);
    end
end

// int_coeffs_4[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_4[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_4_DATA_0)
            int_coeffs_4[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_4[15:0] & ~wmask);
    end
end

// int_coeffs_5[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_5[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_5_DATA_0)
            int_coeffs_5[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_5[15:0] & ~wmask);
    end
end

// int_coeffs_6[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_6[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_6_DATA_0)
            int_coeffs_6[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_6[15:0] & ~wmask);
    end
end

// int_coeffs_7[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_7[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_7_DATA_0)
            int_coeffs_7[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_7[15:0] & ~wmask);
    end
end

// int_coeffs_8[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_8[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_8_DATA_0)
            int_coeffs_8[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_8[15:0] & ~wmask);
    end
end

// int_coeffs_9[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_9[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_9_DATA_0)
            int_coeffs_9[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_9[15:0] & ~wmask);
    end
end

// int_coeffs_10[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_10[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_10_DATA_0)
            int_coeffs_10[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_10[15:0] & ~wmask);
    end
end

// int_coeffs_11[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_11[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_11_DATA_0)
            int_coeffs_11[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_11[15:0] & ~wmask);
    end
end

// int_coeffs_12[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_12[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_12_DATA_0)
            int_coeffs_12[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_12[15:0] & ~wmask);
    end
end

// int_coeffs_13[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_13[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_13_DATA_0)
            int_coeffs_13[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_13[15:0] & ~wmask);
    end
end

// int_coeffs_14[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_14[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_14_DATA_0)
            int_coeffs_14[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_14[15:0] & ~wmask);
    end
end

// int_coeffs_15[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_15[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_15_DATA_0)
            int_coeffs_15[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_15[15:0] & ~wmask);
    end
end

// int_coeffs_16[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_16[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_16_DATA_0)
            int_coeffs_16[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_16[15:0] & ~wmask);
    end
end

// int_coeffs_17[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_17[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_17_DATA_0)
            int_coeffs_17[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_17[15:0] & ~wmask);
    end
end

// int_coeffs_18[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_18[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_18_DATA_0)
            int_coeffs_18[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_18[15:0] & ~wmask);
    end
end

// int_coeffs_19[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_19[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_19_DATA_0)
            int_coeffs_19[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_19[15:0] & ~wmask);
    end
end

// int_coeffs_20[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_20[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_20_DATA_0)
            int_coeffs_20[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_20[15:0] & ~wmask);
    end
end

// int_coeffs_21[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_21[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_21_DATA_0)
            int_coeffs_21[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_21[15:0] & ~wmask);
    end
end

// int_coeffs_22[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_22[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_22_DATA_0)
            int_coeffs_22[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_22[15:0] & ~wmask);
    end
end

// int_coeffs_23[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_23[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_23_DATA_0)
            int_coeffs_23[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_23[15:0] & ~wmask);
    end
end

// int_coeffs_24[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_24[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_24_DATA_0)
            int_coeffs_24[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_24[15:0] & ~wmask);
    end
end

// int_coeffs_25[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_25[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_25_DATA_0)
            int_coeffs_25[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_25[15:0] & ~wmask);
    end
end

// int_coeffs_26[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_26[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_26_DATA_0)
            int_coeffs_26[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_26[15:0] & ~wmask);
    end
end

// int_coeffs_27[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_27[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_27_DATA_0)
            int_coeffs_27[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_27[15:0] & ~wmask);
    end
end

// int_coeffs_28[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_28[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_28_DATA_0)
            int_coeffs_28[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_28[15:0] & ~wmask);
    end
end

// int_coeffs_29[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_29[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_29_DATA_0)
            int_coeffs_29[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_29[15:0] & ~wmask);
    end
end

// int_coeffs_30[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_30[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_30_DATA_0)
            int_coeffs_30[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_30[15:0] & ~wmask);
    end
end

// int_coeffs_31[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_coeffs_31[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_COEFFS_31_DATA_0)
            int_coeffs_31[15:0] <= (WDATA[31:0] & wmask) | (int_coeffs_31[15:0] & ~wmask);
    end
end

// int_num_taps[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_num_taps[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUM_TAPS_DATA_0)
            int_num_taps[31:0] <= (WDATA[31:0] & wmask) | (int_num_taps[31:0] & ~wmask);
    end
end

// int_num_samples[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_num_samples[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_NUM_SAMPLES_DATA_0)
            int_num_samples[31:0] <= (WDATA[31:0] & wmask) | (int_num_samples[31:0] & ~wmask);
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule
