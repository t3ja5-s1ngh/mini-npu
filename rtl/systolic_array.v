module systolic_array (
    input clk,
    input rst,

    input [7:0] a0,
    input [7:0] a1,
    input [7:0] a2,
    input [7:0] w0,
    input [7:0] w1,
    input [7:0] w2,

    output [19:0] c00,
    output [19:0] c01,
    output [19:0] c02,
    output [19:0] c10,
    output [19:0] c11,
    output [19:0] c12,
    output [19:0] c20,
    output [19:0] c21,
    output [19:0] c22
);

wire [7:0] w00_01,w01_02,w10_11,w11_12,w20_21,w21_22;
wire [7:0] w00_10,w10_20,w01_11,w11_21,w02_12,w12_22;

PE pe00 (
.clk(clk),
.rst(rst),
.weight_in(w0),
.act_in(a0),
.weight_out(w00_10),
.act_out(w00_01),
.acc(c00)
);

PE pe01 (
.clk(clk),
.rst(rst),
.weight_in(w1),
.act_in(w00_01),
.weight_out(w01_11),
.act_out(w01_02),
.acc(c01)
);

PE pe02 (
.clk(clk),
.rst(rst),
.weight_in(w2),
.act_in(w01_02),
.weight_out(w02_12),
.acc(c02)
);

PE pe10 (
.clk(clk),
.rst(rst),
.weight_in(w00_10),
.act_in(a1),
.weight_out(w10_20),
.act_out(w10_11),
.acc(c10)
);

PE pe11 (
.clk(clk),
.rst(rst),
.weight_in(w01_11),
.act_in(w10_11),
.weight_out(w11_21),
.act_out(w11_12),
.acc(c11)
);

PE pe12 (
.clk(clk),
.rst(rst),
.weight_in(w02_12),
.act_in(w11_12),
.weight_out(w12_22),
.acc(c12)
);

PE pe20 (
.clk(clk),
.rst(rst),
.weight_in(w10_20),
.act_in(a2),
.act_out(w20_21),
.acc(c20)
);

PE pe21 (
.clk(clk),
.rst(rst),
.weight_in(w11_21),
.act_in(w20_21),
.act_out(w21_22),
.acc(c21)
);

PE pe22 (
.clk(clk),
.rst(rst),
.weight_in(w12_22),
.act_in(w21_22),
.acc(c22)
);

endmodule
