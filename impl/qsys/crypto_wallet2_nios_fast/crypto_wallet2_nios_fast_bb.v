
module crypto_wallet2_nios_fast (
	clk_clk,
	epcs_flash_controller_external_dclk,
	epcs_flash_controller_external_sce,
	epcs_flash_controller_external_sdo,
	epcs_flash_controller_external_data0,
	pi_random_external_connection_export,
	po_led_external_connection_export,
	po_random_seed_external_connection_export,
	po_system_control_external_connection_export,
	reset_reset_n,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	uart_external_connection_rxd,
	uart_external_connection_txd);	

	input		clk_clk;
	output		epcs_flash_controller_external_dclk;
	output		epcs_flash_controller_external_sce;
	output		epcs_flash_controller_external_sdo;
	input		epcs_flash_controller_external_data0;
	input	[7:0]	pi_random_external_connection_export;
	output	[7:0]	po_led_external_connection_export;
	output	[31:0]	po_random_seed_external_connection_export;
	output	[7:0]	po_system_control_external_connection_export;
	input		reset_reset_n;
	output	[12:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		uart_external_connection_rxd;
	output		uart_external_connection_txd;
endmodule
