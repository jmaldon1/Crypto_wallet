module random (
    
    // Inputs
    input                       i_clk,
    input                       i_reset_n,

    input               [31:0]  i_seed,

    // Outputs
    output              [7:0]  o_data
);

    /******** Parameter declarations ********/

    /******** Reg declarations ********/
    reg                 [31:0]  r_data;
    wire                        w_xnor;


    /******** Conccurrent logic ********/
    assign o_data = r_data[7:0];

    assign w_xnor = (r_data[31] ^ ~r_data[29] ^ ~r_data[25] ^ ~r_data[24]);

    /******** Process ********/
    always @(posedge i_clk) begin
        if (i_reset_n == 1'b0) begin
            r_data <= i_seed;
        end

        else begin
            r_data <= {r_data[30:0], w_xnor};
        end
    end


endmodule