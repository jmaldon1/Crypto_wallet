	component nios_wallet is
		port (
			clk_clk                           : in    std_logic                     := 'X';             -- clk
			reset_reset_n                     : in    std_logic                     := 'X';             -- reset_n
			po_led_external_connection_export : out   std_logic_vector(7 downto 0);                     -- export
			sdram_wire_addr                   : out   std_logic_vector(12 downto 0);                    -- addr
			sdram_wire_ba                     : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n                  : out   std_logic;                                        -- cas_n
			sdram_wire_cke                    : out   std_logic;                                        -- cke
			sdram_wire_cs_n                   : out   std_logic;                                        -- cs_n
			sdram_wire_dq                     : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm                    : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n                  : out   std_logic;                                        -- ras_n
			sdram_wire_we_n                   : out   std_logic                                         -- we_n
		);
	end component nios_wallet;

	u0 : component nios_wallet
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			po_led_external_connection_export => CONNECTED_TO_po_led_external_connection_export, -- po_led_external_connection.export
			sdram_wire_addr                   => CONNECTED_TO_sdram_wire_addr,                   --                 sdram_wire.addr
			sdram_wire_ba                     => CONNECTED_TO_sdram_wire_ba,                     --                           .ba
			sdram_wire_cas_n                  => CONNECTED_TO_sdram_wire_cas_n,                  --                           .cas_n
			sdram_wire_cke                    => CONNECTED_TO_sdram_wire_cke,                    --                           .cke
			sdram_wire_cs_n                   => CONNECTED_TO_sdram_wire_cs_n,                   --                           .cs_n
			sdram_wire_dq                     => CONNECTED_TO_sdram_wire_dq,                     --                           .dq
			sdram_wire_dqm                    => CONNECTED_TO_sdram_wire_dqm,                    --                           .dqm
			sdram_wire_ras_n                  => CONNECTED_TO_sdram_wire_ras_n,                  --                           .ras_n
			sdram_wire_we_n                   => CONNECTED_TO_sdram_wire_we_n                    --                           .we_n
		);

