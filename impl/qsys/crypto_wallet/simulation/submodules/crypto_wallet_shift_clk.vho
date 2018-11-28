--IP Functional Simulation Model
--VERSION_BEGIN 18.1 cbx_mgl 2018:09:12:13:10:36:SJ cbx_simgen 2018:09:12:13:04:24:SJ  VERSION_END


-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- You may only use these simulation model output files for simulation
-- purposes and expressly not for synthesis or any other purposes (in which
-- event Intel disclaims all warranties of any kind).


--synopsys translate_off

 LIBRARY cycloneive;
 USE cycloneive.cycloneive_components.all;

--synthesis_resources = cycloneive_pll 1 lut 6 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  crypto_wallet_shift_clk IS 
	 PORT 
	 ( 
		 address	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0);
		 areset	:	IN  STD_LOGIC;
		 c0	:	OUT  STD_LOGIC;
		 clk	:	IN  STD_LOGIC;
		 configupdate	:	IN  STD_LOGIC;
		 locked	:	OUT  STD_LOGIC;
		 phasecounterselect	:	IN  STD_LOGIC_VECTOR (3 DOWNTO 0);
		 phasedone	:	OUT  STD_LOGIC;
		 phasestep	:	IN  STD_LOGIC;
		 phaseupdown	:	IN  STD_LOGIC;
		 read	:	IN  STD_LOGIC;
		 readdata	:	OUT  STD_LOGIC_VECTOR (31 DOWNTO 0);
		 reset	:	IN  STD_LOGIC;
		 scanclk	:	IN  STD_LOGIC;
		 scanclkena	:	IN  STD_LOGIC;
		 scandata	:	IN  STD_LOGIC;
		 scandataout	:	OUT  STD_LOGIC;
		 scandone	:	OUT  STD_LOGIC;
		 write	:	IN  STD_LOGIC;
		 writedata	:	IN  STD_LOGIC_VECTOR (31 DOWNTO 0)
	 ); 
 END crypto_wallet_shift_clk;

 ARCHITECTURE RTL OF crypto_wallet_shift_clk IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 SIGNAL  wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_clk	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_fbout	:	STD_LOGIC;
	 SIGNAL  wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_inclk	:	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked	:	STD_LOGIC;
	 SIGNAL	crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_pll_lock_sync_131q	:	STD_LOGIC := '0';
	 SIGNAL	crypto_wallet_shift_clk_pfdena_reg_24q	:	STD_LOGIC := '0';
	 SIGNAL	crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe4a_0_119q	:	STD_LOGIC := '0';
	 SIGNAL	crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe5a_0_122q	:	STD_LOGIC := '0';
	 SIGNAL	crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe6a_0_123q	:	STD_LOGIC := '0';
	 SIGNAL	crypto_wallet_shift_clk_prev_reset_20q	:	STD_LOGIC := '0';
	 SIGNAL  wire_w_lg_w_lg_w20w21w22w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w14w16w17w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w20w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w14w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w15w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_address_range2w5w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_reset11w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w85w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_address_range3w4w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w20w21w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w14w16w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  s_wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_locked_129_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_crypto_wallet_shift_clk_w_select_control_15_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_crypto_wallet_shift_clk_w_select_status_16_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_crypto_wallet_shift_clk_wire_pfdena_reg_ena_12_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout :	STD_LOGIC;
	 SIGNAL  s_wire_vcc :	STD_LOGIC;
	 SIGNAL  wire_w_address_range2w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_address_range3w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
 BEGIN

	wire_w_lg_w_lg_w20w21w22w(0) <= wire_w_lg_w20w21w(0) AND read;
	wire_w_lg_w_lg_w14w16w17w(0) <= wire_w_lg_w14w16w(0) AND read;
	wire_w20w(0) <= s_wire_crypto_wallet_shift_clk_w_select_control_15_dataout AND crypto_wallet_shift_clk_pfdena_reg_24q;
	wire_w14w(0) <= s_wire_crypto_wallet_shift_clk_w_select_control_15_dataout AND crypto_wallet_shift_clk_prev_reset_20q;
	wire_w15w(0) <= s_wire_crypto_wallet_shift_clk_w_select_status_16_dataout AND crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe6a_0_123q;
	wire_w_lg_w_address_range2w5w(0) <= wire_w_address_range2w(0) AND wire_w_lg_w_address_range3w4w(0);
	wire_w_lg_reset11w(0) <= NOT reset;
	wire_w85w(0) <= NOT s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout;
	wire_w_lg_w_address_range3w4w(0) <= NOT wire_w_address_range3w(0);
	wire_w_lg_w20w21w(0) <= wire_w20w(0) OR s_wire_crypto_wallet_shift_clk_w_select_status_16_dataout;
	wire_w_lg_w14w16w(0) <= wire_w14w(0) OR wire_w15w(0);
	c0 <= wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_clk(0);
	locked <= s_wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_locked_129_dataout;
	phasedone <= '0';
	readdata <= ( "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & "0" & wire_w_lg_w_lg_w20w21w22w & wire_w_lg_w_lg_w14w16w17w);
	s_wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_locked_129_dataout <= (crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_pll_lock_sync_131q AND wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked);
	s_wire_crypto_wallet_shift_clk_w_select_control_15_dataout <= wire_w_lg_w_address_range2w5w(0);
	s_wire_crypto_wallet_shift_clk_w_select_status_16_dataout <= ((NOT address(0)) AND wire_w_lg_w_address_range3w4w(0));
	s_wire_crypto_wallet_shift_clk_wire_pfdena_reg_ena_12_dataout <= (s_wire_crypto_wallet_shift_clk_w_select_control_15_dataout AND write);
	s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout <= (crypto_wallet_shift_clk_prev_reset_20q OR areset);
	s_wire_vcc <= '1';
	scandataout <= '0';
	scandone <= '0';
	wire_w_address_range2w(0) <= address(0);
	wire_w_address_range3w(0) <= address(1);
	wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_inclk <= ( "0" & clk);
	crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141 :  cycloneive_pll
	  GENERIC MAP (
		BANDWIDTH_TYPE => "auto",
		CLK0_DIVIDE_BY => 1,
		CLK0_DUTY_CYCLE => 50,
		CLK0_MULTIPLY_BY => 1,
		CLK0_PHASE_SHIFT => "-3000",
		COMPENSATE_CLOCK => "clk0",
		INCLK0_INPUT_FREQUENCY => 20000,
		OPERATION_MODE => "normal",
		PLL_TYPE => "auto"
	  )
	  PORT MAP ( 
		areset => s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout,
		clk => wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_clk,
		fbin => wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_fbout,
		fbout => wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_fbout,
		inclk => wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_inclk,
		locked => wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked
	  );
	PROCESS (wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked, s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout)
	BEGIN
		IF (s_wire_crypto_wallet_shift_clk_wire_sd1_areset_18_dataout = '1') THEN
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_pll_lock_sync_131q <= '0';
		ELSIF (wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked = '1' AND wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_cycloneive_pll_pll7_141_locked'event) THEN
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_pll_lock_sync_131q <= s_wire_vcc;
		END IF;
	END PROCESS;
	PROCESS (clk, reset)
	BEGIN
		IF (reset = '1') THEN
				crypto_wallet_shift_clk_pfdena_reg_24q <= '1';
		ELSIF (clk = '1' AND clk'event) THEN
			IF (s_wire_crypto_wallet_shift_clk_wire_pfdena_reg_ena_12_dataout = '1') THEN
				crypto_wallet_shift_clk_pfdena_reg_24q <= writedata(1);
			END IF;
		END IF;
		if (now = 0 ns) then
			crypto_wallet_shift_clk_pfdena_reg_24q <= '1' after 1 ps;
		end if;
	END PROCESS;
	PROCESS (clk, reset)
	BEGIN
		IF (reset = '1') THEN
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe4a_0_119q <= '0';
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe5a_0_122q <= '0';
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe6a_0_123q <= '0';
				crypto_wallet_shift_clk_prev_reset_20q <= '0';
		ELSIF (clk = '1' AND clk'event) THEN
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe4a_0_119q <= s_wire_crypto_wallet_shift_clk_crypto_wallet_shift_clk_altpll_l942_sd1_locked_129_dataout;
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe5a_0_122q <= crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe4a_0_119q;
				crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe6a_0_123q <= crypto_wallet_shift_clk_crypto_wallet_shift_clk_stdsync_sv6_stdsync2_crypto_wallet_shift_clk_dffpipe_l2c_dffpipe3_dffe5a_0_122q;
				crypto_wallet_shift_clk_prev_reset_20q <= (s_wire_crypto_wallet_shift_clk_wire_pfdena_reg_ena_12_dataout AND writedata(0));
		END IF;
	END PROCESS;

 END RTL; --crypto_wallet_shift_clk
--synopsys translate_on
--VALID FILE
