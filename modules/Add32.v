`timescale 1ns / 1ps
module Add32(a,b,c);
    input [31:0] a,b;
    output[31:0] c;
    assign c=a+b;


endmodule
