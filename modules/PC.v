`timescale 1ns / 1ps
module PC(addr,next_pc,clock,reset);
    output[31:0]addr;
    input [31:0]next_pc;
    input clock,reset;
    reg[31:0] pc;
    assign addr=pc;
    always@(posedge clock)
    begin
        pc=reset? 0:next_pc;
    end
    initial
        pc=0;

endmodule
