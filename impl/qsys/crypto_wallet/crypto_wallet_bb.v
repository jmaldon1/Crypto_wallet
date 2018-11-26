
module crypto_wallet (
	clk_clk,
	reset_reset_n,
	sdram_addr,
	sdram_ba,
	sdram_cas_n,
	sdram_cke,
	sdram_cs_n,
	sdram_dq,
	sdram_dqm,
	sdram_ras_n,
	sdram_we_n,
	epcs_dclk,
	epcs_sce,
	epcs_sdo,
	epcs_data0,
	uart_0_rxd,
	uart_0_txd,
	buttons_pi_export,
	switch_pi_export,
	led_po_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[12:0]	sdram_addr;
	output	[1:0]	sdram_ba;
	output		sdram_cas_n;
	output		sdram_cke;
	output		sdram_cs_n;
	inout	[15:0]	sdram_dq;
	output	[1:0]	sdram_dqm;
	output		sdram_ras_n;
	output		sdram_we_n;
	output		epcs_dclk;
	output		epcs_sce;
	output		epcs_sdo;
	input		epcs_data0;
	input		uart_0_rxd;
	output		uart_0_txd;
	input	[1:0]	buttons_pi_export;
	input	[3:0]	switch_pi_export;
	output	[7:0]	led_po_export;
endmodule
