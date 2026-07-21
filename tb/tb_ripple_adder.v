module tb_ripple_adder;

reg  [7:0] a;
reg  [7:0] b;
reg        cin;

wire [7:0] sum;
wire       cout;

ripple_adder #(8) dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin

    $dumpfile("wave.vcd");
    $dumpvars(0, tb_ripple_adder);

    $monitor(
        "t=%0t a=%d b=%d cin=%b sum=%d cout=%b",
        $time, a, b, cin, sum, cout
    );

    a = 0;   b = 0;   cin = 0;
    #10;

    a = 5;   b = 3;   cin = 0;
    #10;

    a = 10;  b = 15;  cin = 0;
    #10;

    a = 255; b = 1;   cin = 0;
    #10;

    a = 255; b = 255; cin = 0;
    #10;

    a = 20;  b = 30;  cin = 1;
    #10;

    $finish;
end

endmodule
