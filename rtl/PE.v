module PE (
    input [7:0] weight_in,
    input [7:0] act_in,
    input clk,
    input rst,
    output [19:0] acc,
    output [7:0] weight_out,
    output [7:0] act_out
);

register #(.width(8)) weights (
    .clk(clk),
    .rst(rst),
    .d(weight_in),
    .q(weight_out)
);

register #(.width(8)) activations (
    .clk(clk),
    .rst(rst),
    .d(act_in),
    .q(act_out)
);

MAC core (
    .clk(clk),
    .rst(rst),
    .a(weight_in),
    .b(act_in),
    .acc(acc)
);

endmodule

