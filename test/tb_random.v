
`timescale 1ns / 1ns

module tb_random (
    );

    localparam CLK_PER = 20;    // 50 MHz

    reg                         tb_clk;
    reg                         reset_n;

    reg                 [31:0]  tb_seed;

    wire                [7:0]  data;


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
        tb_seed = 64'h12345678abcdef01;

        #(1000 * CLK_PER);
        $stop;
    end

    random dut (
        .i_clk              (tb_clk),
        .i_reset_n          (reset_n),
        .i_seed             (tb_seed),

        .o_data             (data)
        );

endmodule 