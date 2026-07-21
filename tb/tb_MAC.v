module tb_MAC;

reg clk;
reg rst;
reg [7:0] a;
reg [7:0] b;

wire [19:0] acc;

MAC dut(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .acc(acc)
);

initial begin
    clk = 0;

    $dumpfile("wave.vcd");
    $dumpvars(0, tb_MAC);

    forever #5 clk = ~clk;
end

initial begin

    $monitor(
        "t=%0t rst=%b a=%d b=%d acc=%d",
        $time, rst, a, b, acc
    );

    // Reset accumulator
    rst = 1;
    a   = 0;
    b   = 0;

    #10;
    rst = 0;

    // 2 * 3 = 6 added every cycle
    a = 8'd2;
    b = 8'd3;

    #40;

    // Change operands
    a = 8'd4;
    b = 8'd5;

    #30;

    // Reset again
    rst = 1;

    #10;
    rst = 0;

    // New accumulation
    a = 8'd1;
    b = 8'd10;

    #30;

    $finish;

end

endmodule
