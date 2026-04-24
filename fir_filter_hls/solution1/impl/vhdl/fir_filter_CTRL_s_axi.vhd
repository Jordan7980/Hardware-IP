-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
-- Tool Version Limit: 2024.05
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity fir_filter_CTRL_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 9;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    coeffs_0              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_1              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_2              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_3              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_4              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_5              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_6              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_7              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_8              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_9              :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_10             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_11             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_12             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_13             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_14             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_15             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_16             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_17             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_18             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_19             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_20             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_21             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_22             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_23             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_24             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_25             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_26             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_27             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_28             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_29             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_30             :out  STD_LOGIC_VECTOR(15 downto 0);
    coeffs_31             :out  STD_LOGIC_VECTOR(15 downto 0);
    num_taps              :out  STD_LOGIC_VECTOR(31 downto 0);
    num_samples           :out  STD_LOGIC_VECTOR(31 downto 0);
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity fir_filter_CTRL_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_hs
--
-- 0x000 : Control signals
--         bit 0  - ap_start (Read/Write/COH)
--         bit 1  - ap_done (Read/COR)
--         bit 2  - ap_idle (Read)
--         bit 3  - ap_ready (Read/COR)
--         bit 7  - auto_restart (Read/Write)
--         bit 9  - interrupt (Read)
--         others - reserved
-- 0x004 : Global Interrupt Enable Register
--         bit 0  - Global Interrupt Enable (Read/Write)
--         others - reserved
-- 0x008 : IP Interrupt Enable Register (Read/Write)
--         bit 0 - enable ap_done interrupt (Read/Write)
--         bit 1 - enable ap_ready interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0 - ap_done (Read/TOW)
--         bit 1 - ap_ready (Read/TOW)
--         others - reserved
-- 0x010 : Data signal of coeffs_0
--         bit 15~0 - coeffs_0[15:0] (Read/Write)
--         others   - reserved
-- 0x014 : reserved
-- 0x018 : Data signal of coeffs_1
--         bit 15~0 - coeffs_1[15:0] (Read/Write)
--         others   - reserved
-- 0x01c : reserved
-- 0x020 : Data signal of coeffs_2
--         bit 15~0 - coeffs_2[15:0] (Read/Write)
--         others   - reserved
-- 0x024 : reserved
-- 0x028 : Data signal of coeffs_3
--         bit 15~0 - coeffs_3[15:0] (Read/Write)
--         others   - reserved
-- 0x02c : reserved
-- 0x030 : Data signal of coeffs_4
--         bit 15~0 - coeffs_4[15:0] (Read/Write)
--         others   - reserved
-- 0x034 : reserved
-- 0x038 : Data signal of coeffs_5
--         bit 15~0 - coeffs_5[15:0] (Read/Write)
--         others   - reserved
-- 0x03c : reserved
-- 0x040 : Data signal of coeffs_6
--         bit 15~0 - coeffs_6[15:0] (Read/Write)
--         others   - reserved
-- 0x044 : reserved
-- 0x048 : Data signal of coeffs_7
--         bit 15~0 - coeffs_7[15:0] (Read/Write)
--         others   - reserved
-- 0x04c : reserved
-- 0x050 : Data signal of coeffs_8
--         bit 15~0 - coeffs_8[15:0] (Read/Write)
--         others   - reserved
-- 0x054 : reserved
-- 0x058 : Data signal of coeffs_9
--         bit 15~0 - coeffs_9[15:0] (Read/Write)
--         others   - reserved
-- 0x05c : reserved
-- 0x060 : Data signal of coeffs_10
--         bit 15~0 - coeffs_10[15:0] (Read/Write)
--         others   - reserved
-- 0x064 : reserved
-- 0x068 : Data signal of coeffs_11
--         bit 15~0 - coeffs_11[15:0] (Read/Write)
--         others   - reserved
-- 0x06c : reserved
-- 0x070 : Data signal of coeffs_12
--         bit 15~0 - coeffs_12[15:0] (Read/Write)
--         others   - reserved
-- 0x074 : reserved
-- 0x078 : Data signal of coeffs_13
--         bit 15~0 - coeffs_13[15:0] (Read/Write)
--         others   - reserved
-- 0x07c : reserved
-- 0x080 : Data signal of coeffs_14
--         bit 15~0 - coeffs_14[15:0] (Read/Write)
--         others   - reserved
-- 0x084 : reserved
-- 0x088 : Data signal of coeffs_15
--         bit 15~0 - coeffs_15[15:0] (Read/Write)
--         others   - reserved
-- 0x08c : reserved
-- 0x090 : Data signal of coeffs_16
--         bit 15~0 - coeffs_16[15:0] (Read/Write)
--         others   - reserved
-- 0x094 : reserved
-- 0x098 : Data signal of coeffs_17
--         bit 15~0 - coeffs_17[15:0] (Read/Write)
--         others   - reserved
-- 0x09c : reserved
-- 0x0a0 : Data signal of coeffs_18
--         bit 15~0 - coeffs_18[15:0] (Read/Write)
--         others   - reserved
-- 0x0a4 : reserved
-- 0x0a8 : Data signal of coeffs_19
--         bit 15~0 - coeffs_19[15:0] (Read/Write)
--         others   - reserved
-- 0x0ac : reserved
-- 0x0b0 : Data signal of coeffs_20
--         bit 15~0 - coeffs_20[15:0] (Read/Write)
--         others   - reserved
-- 0x0b4 : reserved
-- 0x0b8 : Data signal of coeffs_21
--         bit 15~0 - coeffs_21[15:0] (Read/Write)
--         others   - reserved
-- 0x0bc : reserved
-- 0x0c0 : Data signal of coeffs_22
--         bit 15~0 - coeffs_22[15:0] (Read/Write)
--         others   - reserved
-- 0x0c4 : reserved
-- 0x0c8 : Data signal of coeffs_23
--         bit 15~0 - coeffs_23[15:0] (Read/Write)
--         others   - reserved
-- 0x0cc : reserved
-- 0x0d0 : Data signal of coeffs_24
--         bit 15~0 - coeffs_24[15:0] (Read/Write)
--         others   - reserved
-- 0x0d4 : reserved
-- 0x0d8 : Data signal of coeffs_25
--         bit 15~0 - coeffs_25[15:0] (Read/Write)
--         others   - reserved
-- 0x0dc : reserved
-- 0x0e0 : Data signal of coeffs_26
--         bit 15~0 - coeffs_26[15:0] (Read/Write)
--         others   - reserved
-- 0x0e4 : reserved
-- 0x0e8 : Data signal of coeffs_27
--         bit 15~0 - coeffs_27[15:0] (Read/Write)
--         others   - reserved
-- 0x0ec : reserved
-- 0x0f0 : Data signal of coeffs_28
--         bit 15~0 - coeffs_28[15:0] (Read/Write)
--         others   - reserved
-- 0x0f4 : reserved
-- 0x0f8 : Data signal of coeffs_29
--         bit 15~0 - coeffs_29[15:0] (Read/Write)
--         others   - reserved
-- 0x0fc : reserved
-- 0x100 : Data signal of coeffs_30
--         bit 15~0 - coeffs_30[15:0] (Read/Write)
--         others   - reserved
-- 0x104 : reserved
-- 0x108 : Data signal of coeffs_31
--         bit 15~0 - coeffs_31[15:0] (Read/Write)
--         others   - reserved
-- 0x10c : reserved
-- 0x110 : Data signal of num_taps
--         bit 31~0 - num_taps[31:0] (Read/Write)
-- 0x114 : reserved
-- 0x118 : Data signal of num_samples
--         bit 31~0 - num_samples[31:0] (Read/Write)
-- 0x11c : reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of fir_filter_CTRL_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL            : INTEGER := 16#000#;
    constant ADDR_GIE                : INTEGER := 16#004#;
    constant ADDR_IER                : INTEGER := 16#008#;
    constant ADDR_ISR                : INTEGER := 16#00c#;
    constant ADDR_COEFFS_0_DATA_0    : INTEGER := 16#010#;
    constant ADDR_COEFFS_0_CTRL      : INTEGER := 16#014#;
    constant ADDR_COEFFS_1_DATA_0    : INTEGER := 16#018#;
    constant ADDR_COEFFS_1_CTRL      : INTEGER := 16#01c#;
    constant ADDR_COEFFS_2_DATA_0    : INTEGER := 16#020#;
    constant ADDR_COEFFS_2_CTRL      : INTEGER := 16#024#;
    constant ADDR_COEFFS_3_DATA_0    : INTEGER := 16#028#;
    constant ADDR_COEFFS_3_CTRL      : INTEGER := 16#02c#;
    constant ADDR_COEFFS_4_DATA_0    : INTEGER := 16#030#;
    constant ADDR_COEFFS_4_CTRL      : INTEGER := 16#034#;
    constant ADDR_COEFFS_5_DATA_0    : INTEGER := 16#038#;
    constant ADDR_COEFFS_5_CTRL      : INTEGER := 16#03c#;
    constant ADDR_COEFFS_6_DATA_0    : INTEGER := 16#040#;
    constant ADDR_COEFFS_6_CTRL      : INTEGER := 16#044#;
    constant ADDR_COEFFS_7_DATA_0    : INTEGER := 16#048#;
    constant ADDR_COEFFS_7_CTRL      : INTEGER := 16#04c#;
    constant ADDR_COEFFS_8_DATA_0    : INTEGER := 16#050#;
    constant ADDR_COEFFS_8_CTRL      : INTEGER := 16#054#;
    constant ADDR_COEFFS_9_DATA_0    : INTEGER := 16#058#;
    constant ADDR_COEFFS_9_CTRL      : INTEGER := 16#05c#;
    constant ADDR_COEFFS_10_DATA_0   : INTEGER := 16#060#;
    constant ADDR_COEFFS_10_CTRL     : INTEGER := 16#064#;
    constant ADDR_COEFFS_11_DATA_0   : INTEGER := 16#068#;
    constant ADDR_COEFFS_11_CTRL     : INTEGER := 16#06c#;
    constant ADDR_COEFFS_12_DATA_0   : INTEGER := 16#070#;
    constant ADDR_COEFFS_12_CTRL     : INTEGER := 16#074#;
    constant ADDR_COEFFS_13_DATA_0   : INTEGER := 16#078#;
    constant ADDR_COEFFS_13_CTRL     : INTEGER := 16#07c#;
    constant ADDR_COEFFS_14_DATA_0   : INTEGER := 16#080#;
    constant ADDR_COEFFS_14_CTRL     : INTEGER := 16#084#;
    constant ADDR_COEFFS_15_DATA_0   : INTEGER := 16#088#;
    constant ADDR_COEFFS_15_CTRL     : INTEGER := 16#08c#;
    constant ADDR_COEFFS_16_DATA_0   : INTEGER := 16#090#;
    constant ADDR_COEFFS_16_CTRL     : INTEGER := 16#094#;
    constant ADDR_COEFFS_17_DATA_0   : INTEGER := 16#098#;
    constant ADDR_COEFFS_17_CTRL     : INTEGER := 16#09c#;
    constant ADDR_COEFFS_18_DATA_0   : INTEGER := 16#0a0#;
    constant ADDR_COEFFS_18_CTRL     : INTEGER := 16#0a4#;
    constant ADDR_COEFFS_19_DATA_0   : INTEGER := 16#0a8#;
    constant ADDR_COEFFS_19_CTRL     : INTEGER := 16#0ac#;
    constant ADDR_COEFFS_20_DATA_0   : INTEGER := 16#0b0#;
    constant ADDR_COEFFS_20_CTRL     : INTEGER := 16#0b4#;
    constant ADDR_COEFFS_21_DATA_0   : INTEGER := 16#0b8#;
    constant ADDR_COEFFS_21_CTRL     : INTEGER := 16#0bc#;
    constant ADDR_COEFFS_22_DATA_0   : INTEGER := 16#0c0#;
    constant ADDR_COEFFS_22_CTRL     : INTEGER := 16#0c4#;
    constant ADDR_COEFFS_23_DATA_0   : INTEGER := 16#0c8#;
    constant ADDR_COEFFS_23_CTRL     : INTEGER := 16#0cc#;
    constant ADDR_COEFFS_24_DATA_0   : INTEGER := 16#0d0#;
    constant ADDR_COEFFS_24_CTRL     : INTEGER := 16#0d4#;
    constant ADDR_COEFFS_25_DATA_0   : INTEGER := 16#0d8#;
    constant ADDR_COEFFS_25_CTRL     : INTEGER := 16#0dc#;
    constant ADDR_COEFFS_26_DATA_0   : INTEGER := 16#0e0#;
    constant ADDR_COEFFS_26_CTRL     : INTEGER := 16#0e4#;
    constant ADDR_COEFFS_27_DATA_0   : INTEGER := 16#0e8#;
    constant ADDR_COEFFS_27_CTRL     : INTEGER := 16#0ec#;
    constant ADDR_COEFFS_28_DATA_0   : INTEGER := 16#0f0#;
    constant ADDR_COEFFS_28_CTRL     : INTEGER := 16#0f4#;
    constant ADDR_COEFFS_29_DATA_0   : INTEGER := 16#0f8#;
    constant ADDR_COEFFS_29_CTRL     : INTEGER := 16#0fc#;
    constant ADDR_COEFFS_30_DATA_0   : INTEGER := 16#100#;
    constant ADDR_COEFFS_30_CTRL     : INTEGER := 16#104#;
    constant ADDR_COEFFS_31_DATA_0   : INTEGER := 16#108#;
    constant ADDR_COEFFS_31_CTRL     : INTEGER := 16#10c#;
    constant ADDR_NUM_TAPS_DATA_0    : INTEGER := 16#110#;
    constant ADDR_NUM_TAPS_CTRL      : INTEGER := 16#114#;
    constant ADDR_NUM_SAMPLES_DATA_0 : INTEGER := 16#118#;
    constant ADDR_NUM_SAMPLES_CTRL   : INTEGER := 16#11c#;
    constant ADDR_BITS         : INTEGER := 9;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_interrupt       : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_coeffs_0        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_1        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_2        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_3        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_4        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_5        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_6        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_7        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_8        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_9        : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_10       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_11       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_12       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_13       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_14       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_15       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_16       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_17       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_18       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_19       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_20       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_21       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_22       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_23       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_24       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_25       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_26       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_27       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_28       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_29       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_30       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_coeffs_31       : UNSIGNED(15 downto 0) := (others => '0');
    signal int_num_taps        : UNSIGNED(31 downto 0) := (others => '0');
    signal int_num_samples     : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(9) <= int_interrupt;
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_COEFFS_0_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_0(15 downto 0), 32);
                    when ADDR_COEFFS_1_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_1(15 downto 0), 32);
                    when ADDR_COEFFS_2_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_2(15 downto 0), 32);
                    when ADDR_COEFFS_3_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_3(15 downto 0), 32);
                    when ADDR_COEFFS_4_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_4(15 downto 0), 32);
                    when ADDR_COEFFS_5_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_5(15 downto 0), 32);
                    when ADDR_COEFFS_6_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_6(15 downto 0), 32);
                    when ADDR_COEFFS_7_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_7(15 downto 0), 32);
                    when ADDR_COEFFS_8_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_8(15 downto 0), 32);
                    when ADDR_COEFFS_9_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_9(15 downto 0), 32);
                    when ADDR_COEFFS_10_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_10(15 downto 0), 32);
                    when ADDR_COEFFS_11_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_11(15 downto 0), 32);
                    when ADDR_COEFFS_12_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_12(15 downto 0), 32);
                    when ADDR_COEFFS_13_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_13(15 downto 0), 32);
                    when ADDR_COEFFS_14_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_14(15 downto 0), 32);
                    when ADDR_COEFFS_15_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_15(15 downto 0), 32);
                    when ADDR_COEFFS_16_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_16(15 downto 0), 32);
                    when ADDR_COEFFS_17_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_17(15 downto 0), 32);
                    when ADDR_COEFFS_18_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_18(15 downto 0), 32);
                    when ADDR_COEFFS_19_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_19(15 downto 0), 32);
                    when ADDR_COEFFS_20_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_20(15 downto 0), 32);
                    when ADDR_COEFFS_21_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_21(15 downto 0), 32);
                    when ADDR_COEFFS_22_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_22(15 downto 0), 32);
                    when ADDR_COEFFS_23_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_23(15 downto 0), 32);
                    when ADDR_COEFFS_24_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_24(15 downto 0), 32);
                    when ADDR_COEFFS_25_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_25(15 downto 0), 32);
                    when ADDR_COEFFS_26_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_26(15 downto 0), 32);
                    when ADDR_COEFFS_27_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_27(15 downto 0), 32);
                    when ADDR_COEFFS_28_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_28(15 downto 0), 32);
                    when ADDR_COEFFS_29_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_29(15 downto 0), 32);
                    when ADDR_COEFFS_30_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_30(15 downto 0), 32);
                    when ADDR_COEFFS_31_DATA_0 =>
                        rdata_data <= RESIZE(int_coeffs_31(15 downto 0), 32);
                    when ADDR_NUM_TAPS_DATA_0 =>
                        rdata_data <= RESIZE(int_num_taps(31 downto 0), 32);
                    when ADDR_NUM_SAMPLES_DATA_0 =>
                        rdata_data <= RESIZE(int_num_samples(31 downto 0), 32);
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_interrupt;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);
    coeffs_0             <= STD_LOGIC_VECTOR(int_coeffs_0);
    coeffs_1             <= STD_LOGIC_VECTOR(int_coeffs_1);
    coeffs_2             <= STD_LOGIC_VECTOR(int_coeffs_2);
    coeffs_3             <= STD_LOGIC_VECTOR(int_coeffs_3);
    coeffs_4             <= STD_LOGIC_VECTOR(int_coeffs_4);
    coeffs_5             <= STD_LOGIC_VECTOR(int_coeffs_5);
    coeffs_6             <= STD_LOGIC_VECTOR(int_coeffs_6);
    coeffs_7             <= STD_LOGIC_VECTOR(int_coeffs_7);
    coeffs_8             <= STD_LOGIC_VECTOR(int_coeffs_8);
    coeffs_9             <= STD_LOGIC_VECTOR(int_coeffs_9);
    coeffs_10            <= STD_LOGIC_VECTOR(int_coeffs_10);
    coeffs_11            <= STD_LOGIC_VECTOR(int_coeffs_11);
    coeffs_12            <= STD_LOGIC_VECTOR(int_coeffs_12);
    coeffs_13            <= STD_LOGIC_VECTOR(int_coeffs_13);
    coeffs_14            <= STD_LOGIC_VECTOR(int_coeffs_14);
    coeffs_15            <= STD_LOGIC_VECTOR(int_coeffs_15);
    coeffs_16            <= STD_LOGIC_VECTOR(int_coeffs_16);
    coeffs_17            <= STD_LOGIC_VECTOR(int_coeffs_17);
    coeffs_18            <= STD_LOGIC_VECTOR(int_coeffs_18);
    coeffs_19            <= STD_LOGIC_VECTOR(int_coeffs_19);
    coeffs_20            <= STD_LOGIC_VECTOR(int_coeffs_20);
    coeffs_21            <= STD_LOGIC_VECTOR(int_coeffs_21);
    coeffs_22            <= STD_LOGIC_VECTOR(int_coeffs_22);
    coeffs_23            <= STD_LOGIC_VECTOR(int_coeffs_23);
    coeffs_24            <= STD_LOGIC_VECTOR(int_coeffs_24);
    coeffs_25            <= STD_LOGIC_VECTOR(int_coeffs_25);
    coeffs_26            <= STD_LOGIC_VECTOR(int_coeffs_26);
    coeffs_27            <= STD_LOGIC_VECTOR(int_coeffs_27);
    coeffs_28            <= STD_LOGIC_VECTOR(int_coeffs_28);
    coeffs_29            <= STD_LOGIC_VECTOR(int_coeffs_29);
    coeffs_30            <= STD_LOGIC_VECTOR(int_coeffs_30);
    coeffs_31            <= STD_LOGIC_VECTOR(int_coeffs_31);
    num_taps             <= STD_LOGIC_VECTOR(int_num_taps);
    num_samples          <= STD_LOGIC_VECTOR(int_num_samples);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_interrupt <= '0';
            elsif (ACLK_EN = '1') then
                if (int_gie = '1' and (int_isr(0) or int_isr(1)) = '1') then
                    int_interrupt <= '1';
                else
                    int_interrupt <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_0(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_0_DATA_0) then
                    int_coeffs_0(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_0(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_1(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_1_DATA_0) then
                    int_coeffs_1(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_1(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_2(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_2_DATA_0) then
                    int_coeffs_2(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_2(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_3(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_3_DATA_0) then
                    int_coeffs_3(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_3(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_4(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_4_DATA_0) then
                    int_coeffs_4(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_4(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_5(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_5_DATA_0) then
                    int_coeffs_5(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_5(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_6(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_6_DATA_0) then
                    int_coeffs_6(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_6(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_7(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_7_DATA_0) then
                    int_coeffs_7(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_7(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_8(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_8_DATA_0) then
                    int_coeffs_8(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_8(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_9(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_9_DATA_0) then
                    int_coeffs_9(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_9(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_10(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_10_DATA_0) then
                    int_coeffs_10(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_10(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_11(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_11_DATA_0) then
                    int_coeffs_11(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_11(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_12(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_12_DATA_0) then
                    int_coeffs_12(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_12(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_13(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_13_DATA_0) then
                    int_coeffs_13(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_13(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_14(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_14_DATA_0) then
                    int_coeffs_14(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_14(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_15(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_15_DATA_0) then
                    int_coeffs_15(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_15(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_16(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_16_DATA_0) then
                    int_coeffs_16(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_16(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_17(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_17_DATA_0) then
                    int_coeffs_17(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_17(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_18(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_18_DATA_0) then
                    int_coeffs_18(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_18(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_19(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_19_DATA_0) then
                    int_coeffs_19(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_19(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_20(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_20_DATA_0) then
                    int_coeffs_20(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_20(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_21(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_21_DATA_0) then
                    int_coeffs_21(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_21(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_22(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_22_DATA_0) then
                    int_coeffs_22(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_22(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_23(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_23_DATA_0) then
                    int_coeffs_23(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_23(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_24(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_24_DATA_0) then
                    int_coeffs_24(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_24(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_25(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_25_DATA_0) then
                    int_coeffs_25(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_25(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_26(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_26_DATA_0) then
                    int_coeffs_26(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_26(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_27(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_27_DATA_0) then
                    int_coeffs_27(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_27(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_28(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_28_DATA_0) then
                    int_coeffs_28(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_28(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_29(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_29_DATA_0) then
                    int_coeffs_29(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_29(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_30(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_30_DATA_0) then
                    int_coeffs_30(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_30(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_coeffs_31(15 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_COEFFS_31_DATA_0) then
                    int_coeffs_31(15 downto 0) <= (UNSIGNED(WDATA(15 downto 0)) and wmask(15 downto 0)) or ((not wmask(15 downto 0)) and int_coeffs_31(15 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_num_taps(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUM_TAPS_DATA_0) then
                    int_num_taps(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_num_taps(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_num_samples(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_NUM_SAMPLES_DATA_0) then
                    int_num_samples(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_num_samples(31 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;
