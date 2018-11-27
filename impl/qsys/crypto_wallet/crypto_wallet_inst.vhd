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

	u0 : component crypto_wallet
		port map (
			buttons_pi_export => CONNECTED_TO_buttons_pi_export, -- buttons_pi.export
			clk_clk           => CONNECTED_TO_clk_clk,           --        clk.clk
			epcs_dclk         => CONNECTED_TO_epcs_dclk,         --       epcs.dclk
			epcs_sce          => CONNECTED_TO_epcs_sce,          --           .sce
			epcs_sdo          => CONNECTED_TO_epcs_sdo,          --           .sdo
			epcs_data0        => CONNECTED_TO_epcs_data0,        --           .data0
			led_po_export     => CONNECTED_TO_led_po_export,     --     led_po.export
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --      reset.reset_n
			sdram_addr        => CONNECTED_TO_sdram_addr,        --      sdram.addr
			sdram_ba          => CONNECTED_TO_sdram_ba,          --           .ba
			sdram_cas_n       => CONNECTED_TO_sdram_cas_n,       --           .cas_n
			sdram_cke         => CONNECTED_TO_sdram_cke,         --           .cke
			sdram_cs_n        => CONNECTED_TO_sdram_cs_n,        --           .cs_n
			sdram_dq          => CONNECTED_TO_sdram_dq,          --           .dq
			sdram_dqm         => CONNECTED_TO_sdram_dqm,         --           .dqm
			sdram_ras_n       => CONNECTED_TO_sdram_ras_n,       --           .ras_n
			sdram_we_n        => CONNECTED_TO_sdram_we_n,        --           .we_n
			switch_pi_export  => CONNECTED_TO_switch_pi_export,  --  switch_pi.export
			uart_0_rxd        => CONNECTED_TO_uart_0_rxd,        --     uart_0.rxd
			uart_0_txd        => CONNECTED_TO_uart_0_txd         --           .txd
		);

