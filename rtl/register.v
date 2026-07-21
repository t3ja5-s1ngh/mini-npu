module register #(
    parameter width = 8 )(
    input clk,
    input [width-1:0] d,
    output [width-1:0] q
);

genvar i;

generate 
    for (i=0;i<width;i=i+1)
    begin 
        dff flipflop (
            .clk(clk),
            .d(d[i]),
            .q(q[i])
            );
    end
endgenerate

endmodule
