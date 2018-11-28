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
	-- qsys nios component
	component crypto_wallet is
		port (
			clk_clk                           : in    std_logic;								-- clk
         reset_n_reset_n                   : in    std_logic;								-- reset_n
			epcs_flash_controller_dclk        : out   std_logic;								-- dclk
			epcs_flash_controller_sce         : out   std_logic;								-- sce
			epcs_flash_controller_sdo         : out   std_logic;								-- sdo
			epcs_flash_controller_data0       : in    std_logic;								-- data0
			po_led_external_connection_export : out   std_logic_vector( 7 downto 0);	-- export
			pi_sw_external_connection_export  : in    std_logic_vector( 3 downto 0);	-- export
			pi_key_external_connection_export : in    std_logic_vector( 1 downto 0);	-- export
			sdram_addr                        : out   std_logic_vector(12 downto 0);	-- addr
			sdram_ba                          : out   std_logic_vector( 1 downto 0);	-- ba
			sdram_cas_n                       : out   std_logic;								-- cas_n
			sdram_cke                         : out   std_logic;								-- cke
			sdram_cs_n                        : out   std_logic;								-- cs_n
			sdram_dq                          : inout std_logic_vector(15 downto 0);	-- dq
			sdram_dqm                         : out   std_logic_vector( 1 downto 0);	-- dqm
			sdram_ras_n                       : out   std_logic;								-- ras_n
			sdram_we_n                        : out   std_logic								-- we_n
		);
	end component crypto_wallet;

	-- SDRAM PLL
	component sdram_pll
		port (
			inclk0		: in std_logic;
			c0				: out std_logic 
		);
	end component;

	--------------------------------
	-- Signals
	--------------------------------
	
	
begin
	--------------------------------
	-- Concurrent Logic
	--------------------------------
	wallet_cpu_inst : crypto_wallet
		port map (
			clk_clk                           	=> CLOCK_50,		--: in    std_logic;								-- clk
         reset_n_reset_n                   	=> '1', 				--: in    std_logic;								-- reset_n
			epcs_flash_controller_dclk        	=> EPCS_DCLK,		--: out   std_logic;								-- dclk
			epcs_flash_controller_sce         	=> EPCS_NCSO,		--: out   std_logic;								-- sce
			epcs_flash_controller_sdo         	=> EPCS_ASDO,		--: out   std_logic;								-- sdo
			epcs_flash_controller_data0       	=> EPCS_DATA0,		--: in    std_logic;								-- data0
			po_led_external_connection_export 	=> LED,				--: out   std_logic_vector( 7 downto 0);	-- export
			pi_sw_external_connection_export  	=> SW,				--: in    std_logic_vector( 3 downto 0);	-- export
			pi_key_external_connection_export	=> KEY,				--: in    std_logic_vector( 1 downto 0);	-- export
			sdram_addr									=> DRAM_ADDR,		--: out   std_logic_vector(12 downto 0);	-- addr
			sdram_ba                          	=> DRAM_BA,			--: out   std_logic_vector( 1 downto 0);	-- ba
			sdram_cas_n                       	=> DRAM_CAS_N,		--: out   std_logic;								-- cas_n
			sdram_cke                         	=> DRAM_CKE,		--: out   std_logic;								-- cke
			sdram_cs_n                        	=> DRAM_CS_N,		--: out   std_logic;								-- cs_n
			sdram_dq                          	=> DRAM_DQ,			--: inout std_logic_vector(15 downto 0);	-- dq
			sdram_dqm                         	=> DRAM_DQM,		--: out   std_logic_vector( 1 downto 0);	-- dqm
			sdram_ras_n									=> DRAM_RAS_N,		--: out   std_logic;								-- ras_n
			sdram_we_n									=> DRAM_WE_N		--: out   std_logic								-- we_n
		);

	sdram_pll_inst : sdram_pll
		port map (
			inclk0										=> CLOCK_50,		--: in std_logic;
			c0												=> DRAM_CLK			--: out std_logic 
		);

	--------------------------------
	-- Processes
	--------------------------------
	

end architecture rtl;