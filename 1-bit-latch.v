module latch(
    input wire d,
    input wire clk,
    output reg q,
    output reg nq
);

always @(d, clk)
begin
    if(clk || ~clk)
    begin
        q <= d;
        nq <= ~d;
    end
end

endmodule 

`timescale 1ns/10ps

module latch_tb;

reg clk, d;
wire  out, nout;

latch UUT(.d(d), .clk(clk), .q(out), .nq(nout));

initial 
begin
    $timeformat(-9,2, "ns");
    $monitor ("[%0t] clk = %0b  d=%0b q=%0b nq=%0b", $time, clk, d, out, nout);
    
    d <= 0; clk <= 0; #5;

    d <= 1; #5;
 
    clk <= 1; #5

    d <= 0; #5;

    clk <= 0; #10;
end

always @(out, nout) 
begin
    if(clk != 1'b1)
    begin
        $timeformat(-9,2, "ns");
        $display("Data acquisition at low clk at time = %0t", $time);
    end      
end

always @(d) 
begin
    #1
    if(clk)
        if(out != d || nout != ~d)
        begin
            $timeformat(-9,2, "ns");
            $display("q stuck at 0 Or nq stuck at 1 at time %0t", $time);
        end
end



endmodule
