module tb_register;

reg clk;
reg [7:0] d;
wire [7:0] q;

register #(8) dut (
    .clk(clk),
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
    d = 8'b00000000;

    #10;
    d = 8'b10101010;

    #10;
    d = 8'b11110000;

    #10;
    d = 8'b00001111;

    #10;
    d = 8'b11111111;

    #10;
    $finish;
end

endmodule
