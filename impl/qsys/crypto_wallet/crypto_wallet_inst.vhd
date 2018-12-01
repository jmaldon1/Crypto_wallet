	component crypto_wallet is
		port (
			clk_clk                                     : in    std_logic                     := 'X';             -- clk
			epcs_flash_controller_dclk                  : out   std_logic;                                        -- dclk
			epcs_flash_controller_sce                   : out   std_logic;                                        -- sce
			epcs_flash_controller_sdo                   : out   std_logic;                                        -- sdo
			epcs_flash_controller_data0                 : in    std_logic                     := 'X';             -- data0
			pi_gpio0_external_connection_export         : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pi_gpio1_external_connection_export         : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pi_gpio2_external_connection_export         : in    std_logic_vector(2 downto 0)  := (others => 'X'); -- export
			pi_key_external_connection_export           : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pi_sw_external_connection_export            : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			pio_gpio0_33to32_external_connection_export : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pio_gpio0_external_connection_export        : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_gpio1_33to32_external_connection_export : inout std_logic_vector(1 downto 0)  := (others => 'X'); -- export
			pio_gpio1_external_connection_export        : inout std_logic_vector(31 downto 0) := (others => 'X'); -- export
			pio_gpio2_external_connection_export        : inout std_logic_vector(12 downto 0) := (others => 'X'); -- export
			po_led_external_connection_export           : out   std_logic_vector(7 downto 0);                     -- export
			reset_n_reset_n                             : in    std_logic                     := 'X';             -- reset_n
			sdram_addr                                  : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_ba                                    : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_cas_n                                 : out   std_logic;                                        -- cas_n
			sdram_cke                                   : out   std_logic;                                        -- cke
			sdram_cs_n                                  : out   std_logic;                                        -- cs_n
			sdram_dq                                    : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_dqm                                   : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_ras_n                                 : out   std_logic;                                        -- ras_n
			sdram_we_n                                  : out   std_logic                                         -- we_n
		);
	end component crypto_wallet;

	u0 : component crypto_wallet
		port map (
			clk_clk                                     => CONNECTED_TO_clk_clk,                                     --                                  clk.clk
			epcs_flash_controller_dclk                  => CONNECTED_TO_epcs_flash_controller_dclk,                  --                epcs_flash_controller.dclk
			epcs_flash_controller_sce                   => CONNECTED_TO_epcs_flash_controller_sce,                   --                                     .sce
			epcs_flash_controller_sdo                   => CONNECTED_TO_epcs_flash_controller_sdo,                   --                                     .sdo
			epcs_flash_controller_data0                 => CONNECTED_TO_epcs_flash_controller_data0,                 --                                     .data0
			pi_gpio0_external_connection_export         => CONNECTED_TO_pi_gpio0_external_connection_export,         --         pi_gpio0_external_connection.export
			pi_gpio1_external_connection_export         => CONNECTED_TO_pi_gpio1_external_connection_export,         --         pi_gpio1_external_connection.export
			pi_gpio2_external_connection_export         => CONNECTED_TO_pi_gpio2_external_connection_export,         --         pi_gpio2_external_connection.export
			pi_key_external_connection_export           => CONNECTED_TO_pi_key_external_connection_export,           --           pi_key_external_connection.export
			pi_sw_external_connection_export            => CONNECTED_TO_pi_sw_external_connection_export,            --            pi_sw_external_connection.export
			pio_gpio0_33to32_external_connection_export => CONNECTED_TO_pio_gpio0_33to32_external_connection_export, -- pio_gpio0_33to32_external_connection.export
			pio_gpio0_external_connection_export        => CONNECTED_TO_pio_gpio0_external_connection_export,        --        pio_gpio0_external_connection.export
			pio_gpio1_33to32_external_connection_export => CONNECTED_TO_pio_gpio1_33to32_external_connection_export, -- pio_gpio1_33to32_external_connection.export
			pio_gpio1_external_connection_export        => CONNECTED_TO_pio_gpio1_external_connection_export,        --        pio_gpio1_external_connection.export
			pio_gpio2_external_connection_export        => CONNECTED_TO_pio_gpio2_external_connection_export,        --        pio_gpio2_external_connection.export
			po_led_external_connection_export           => CONNECTED_TO_po_led_external_connection_export,           --           po_led_external_connection.export
			reset_n_reset_n                             => CONNECTED_TO_reset_n_reset_n,                             --                              reset_n.reset_n
			sdram_addr                                  => CONNECTED_TO_sdram_addr,                                  --                                sdram.addr
			sdram_ba                                    => CONNECTED_TO_sdram_ba,                                    --                                     .ba
			sdram_cas_n                                 => CONNECTED_TO_sdram_cas_n,                                 --                                     .cas_n
			sdram_cke                                   => CONNECTED_TO_sdram_cke,                                   --                                     .cke
			sdram_cs_n                                  => CONNECTED_TO_sdram_cs_n,                                  --                                     .cs_n
			sdram_dq                                    => CONNECTED_TO_sdram_dq,                                    --                                     .dq
			sdram_dqm                                   => CONNECTED_TO_sdram_dqm,                                   --                                     .dqm
			sdram_ras_n                                 => CONNECTED_TO_sdram_ras_n,                                 --                                     .ras_n
			sdram_we_n                                  => CONNECTED_TO_sdram_we_n                                   --                                     .we_n
		);

