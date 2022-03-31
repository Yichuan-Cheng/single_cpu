`timescale 1ns / 1ps
module SLTU(input[31:0]a,b,
                output[31:0] c);
    assign c=(a<b)?32'h00000001:32'h00000000;
endmodule
