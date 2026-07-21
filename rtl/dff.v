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
input rst,
output q,
output q_n
);

wire clk_n;
wire q1,q2;
wire rst1,rst2;

not (clk_n,clk);
not (rst1,rst);
and (rst2,d,rst1);

dlatch master (
.d(rst2),
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


