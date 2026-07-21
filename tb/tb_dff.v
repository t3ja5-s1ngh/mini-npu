module tb_dff;

reg d;
reg clk;
reg rst;

wire q;
wire q_n;

dff dut(
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .q_n(q_n)
);

initial begin
    clk = 0;

    $dumpfile("wave.vcd");
    $dumpvars(0, tb_dff);

    forever #5 clk = ~clk;
end

initial begin
    $monitor("t=%0t clk=%b rst=%b d=%b q=%b",
             $time, clk, rst, d, q);

    // Initial values
    d = 0;
    rst = 0;

    // Normal operation
    #7;
    d = 1;

    #10;
    d = 0;

    // Assert reset
    #10;
    rst = 1;

    // Change d while reset is active
    #10;
    d = 1;

    // Deassert reset
    #10;
    rst = 0;

    // Verify normal operation resumes
    #10;
    d = 1;

    #20;
    $finish;
end

endmodule
