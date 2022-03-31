`timescale 1ns / 1ps
module Counter(
input clock,
output reg[9:0] sums

    );
    initial sums<=0;
    always@(posedge clock)
    sums=sums+1;
endmodule
