
`timescale 1ns / 1ps

module tb_sha256 (
    );

    localparam CLK_PER = 20;    // 50 MHz


    `ifdef CONFIG_LOOP_LOG2
        parameter LOOP_LOG2 = `CONFIG_LOOP_LOG2;
    `else
        parameter LOOP_LOG2 = 0;
    `endif

    // No need to adjust these parameters
    localparam [5:0] LOOP = (6'd1 << LOOP_LOG2);


    reg                         tb_clk;
    reg                         reset_n;

    reg                 [5:0]   cnt = 6'd0;
    reg                         feedback = 1'b0;
    reg                 [255:0] state = 0;
    reg                 [511:0] data = 0;

    wire                [255:0] hash;

    initial begin
        tb_clk = 1'b0;
        forever begin
            #(CLK_PER) tb_clk = ~tb_clk;
            #(CLK_PER) tb_clk = ~tb_clk;
        end
    end


    initial begin
        reset_n = 1'b0;
        #(25 * CLK_PER);
        reset_n = 1'b1;
    end


    initial begin
        #(1000 * CLK_PER);
        $stop;
    end


    sha256_transform #(.LOOP(LOOP)) uut (
        .clk        (tb_clk),
        .feedback   (feedback),
        .cnt        (cnt),
        .rx_state   (state),
        .rx_input   (data),
        .tx_hash    (hash)
    );

endmodule 