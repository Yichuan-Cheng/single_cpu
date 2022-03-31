`timescale 1ns / 1ps
module ALU(a,b,aluctr,result,zero,overflow);
    input [31:0]a,b;
    input[2:0]aluctr;
    output[31:0]result;
    output zero,overflow;
    wire i_sub=aluctr[2];
    wire i_stl=aluctr[2]&aluctr[1]&aluctr[0];
    wire i_stlu=aluctr[2]&aluctr[1]&~aluctr[0];
    wire[1:0]i_sel;
    wire[31:0]result0,result1,result2,result3;
    wire overflow1;
    Cal32 calculator(a,b,i_sub,result0,overflow1);
    SLT slt(a,b,result1);
    assign result3=a&b;
    //SLTU sltu(a,b,result3);
    //assign result3=(a<b)?32'h00000001:32'h00000000;
    assign result2=a|b;
    assign i_sel[1]=aluctr[1]&~aluctr[0];
    assign i_sel[0]=aluctr[2]&aluctr[1];
    MUX32_4_1 mux(result0,result1,result2,result3,i_sel,result);
    assign zero=~|result;
    assign overflow=(aluctr==3'b001|aluctr==3'b101)?overflow1:0;
endmodule
