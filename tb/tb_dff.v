module tb_dff ;

reg clk,d;
wire q,q_bar;

initial begin 
d=0;
clk=0;
$dumpfile("wave.vcd");
$dumpvars(1,tb_dff);
forever #5 clk=~clk; 
end

dff dut (
.d(d),
.clk(clk),
.q(q),
.q_n(q_n)
);

initial begin
    d = 0;

    #7;
    d = 1;

    #10;
    d = 0;

    #10;
    d = 1;

    #10;
    d = 0;

    #20;
    $finish;
end

endmodule
