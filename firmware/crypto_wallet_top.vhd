--
-- FILE: crypto_wallet_top.vhd
--
--
library IEEE;
	  use IEEE.std_logic_1164.all;
--   use IEEE.std_logic_textio.all;
--        use IEEE.std_logic_arith.all;
--        use IEEE.numeric_bit.all;
--        use IEEE.numeric_std.all;
--        use IEEE.std_logic_signed.all;
--        use IEEE.std_logic_unsigned.all;
--        use IEEE.math_real.all;
--        use IEEE.math_complex.all;



entity crypto_wallet_top is
    port(
        CLOCK_50             : in  std_logic;
        LED                  : out std_logic_vector ( 7 downto 0);
        KEY                  : in  std_logic_vector ( 1 downto 0);
        SW                   : in  std_logic_vector ( 3 downto 0);

        DRAM_ADDR            : out std_logic_vector (12 downto 0);
        DRAM_BA              : out std_logic_vector ( 1 downto 0);
        DRAM_CAS_N           : out std_logic;
        DRAM_CKE             : out std_logic;
        DRAM_CLK             : out std_logic;
        DRAM_CS_N            : out std_logic;
        DRAM_DQ              : inout std_logic_vector (15 downto 0);
        DRAM_DQM             : out std_logic_vector ( 1 downto 0);
        DRAM_RAS_N           : out std_logic;
        DRAM_WE_N            : out std_logic;

        EPCS_ASDO            : out std_logic;
        EPCS_DATA0           : in  std_logic;
        EPCS_DCLK            : out std_logic;
        EPCS_NCSO            : out std_logic


    --//////////// Accelerometer and EEPROM //////////
    --output                      G_SENSOR_CS_N,
    --input                       G_SENSOR_INT,
    --output                      I2C_SCLK,
    --inout                       I2C_SDAT,

    --//////////// ADC //////////
    --output                      ADC_CS_N,
    --output                      ADC_SADDR,
    --output                      ADC_SCLK,
    --input                       ADC_SDAT,

    --//////////// 2x13 GPIO Header //////////
    --inout           [12:0]      GPIO_2,
    --input            [2:0]      GPIO_2_IN,

    --//////////// GPIO_0, GPIO_0 connect to GPIO Default //////////
    --inout           [33:0]      gpio0,
    --input            [1:0]      gpio0_IN,

    --//////////// GPIO_1, GPIO_1 connect to GPIO Default //////////
    --inout           [33:0]      gpio1,
    --input            [1:0]      gpio1_IN


     );
end entity crypto_wallet_top;


architecture rtl of crypto_wallet_top is
--------------------------------
-- Components
--------------------------------
	component pll_sys
		PORT
		(
			inclk0	: IN STD_LOGIC;
			c0			: OUT STD_LOGIC;
			c1			: OUT STD_LOGIC 
		);
	end component;

	
	component crypto_wallet is
		port (
			buttons_pi_export : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			clk_clk           : in    std_logic                     := 'X';             -- clk
			epcs_dclk         : out   std_logic;                                        -- dclk
			epcs_sce          : out   std_logic;                                        -- sce
			epcs_sdo          : out   std_logic;                                        -- sdo
			epcs_data0        : in    std_logic                     := 'X';             -- data0
			led_po_export     : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n     : in    std_logic                     := 'X';             -- reset_n
			sdram_addr        : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba          : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n       : out   std_logic;                                        -- cas_n
			sdram_cke         : out   std_logic;                                        -- cke
			sdram_cs_n        : out   std_logic;                                        -- cs_n
			sdram_dq          : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm         : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n       : out   std_logic;                                        -- ras_n
			sdram_we_n        : out   std_logic;                                        -- we_n
			switch_pi_export  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			uart_0_rxd        : in    std_logic                     := 'X';             -- rxd
			uart_0_txd        : out   std_logic                                         -- txd
		);
	end component crypto_wallet;


--------------------------------
-- Signals
--------------------------------
	signal sl_clk_100MHz			: std_logic	:= '0';


	
begin

--------------------------------
-- Concurrent Logic
--------------------------------
	pll_inst : pll_sys
		port map(
			inclk0	=> CLOCK_50,
			c0			=> sl_clk_100MHz,
			c1			=> open
		);

		
		
	 wallet_cpu_inst : crypto_wallet
		port map (
			buttons_pi_export => KEY, --: in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			clk_clk           => sl_clk_100MHz, --: in    std_logic                     := 'X';             -- clk
			epcs_dclk         => EPCS_DCLK, --: out   std_logic;                                        -- dclk
			epcs_sce          => EPCS_NCSO, --: out   std_logic;                                        -- sce
			epcs_sdo          => EPCS_ASDO, --: out   std_logic;                                        -- sdo
			epcs_data0        => EPCS_DATA0, --: in    std_logic                     := 'X';             -- data0
			led_po_export     => LED, --: out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n     => open, --: in    std_logic                     := 'X';             -- reset_n
			sdram_addr        => DRAM_ADDR, --: out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba          => DRAM_BA, --: out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n       => DRAM_CAS_N, --: out   std_logic;                                        -- cas_n
			sdram_cke         => DRAM_CKE, --: out   std_logic;                                        -- cke
			sdram_cs_n        => DRAM_CS_N, --: out   std_logic;                                        -- cs_n
			sdram_dq          => DRAM_DQ, --: inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm         => DRAM_DQM, --: out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n       => DRAM_RAS_N, --: out   std_logic;                                        -- ras_n
			sdram_we_n        => DRAM_WE_N, --: out   std_logic;                                        -- we_n
			switch_pi_export  => SW, --: in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			uart_0_rxd        => open, --: in    std_logic                     := 'X';             -- rxd
			uart_0_txd        => open--: out   std_logic                                         -- txd
		);
--------------------------------
-- Processes
--------------------------------

end architecture rtl;