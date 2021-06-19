//VHDL_combinational_modelling , Example: 7, page 11
module full_adder (
    input wire a,
    input wire b,
    input wire c_in,
    output reg s,
    output reg c_out
);

wire [3:0] in;
    always@(a, b , c_in)
    begin
        case({a, b, c_in})
            3'b 000: {s, c_out} = 2'b00; 
            3'b 001: {s, c_out} = 2'b10; 
            3'b 010: {s, c_out} = 2'b10; 
            3'b 011: {s, c_out} = 2'b01; 
            3'b 100: {s, c_out} = 2'b10; 
            3'b 101: {s, c_out} = 2'b01; 
            3'b 110: {s, c_out} = 2'b01; 
            3'b 111: {s, c_out} = 2'b11; 
        endcase
    end
endmodule

`timescale 1ns/10ps

module full_adder_tb();

reg a, b, c_in;
wire s, c_out;

full_adder UUT (.a(a), .b(b), .c_in(c_in), .s(s), .c_out(c_out));

initial 
begin
    $timeformat(-9,2, "ns");
    $monitor ("[%0t] a=%0b b=%0b c_in=%0b s=%0b c_out=%0b", $time, a, b, c_in, s, c_out);
    
    a = 0;
    b = 0;
    c_in = 0;
    #10;

    a = 0;
    b = 0;
    c_in = 1;
    #10;

    a = 0;
    b = 1;
    c_in = 0;
    #10;

    a = 0;
    b = 1;
    c_in = 1;
    #10;

    a = 1;
    b = 0;
    c_in = 0;
    #10;

    a = 1;
    b = 0;
    c_in = 1;
    #10;

    a = 1;
    b = 1;
    c_in = 0;
    #10;

    a = 1;
    b = 1;
    c_in = 1;
    #10;
end
endmodule