module rs_ff(
    input wire r,
    input wire s,
    input wire clk,
    output reg q
);

always@(posedge clk)
begin
    if(r == 1'b0 && s == 1'b1)
        q <= 1;
    else if(r == 1'b1 && s == 1'b0)
        q <= 0;
    else if(r ==1'b0 && s == 1'b0)
        q <= q;
    else
        q <= 1'bx;
end
endmodule


`timescale 1ns/10ps

module rs_ff_tb();

reg clk, r, s;
wire q;

rs_ff UUT(.clk(clk), .r(r), .s(s), .q(q));

always
begin
    #10;
    clk = ~clk;
end

initial 
begin
    $timeformat(-9,2, "ns");
    $monitor ("[%0t] clk = %0b  s=%0b r=%0b q=%0b ", $time, clk, s, r, q);

    clk <= 0;
    s <= 1;
    r <= 0;
    #15;
    s <= 0;
    r <= 1;
    #20;
    s <= 0;
    r <= 0;
    #20;
    s <= 1;
    r <= 1;
    #20;

end

endmodule