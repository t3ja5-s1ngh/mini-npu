module tb_PE;

    reg         clk;
    reg         rst;
    reg  [7:0]  weight_in;
    reg  [7:0]  act_in;

    wire [19:0] acc;
    wire [7:0]  weight_out;
    wire [7:0]  act_out;

    PE dut (
        .weight_in(weight_in),
        .act_in(act_in),
        .clk(clk),
        .rst(rst),
        .acc(acc),
        .weight_out(weight_out),
        .act_out(act_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1;
        weight_in = 0;
        act_in = 0;

        #12;
        rst = 0;

        @(posedge clk);
        weight_in <= 8'd2;
        act_in    <= 8'd3;

        @(posedge clk);
        weight_in <= 8'd4;
        act_in    <= 8'd5;

        @(posedge clk);
        weight_in <= 8'd6;
        act_in    <= 8'd7;

        @(posedge clk);
        weight_in <= 8'd8;
        act_in    <= 8'd9;

        @(posedge clk);
        weight_in <= 0;
        act_in    <= 0;

        repeat(5) @(posedge clk);

        $finish;
    end

    // Monitor signals
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(1,tb_PE);
    end

endmodule
