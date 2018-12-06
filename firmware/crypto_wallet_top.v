
module crypto_wallet_top(
	CLOCK_50,
	LED,
	SDRAM_CLK,
	SDRAM_ADDR,
	SDRAM_BA,
	SDRAM_CAS_N,
	SDRAM_CKE,
	SDRAM_CS_N,
	SDRAM_DQ,
	SDRAM_DQM,
	SDRAM_RAS_N,
	SDRAM_WE_N
);

	// Inputs
	input					CLOCK_50;
	
	// Inouts
	inout		[15:0]	SDRAM_DQ;
	
	
	// Outputs
	output	[7:0] 	LED;
	output				SDRAM_CLK;
	output	[12:0]	SDRAM_ADDR;
	output	[1:0]		SDRAM_BA;
	output				SDRAM_CAS_N;
	output				SDRAM_CKE;
	output				SDRAM_CS_N;
	output	[1:0]		SDRAM_DQM;
	output				SDRAM_RAS_N;
	output				SDRAM_WE_N;
	
	// Regs
	
	
	// Wires
	wire					CLOCK_SDRAM;
	
	
	// Nios qsys
	crypto_sdram_pll	crypto_sdram_pll_inst (
		.inclk0 ( CLOCK_50 ),
		.c0 ( CLOCK_SDRAM )
		);

	
	nios_wallet u0 (
		.clk_clk                           (CLOCK_50),			//                        clk.clk
		.reset_reset_n                     (1'b1),				//                      reset.reset_n
		.po_led_external_connection_export (LED),  				// po_led_external_connection.export
		.sdram_wire_addr                   (SDRAM_ADDR),		//                 sdram_wire.addr
		.sdram_wire_ba                     (SDRAM_BA),			//                           .ba
		.sdram_wire_cas_n                  (SDRAM_CAS_N),		//                           .cas_n
		.sdram_wire_cke                    (SDRAM_CKE),			//                           .cke
		.sdram_wire_cs_n                   (SDRAM_CS_N),		//                           .cs_n
		.sdram_wire_dq                     (SDRAM_DQ),			//                           .dq
		.sdram_wire_dqm                    (SDRAM_DQM),			//                           .dqm
		.sdram_wire_ras_n                  (SDRAM_RAS_N),		//                           .ras_n
		.sdram_wire_we_n                   (SDRAM_WE_N)			//     
	);

endmodule