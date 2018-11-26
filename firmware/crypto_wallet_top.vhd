----------------------------------------------------------------
-- Company:
-- Author: B. Silver, J. Maldonado
-- 
-- Create Date: 11/25/2018
-- Module Name: crypto_wallet_top.vhd
-- Revision: 
-- Description: VHDL top level module developed from de0 nano system builder
----------------------------------------------------------------
library IEEE;
	  use IEEE.std_logic_1164.all;

entity crypto_wallet_top is
    port(
		-- Clock
		CLOCK_50					: in		std_logic;

		-- User Interface
		LED						: out		std_logic_vector ( 7 downto 0);
		KEY						: in		std_logic_vector ( 1 downto 0);
		SW							: in		std_logic_vector ( 3 downto 0);

		-- DRAM
		DRAM_ADDR				: out		std_logic_vector (12 downto 0);
		DRAM_BA					: out		std_logic_vector ( 1 downto 0);
		DRAM_CAS_N				: out		std_logic;
		DRAM_CKE					: out		std_logic;
		DRAM_CLK					: out 	std_logic;
		DRAM_CS_N				: out		std_logic;
		DRAM_DQ					: inout	std_logic_vector (15 downto 0);
		DRAM_DQM					: out		std_logic_vector ( 1 downto 0);
		DRAM_RAS_N				: out 	std_logic;
		DRAM_WE_N				: out 	std_logic;

		-- EPCS
		EPCS_ASDO				: out 	std_logic;
		EPCS_DATA0				: in  	std_logic;
		EPCS_DCLK				: out 	std_logic;
		EPCS_NCSO				: out 	std_logic;
		
		-- Accelerometer and EEPROM
--		G_SENSOR_CS_N			: out		std_logic;
--		G_SENSOR_INT			: out		std_logic;
		I2C_SCLK					: out		std_logic;
		I2C_SDAT					: inout	std_logic;

		-- ADC
		ADC_CS_N					: out		std_logic;
		ADC_SADDR				: out		std_logic;
		ADC_SCLK					: out		std_logic;
		ADC_SDAT					: in		std_logic;
		
		-- 2x13 GPIO Header
		GPIO2						: inout	std_logic_vector (12 downto 0);
		GPIO2_IN					: in		std_logic_vector ( 2 downto 0);

		-- GPIO 0
		gpio0						: inout	std_logic_vector (33 downto 0);
		gpio0_IN					: in		std_logic_vector ( 1 downto 0);
		
		-- GPIO 1
		gpio1						: inout	std_logic_vector (33 downto 0);
		gpio1_IN					: in		std_logic_vector ( 1 downto 0)
     );
end entity crypto_wallet_top;


architecture rtl of crypto_wallet_top is
	--------------------------------
	-- Constants
	--------------------------------

	--------------------------------
	-- Functions
	--------------------------------
	
	--------------------------------
	-- Components
	--------------------------------
	-- qsys component
	component crypto_wallet is
		port (
			buttons_pi_export : in    std_logic_vector(1 downto 0); 	-- export
			clk_clk           : in    std_logic;             			-- clk
			epcs_dclk         : out   std_logic;							-- dclk
			epcs_sce          : out   std_logic;							-- sce
			epcs_sdo          : out   std_logic;							-- sdo
			epcs_data0        : in    std_logic;							-- data0
			led_po_export     : out   std_logic_vector(7 downto 0);	-- export
			reset_reset_n     : in    std_logic;							-- reset_n
			sdram_addr        : out   std_logic_vector(12 downto 0);	-- addr
			sdram_ba          : out   std_logic_vector(1 downto 0);	-- ba
			sdram_cas_n       : out   std_logic;							-- cas_n
			sdram_cke         : out   std_logic;							-- cke
			sdram_cs_n        : out   std_logic;							-- cs_n
			sdram_dq          : inout std_logic_vector(15 downto 0);	-- dq
			sdram_dqm         : out   std_logic_vector(1 downto 0);	-- dqm
			sdram_ras_n       : out   std_logic;							-- ras_n
			sdram_we_n        : out   std_logic;							-- we_n
			switch_pi_export  : in    std_logic_vector(3 downto 0);	-- export
			uart_0_rxd        : in    std_logic;							-- rxd
			uart_0_txd        : out   std_logic								-- txd
		);
	end component crypto_wallet;


	--------------------------------
	-- Signals
	--------------------------------

	
begin
	--------------------------------
	-- Concurrent Logic
	--------------------------------
	 wallet_cpu_inst : crypto_wallet
		port map (
			buttons_pi_export => KEY, 			-- in    std_logic_vector(1 downto 0); 	-- export
			clk_clk           => CLOCK_50, 	-- in    std_logic;             			-- clk
			epcs_dclk         => EPCS_DCLK, 	-- out   std_logic;								-- dclk
			epcs_sce          => EPCS_NCSO, 	-- out   std_logic;								-- sce
			epcs_sdo          => EPCS_ASDO, 	-- out   std_logic;								-- sdo
			epcs_data0        => EPCS_DATA0, -- in    std_logic;             			-- data0
			led_po_export     => LED, 			-- out   std_logic_vector(7 downto 0);	-- export
			reset_reset_n     => '1', 		-- in    std_logic;            		 		-- reset_n
			sdram_addr        => DRAM_ADDR, 	-- out   std_logic_vector(12 downto 0);	-- addr
			sdram_ba          => DRAM_BA, 	-- out   std_logic_vector(1 downto 0);	-- ba
			sdram_cas_n       => DRAM_CAS_N, -- out   std_logic;								-- cas_n
			sdram_cke         => DRAM_CKE, 	-- out   std_logic;								-- cke
			sdram_cs_n        => DRAM_CS_N,	-- out   std_logic;								-- cs_n
			sdram_dq          => DRAM_DQ, 	-- inout std_logic_vector(15 downto 0);	-- dq
			sdram_dqm         => DRAM_DQM, 	-- out   std_logic_vector(1 downto 0);	-- dqm
			sdram_ras_n       => DRAM_RAS_N, -- out   std_logic;								-- ras_n
			sdram_we_n        => DRAM_WE_N, 	-- out   std_logic;								-- we_n
			switch_pi_export  => SW, 			-- in    std_logic_vector(3 downto 0);	-- export
			uart_0_rxd        => '0', 			-- in    std_logic;            			 	-- rxd
			uart_0_txd        => open			-- out   std_logic								-- txd
		);		
		
	--------------------------------
	-- Processes
	--------------------------------
	

end architecture rtl;