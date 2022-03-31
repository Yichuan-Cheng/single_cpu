`timescale 1ns / 1ps
module Ext16_32(
        input [15:0]inst,
        input extop,
        output [31:0]imm32
    );
//    reg[31:0] immext32;
    assign imm32=(extop==0)?{16'b0,inst[15:0]}:{inst[15]? 16'hffff:16'h0 ,inst[15:0]};

//    always@(*)
//        if(extop==0)
//            immext32={16'b0,inst[15:0]};
//        else
//            immext32={inst[15]? 16'hffff:16'h0 ,inst[15:0]};
endmodule
