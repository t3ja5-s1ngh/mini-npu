module ripple_adder #(
    parameter width = 8 )(
    input [width-1:0] a,
    input [width-1:0] b,
    input cin,
    output [width-1:0] sum,
    output cout
);

wire [width:0] carry;
assign carry[0]=cin;

genvar i;

generate
for(i=0;i<width;i=i+1)
begin 
full_adder add (
    .cin(carry[i]),
    .a(a[i]),
    .b(b[i]),
    .sum(sum[i]),
    .cout(carry[i+1])
);
end
endgenerate

assign cout = carry[width];

endmodule
