
module mux(
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    input wire [1:0] s,
    output reg z
);

always@(a, b, c, d, s)
begin
    if(s == 2'b00)
        z <= a;
    else if(s == 2'b01)
        z<= b;
    else if(s == 2'b10)
        z<= c;
    else if(s == 2'b11)
        z <= d;
end
endmodule

`timescale 1ns/10ps
module mux_tb();

reg a, b, c, d;
reg [1:0]s;
wire z;

mux UUT(.a(a), .b(b), .c(c), .d(d), .s(s), .z(z));

initial 
begin
$timeformat(-9,2, "ns");
$monitor ("[%0t] s = %0b  a=%0b b=%0b c=%0b d=%0b ==> z=%0b", $time, s, a, b, c, d, z);

a <= 1'b1;
b <= 1'b0;
c <= 1'b0;
d <= 1'b0;

s <= 2'b00;

#10;

a <= 1'b0;
b <= 1'b1;
c <= 1'b1;
d <= 1'b1;

#10;

a <= 1'b0;
b <= 1'b1;
c <= 1'b0;
d <= 1'b0;

s <= 2'b01;

#10;

a <= 1'b1;
b <= 1'b0;
c <= 1'b1;
d <= 1'b1;

#10;


a <= 1'b0;
b <= 1'b0;
c <= 1'b1;
d <= 1'b0;

s <= 2'b10;

#10;

a <= 1'b1;
b <= 1'b1;
c <= 1'b0;
d <= 1'b1;

#10;


a <= 1'b0;
b <= 1'b0;
c <= 1'b0;
d <= 1'b1;

s <= 2'b11;

#10;

a <= 1'b1;
b <= 1'b1;
c <= 1'b1;
d <= 1'b0;

#10;


end

endmodule