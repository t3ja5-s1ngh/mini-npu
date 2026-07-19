module dlatch (
input d,
input clk,
output q,
output q_n
);

wire d_n, a1, a2;

not (d_n,d);
nand (a1,d,clk);
nand (a2,d_n,clk);
nand (q,a1,q_n);
nand (q_n,a2,q);

endmodule


module dff (
input d,
input clk,
output q,
output q_n
);

wire clk_n;
wire q1,q2;

not (clk_n,clk);

dlatch master (
.d(d),
.clk(clk_n),
.q(q1),
.q_n(q2)
);

dlatch slave (
.d(q1),
.clk(clk),
.q(q),
.q_n(q_n)
);

endmodule


