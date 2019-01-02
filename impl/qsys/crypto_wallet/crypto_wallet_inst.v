	crypto_wallet u0 (
		.clk_clk                           (<connected-to-clk_clk>),                           //                        clk.clk
		.epcs_flash_controller_dclk        (<connected-to-epcs_flash_controller_dclk>),        //      epcs_flash_controller.dclk
		.epcs_flash_controller_sce         (<connected-to-epcs_flash_controller_sce>),         //                           .sce
		.epcs_flash_controller_sdo         (<connected-to-epcs_flash_controller_sdo>),         //                           .sdo
		.epcs_flash_controller_data0       (<connected-to-epcs_flash_controller_data0>),       //                           .data0
		.pi_key_external_connection_export (<connected-to-pi_key_external_connection_export>), // pi_key_external_connection.export
		.pi_sw_external_connection_export  (<connected-to-pi_sw_external_connection_export>),  //  pi_sw_external_connection.export
		.po_led_external_connection_export (<connected-to-po_led_external_connection_export>), // po_led_external_connection.export
		.reset_n_reset_n                   (<connected-to-reset_n_reset_n>),                   //                    reset_n.reset_n
		.sdram_addr                        (<connected-to-sdram_addr>),                        //                      sdram.addr
		.sdram_ba                          (<connected-to-sdram_ba>),                          //                           .ba
		.sdram_cas_n                       (<connected-to-sdram_cas_n>),                       //                           .cas_n
		.sdram_cke                         (<connected-to-sdram_cke>),                         //                           .cke
		.sdram_cs_n                        (<connected-to-sdram_cs_n>),                        //                           .cs_n
		.sdram_dq                          (<connected-to-sdram_dq>),                          //                           .dq
		.sdram_dqm                         (<connected-to-sdram_dqm>),                         //                           .dqm
		.sdram_ras_n                       (<connected-to-sdram_ras_n>),                       //                           .ras_n
		.sdram_we_n                        (<connected-to-sdram_we_n>)                         //                           .we_n
	);

