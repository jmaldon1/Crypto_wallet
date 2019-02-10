	component crypto_wallet2_nios is
		port (
			clk_clk                                      : in    std_logic                     := 'X';             -- clk
			epcs_flash_controller_external_dclk          : out   std_logic;                                        -- dclk
			epcs_flash_controller_external_sce           : out   std_logic;                                        -- sce
			epcs_flash_controller_external_sdo           : out   std_logic;                                        -- sdo
			epcs_flash_controller_external_data0         : in    std_logic                     := 'X';             -- data0
			po_led_external_connection_export            : out   std_logic_vector(7 downto 0);                     -- export
			reset_reset_n                                : in    std_logic                     := 'X';             -- reset_n
			sdram_wire_addr                              : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                                : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                             : out   std_logic;                                        -- cas_n
			sdram_wire_cke                               : out   std_logic;                                        -- cke
			sdram_wire_cs_n                              : out   std_logic;                                        -- cs_n
			sdram_wire_dq                                : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                               : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                             : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                              : out   std_logic;                                        -- we_n
			uart_external_connection_rxd                 : in    std_logic                     := 'X';             -- rxd
			uart_external_connection_txd                 : out   std_logic;                                        -- txd
			pi_random_external_connection_export         : in    std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			po_system_control_external_connection_export : out   std_logic_vector(7 downto 0);                     -- export
			po_random_seed_external_connection_export    : out   std_logic_vector(31 downto 0)                     -- export
		);
	end component crypto_wallet2_nios;

	u0 : component crypto_wallet2_nios
		port map (
			clk_clk                                      => CONNECTED_TO_clk_clk,                                      --                                   clk.clk
			epcs_flash_controller_external_dclk          => CONNECTED_TO_epcs_flash_controller_external_dclk,          --        epcs_flash_controller_external.dclk
			epcs_flash_controller_external_sce           => CONNECTED_TO_epcs_flash_controller_external_sce,           --                                      .sce
			epcs_flash_controller_external_sdo           => CONNECTED_TO_epcs_flash_controller_external_sdo,           --                                      .sdo
			epcs_flash_controller_external_data0         => CONNECTED_TO_epcs_flash_controller_external_data0,         --                                      .data0
			po_led_external_connection_export            => CONNECTED_TO_po_led_external_connection_export,            --            po_led_external_connection.export
			reset_reset_n                                => CONNECTED_TO_reset_reset_n,                                --                                 reset.reset_n
			sdram_wire_addr                              => CONNECTED_TO_sdram_wire_addr,                              --                            sdram_wire.addr
			sdram_wire_ba                                => CONNECTED_TO_sdram_wire_ba,                                --                                      .ba
			sdram_wire_cas_n                             => CONNECTED_TO_sdram_wire_cas_n,                             --                                      .cas_n
			sdram_wire_cke                               => CONNECTED_TO_sdram_wire_cke,                               --                                      .cke
			sdram_wire_cs_n                              => CONNECTED_TO_sdram_wire_cs_n,                              --                                      .cs_n
			sdram_wire_dq                                => CONNECTED_TO_sdram_wire_dq,                                --                                      .dq
			sdram_wire_dqm                               => CONNECTED_TO_sdram_wire_dqm,                               --                                      .dqm
			sdram_wire_ras_n                             => CONNECTED_TO_sdram_wire_ras_n,                             --                                      .ras_n
			sdram_wire_we_n                              => CONNECTED_TO_sdram_wire_we_n,                              --                                      .we_n
			uart_external_connection_rxd                 => CONNECTED_TO_uart_external_connection_rxd,                 --              uart_external_connection.rxd
			uart_external_connection_txd                 => CONNECTED_TO_uart_external_connection_txd,                 --                                      .txd
			pi_random_external_connection_export         => CONNECTED_TO_pi_random_external_connection_export,         --         pi_random_external_connection.export
			po_system_control_external_connection_export => CONNECTED_TO_po_system_control_external_connection_export, -- po_system_control_external_connection.export
			po_random_seed_external_connection_export    => CONNECTED_TO_po_random_seed_external_connection_export     --    po_random_seed_external_connection.export
		);

