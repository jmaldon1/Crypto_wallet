module crypto_wallet2_top (
    /********* Clock ********/
    input                       CLOCK_50,

    /********* EPCS ********/
//    input               EPCS_DATA0,
//    output              EPCS_ASDO,
//    output              EPCS_DCLK,
//    output              EPCS_NCSO,

    /********* SDRAM ********/
    output              [12:0]  DRAM_ADDR,
    output               [1:0]  DRAM_BA,
    output                      DRAM_CAS_N,
    output                      DRAM_CKE,
    output                      DRAM_CLK,
    output                      DRAM_CS_N,
    inout               [15:0]  DRAM_DQ,
    output               [1:0]  DRAM_DQM,
    output                      DRAM_RAS_N,
    output                      DRAM_WE_N,

    /********* LEDs ********/
    output              [7:0]   LED,

    /********* UART USB ********/
    input                       UART_RX,
    output                      UART_TX
);



/********************************/
/*  REG/WIRE Declaration        */
/********************************/
    // reset
    wire                        w_reset_n;

    // system control from nios
    wire                [7:0]   w_system_control;


    // random number
    wire                [7:0]   w_random;
    wire                [31:0]  w_random_seed;


/********************************/
/*  Concurrent                  */
/********************************/
    assign w_reset_n = !(w_system_control[0]);

	 

/********************************/
/*  Components                  */
/********************************/
    
    /* sdram pll */
    sdram_pll sdram_pll_inst (
        .inclk0     (CLOCK_50),
        .c0         (DRAM_CLK)
    );

	 

    /* nios qsys */
    crypto_wallet2_nios_fast u0 (
        .clk_clk                                        (CLOCK_50),             //                                     clk.clk
        .epcs_flash_controller_external_dclk            (),                     //          epcs_flash_controller_external.dclk
        .epcs_flash_controller_external_sce             (),                     //                                        .sce
        .epcs_flash_controller_external_sdo             (),                     //                                        .sdo
        .epcs_flash_controller_external_data0           (),                     //                                        .data0
        .reset_reset_n                                  (1'b1),                 //                                   reset.reset_n
        .sdram_wire_addr                                (DRAM_ADDR),            //                              sdram_wire.addr
        .sdram_wire_ba                                  (DRAM_BA),              //                                        .ba
        .sdram_wire_cas_n                               (DRAM_CAS_N),           //                                        .cas_n
        .sdram_wire_cke                                 (DRAM_CKE),             //                                        .cke
        .sdram_wire_cs_n                                (DRAM_CS_N),            //                                        .cs_n
        .sdram_wire_dq                                  (DRAM_DQ),              //                                        .dq
        .sdram_wire_dqm                                 (DRAM_DQM),             //                                        .dqm
        .sdram_wire_ras_n                               (DRAM_RAS_N),           //                                        .ras_n
        .sdram_wire_we_n                                (DRAM_WE_N),            //                                        .we_n
        .uart_external_connection_rxd                   (UART_RX),              //                uart_external_connection.rxd
        .uart_external_connection_txd                   (UART_TX),              //                                        .txd
        .pi_random_external_connection_export           (w_random),             //           pi_random_external_connection.export
        .po_random_seed_external_connection_export      (w_random_seed),        //      po_random_seed_external_connection.export
        .po_led_external_connection_export              (LED),                  //              po_led_external_connection.export
        .po_system_control_external_connection_export   (w_system_control)      //   po_system_control_external_connection.export
    );


    /* 8 bit random number generator */
    random random_inst0 (
        .i_clk          (CLOCK_50),
        .i_reset_n      (w_reset_n),
        .i_seed         (w_random_seed),
        .o_data         (w_random)
    );

	 
	// bip39 bip39_inst0(
 //        .i_clk          (CLOCK_50),
 //        .i_reset_n      (w_reset_n)
	// );


endmodule