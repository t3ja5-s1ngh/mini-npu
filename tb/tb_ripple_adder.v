module tb_ripple_adder ;

initial begin 
$dumpfile("wave.vcd");
$dumpvars(1,tb_ripple_adder);
end

reg [7:0] a,b;
reg cin;
wire [7:0] sum;
wire cout;

ripple_adder dut (
.a(a),
.b(b),
.cin(cin),
.sum(sum),
.cout(cout)
);

integer i;

initial begin 

    a = 5;
    b = 3;
    cin = 0;
    #10;

    a = 255;
    b = 1;
    cin = 0;
    #10;

    a = 100;
    b = 50;
    cin = 0;
    #10;

    a = 7;
    b = 8;
    cin = 1;
    #10;

    $finish;
end

endmodule
