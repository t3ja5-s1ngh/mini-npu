module ripple_adder (
input [7:0] a,
input [7:0] b,
input cin,
output [7:0] sum,
output cout
);

wire c1;
wire c2;
wire c3;
wire c4;
wire c5;
wire c6;
wire c7;

full_adder a1 (
.a(a[0]),
.b(b[0]),
.cin(cin),
.sum(sum[0]),
.cout(c1)
);

full_adder a2 (
.a(a[1]),
.b(b[1]),
.cin(c1),
.sum(sum[1]),
.cout(c2)
);

full_adder a3 (
.a(a[2]),
.b(b[2]),
.cin(c2),
.sum(sum[2]),
.cout(c3)
);

full_adder a4 (
.a(a[3]),
.b(b[3]),
.cin(c3),
.sum(sum[3]),
.cout(c4)
);

full_adder a5 (
.a(a[4]),
.b(b[4]),
.cin(c4),
.sum(sum[4]),
.cout(c5)
);

full_adder a6 (
.a(a[5]),
.b(b[5]),
.cin(c5),
.sum(sum[5]),
.cout(c6)
);

full_adder a7 (
.a(a[6]),
.b(b[6]),
.cin(c6),
.sum(sum[6]),
.cout(c7)
);

full_adder a8 (
.a(a[7]),
.b(b[7]),
.cin(c7),
.sum(sum[7]),
.cout(cout)
);

endmodule
