module tb_full_adder ;

reg a;
reg b;
reg cin;
wire sum;
wire cout;

integer i;

full_adder dut (
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout)
);

initial begin 
$dumpfile("wave.vcd");
$dumpvars(1,tb_full_adder);

for (i = 0; i < 8; i = i + 1) begin
{cin, a, b } = i;
#10;
end

$finish;

end

endmodule

