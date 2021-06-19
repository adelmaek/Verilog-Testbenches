//VHDL_overview, Example: 13, page 36.

module half_adder(
    input wire a,
    input wire b,
    output wire s,
    output wire c);

assign s = a ^ b;
assign c = a & b;

endmodule


`timescale 1ns/10ps

module half_adder_tb();

reg a, b;
wire s, c;

half_adder UUT (.a(a), .b(b), .c(c), .s(s));

initial 
begin
    $timeformat(-9,2, "ns");
    $monitor ("[%0t] a=%0b b=%0b s=%0b c=%0b", $time, a, b, s, c);
    
    a = 0;
    b = 0;
    #10;

    a = 0;
    b = 1;

    #10;

    a = 1;
    b = 0;

    #10;

    a = 1;
    b = 1;

    #10;

end
endmodule