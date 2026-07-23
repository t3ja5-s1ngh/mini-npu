module tb_systolic_array;

reg clk;
reg rst;

reg [7:0] a0,a1,a2;
reg [7:0] b0,b1,b2;

wire [19:0] c00,c01,c02,c10,c11,c12,c20,c21,c22;

// Instantiate your DUT
systolic_array dut(
    .clk(clk),
    .rst(rst),

    .a0(a0),
    .a1(a1),
    .a2(a2),

    .w0(b0),
    .w1(b1),
    .w2(b2),

    .c00(c00),
    .c01(c01),
    .c02(c02),
    .c10(c10),
    .c11(c11),
    .c12(c12),
    .c20(c20),
    .c21(c21),
    .c22(c22)

    // connect outputs if desired
);

always #5 clk = ~clk;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(1,tb_systolic_array);

    clk = 0;
    rst = 1;

    a0 = 0; a1 = 0; a2 = 0;
    b0 = 0; b1 = 0; b2 = 0;

    #12;
    rst = 0;

    //---------------- Cycle 0 ----------------
    @(posedge clk);
    a0 <= 8'd1;      // a1
    a1 <= 0;
    a2 <= 0;

    b0 <= 8'd1;      // b1
    b1 <= 0;
    b2 <= 0;

    //---------------- Cycle 1 ----------------
    @(posedge clk);
    a0 <= 8'd2;      // a2
    a1 <= 8'd4;      // a4
    a2 <= 0;

    b0 <= 8'd2;      // b2
    b1 <= 8'd4;      // b4
    b2 <= 0;

    //---------------- Cycle 2 ----------------
    @(posedge clk);
    a0 <= 8'd3;      // a3
    a1 <= 8'd5;      // a5
    a2 <= 8'd7;      // a7

    b0 <= 8'd3;      // b3
    b1 <= 8'd5;      // b5
    b2 <= 8'd7;      // b7

    //---------------- Cycle 3 ----------------
    @(posedge clk);
    a0 <= 0;
    a1 <= 8'd6;      // a6
    a2 <= 8'd8;      // a8

    b0 <= 0;
    b1 <= 8'd6;      // b6
    b2 <= 8'd8;      // b8

    //---------------- Cycle 4 ----------------
    @(posedge clk);
    a0 <= 0;
    a1 <= 0;
    a2 <= 8'd9;      // a9

    b0 <= 0;
    b1 <= 0;
    b2 <= 8'd9;      // b9

    //---------------- Flush ----------------
    @(posedge clk);
    a0 <= 0; a1 <= 0; a2 <= 0;
    b0 <= 0; b1 <= 0; b2 <= 0;

    repeat(6) @(posedge clk);

    $finish;
end
endmodule
