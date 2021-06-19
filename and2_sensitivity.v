module and2 (input wire a, input wire b, output wire c);
assign c = a & b;
endmodule

`timescale 1ns/10ps

module and2_tb();

reg a, b;
wire c;

and2 UUT (.a(a), .b(b), .c(c));

initial 
begin
    $timeformat(-9,2, "ns");
    $monitor ("[%0t] a=%0b b=%0b c=%0b", $time, a, b, c);
    
    a = 0;
    b = 0;
    #10;

    a = 1;
    b = 0;

    #10;

    a = 1;
    b = 1;

    #10;

    a = 0;
    b = 1;

    #10;

end
endmodule