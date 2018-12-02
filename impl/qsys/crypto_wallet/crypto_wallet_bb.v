
module crypto_wallet (
	clk_clk,
	epcs_flash_controller_dclk,
	epcs_flash_controller_sce,
	epcs_flash_controller_sdo,
	epcs_flash_controller_data0,
	pi_gpio0_external_connection_export,
	pi_gpio1_external_connection_export,
	pi_gpio2_external_connection_export,
	pi_key_external_connection_export,
	pi_sw_external_connection_export,
	pio_gpio0_33to32_external_connection_export,
	pio_gpio0_external_connection_export,
	pio_gpio1_33to32_external_connection_export,
	pio_gpio1_external_connection_export,
	pio_gpio2_external_connection_export,
	po_led_external_connection_export,
	reset_n_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	pi_random_external_connection_export,
	reset_out_reset_n);	

	input		clk_clk;
	output		epcs_flash_controller_dclk;
	output		epcs_flash_controller_sce;
	output		epcs_flash_controller_sdo;
	input		epcs_flash_controller_data0;
	input	[1:0]	pi_gpio0_external_connection_export;
	input	[1:0]	pi_gpio1_external_connection_export;
	input	[2:0]	pi_gpio2_external_connection_export;
	input	[1:0]	pi_key_external_connection_export;
	input	[3:0]	pi_sw_external_connection_export;
	inout	[1:0]	pio_gpio0_33to32_external_connection_export;
	inout	[31:0]	pio_gpio0_external_connection_export;
	inout	[1:0]	pio_gpio1_33to32_external_connection_export;
	inout	[31:0]	pio_gpio1_external_connection_export;
	inout	[12:0]	pio_gpio2_external_connection_export;
	output	[7:0]	po_led_external_connection_export;
	input		reset_n_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	input	[31:0]	pi_random_external_connection_export;
	output		reset_out_reset_n;
endmodule
