module tb_register;

reg clk;
reg rst;
reg [7:0] d;

wire [7:0] q;

register #(8) dut(
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

initial begin
    clk = 0;

    $dumpfile("wave.vcd");
    $dumpvars(0, tb_register);

    forever #5 clk = ~clk;
end

initial begin

    $monitor("t=%0t clk=%b rst=%b d=%b q=%b",
              $time, clk, rst, d, q);

    // Initial state
    rst = 0;
    d   = 8'b00000000;

    // Load first value
    #7;
    d = 8'b10101010;

    // Load second value
    #10;
    d = 8'b11110000;

    // Assert reset
    #10;
    rst = 1;

    // Change data while reset is active
    #10;
    d = 8'b11111111;

    // Release reset
    #10;
    rst = 0;

    // Load another value
    #10;
    d = 8'b00001111;

    #20;
    $finish;

end

endmodule
