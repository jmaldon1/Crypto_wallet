	crypto_wallet2_nios u0 (
		.clk_clk                                      (<connected-to-clk_clk>),                                      //                                   clk.clk
		.epcs_flash_controller_external_dclk          (<connected-to-epcs_flash_controller_external_dclk>),          //        epcs_flash_controller_external.dclk
		.epcs_flash_controller_external_sce           (<connected-to-epcs_flash_controller_external_sce>),           //                                      .sce
		.epcs_flash_controller_external_sdo           (<connected-to-epcs_flash_controller_external_sdo>),           //                                      .sdo
		.epcs_flash_controller_external_data0         (<connected-to-epcs_flash_controller_external_data0>),         //                                      .data0
		.po_led_external_connection_export            (<connected-to-po_led_external_connection_export>),            //            po_led_external_connection.export
		.reset_reset_n                                (<connected-to-reset_reset_n>),                                //                                 reset.reset_n
		.sdram_wire_addr                              (<connected-to-sdram_wire_addr>),                              //                            sdram_wire.addr
		.sdram_wire_ba                                (<connected-to-sdram_wire_ba>),                                //                                      .ba
		.sdram_wire_cas_n                             (<connected-to-sdram_wire_cas_n>),                             //                                      .cas_n
		.sdram_wire_cke                               (<connected-to-sdram_wire_cke>),                               //                                      .cke
		.sdram_wire_cs_n                              (<connected-to-sdram_wire_cs_n>),                              //                                      .cs_n
		.sdram_wire_dq                                (<connected-to-sdram_wire_dq>),                                //                                      .dq
		.sdram_wire_dqm                               (<connected-to-sdram_wire_dqm>),                               //                                      .dqm
		.sdram_wire_ras_n                             (<connected-to-sdram_wire_ras_n>),                             //                                      .ras_n
		.sdram_wire_we_n                              (<connected-to-sdram_wire_we_n>),                              //                                      .we_n
		.uart_external_connection_rxd                 (<connected-to-uart_external_connection_rxd>),                 //              uart_external_connection.rxd
		.uart_external_connection_txd                 (<connected-to-uart_external_connection_txd>),                 //                                      .txd
		.pi_random_external_connection_export         (<connected-to-pi_random_external_connection_export>),         //         pi_random_external_connection.export
		.po_system_control_external_connection_export (<connected-to-po_system_control_external_connection_export>), // po_system_control_external_connection.export
		.po_random_seed_external_connection_export    (<connected-to-po_random_seed_external_connection_export>)     //    po_random_seed_external_connection.export
	);

