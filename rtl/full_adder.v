module full_adder (
input a,
input b,
input cin,
output sum,
output cout
);

wire s1;
wire c1;
wire c2;

half_adder a1 (
.a(a),
.b(b),
.carry(c1),
.sum(s1)
);

half_adder a2 (
.a(cin),
.b(s1),
.sum(sum),
.carry(c2)
);

or (cout,c1,c2);

endmodule

