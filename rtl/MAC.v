module MAC (
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    output [19:0] acc
);

wire [15:0] prod;
wire [19:0] sum;
wire overflow;

multiplier mul (
    .a(a),
    .b(b),
    .p(prod)
);

register #(.width(20)) storage (
    .clk(clk),
    .rst(rst),
    .d(sum),
    .q(acc)
);

ripple_adder #(.width(20)) add (
    .a({4'b0000, prod}),
    .b(acc),
    .cin(1'b0),
    .sum(sum),
    .cout(overflow)
);

endmodule
