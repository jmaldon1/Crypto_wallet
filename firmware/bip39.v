module bip39 (
    input                       i_clk,
    input                       i_reset_n,
    input               [31:0]  i_random_seed

//    input               [31:0]  i_entropy;
);

    wire                [7:0]  w_random;

    wire                [13:0]  w_rd_addr;
    wire                        w_rd_en;
    wire                [7:0]   w_q_data;


    random random_inst0 (
        .i_clk          (i_clk),
        .i_reset_n      (i_reset_n),
        .i_seed         (),
        .o_data         (w_random)
    );


    bip39_table bip39_table_inst (
        .address        (w_rd_addr),
        .clock          (i_clk),
        .rden           (w_rd_en),
        .q              (w_q_data)
    );


//    sha256_transform #(.LOOP(LOOP)) sha256_inst (
//        .clk        (CLOCK_50),
//        .feedback   (1'b0),
//        .cnt        (6'd0),
//        .rx_state   (255'd0),
//        .rx_input   (data),
//        .tx_hash    (hash)
//    );

endmodule