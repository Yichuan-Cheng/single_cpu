`timescale 1ns / 1ps
module Control(
        input [5:0]op,
        input Zero,Overflow,
        output RegDst,ALUSrc,RegWr,MemtoReg,MemWr,Extop,
        output[1:0]PC_Sel,
        output[2:0]ALUop);
    wire r_type=~|op;
    wire i_ori=~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0];
    wire i_addiu=~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0];


    wire i_lw=op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
    wire i_sw=op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0];
    wire i_beq=~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];
    wire i_j=~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];

    assign RegDst =r_type;
    assign ALUSrc=i_ori|i_addiu|i_lw|i_sw;
    assign RegWr=(r_type|i_ori|i_addiu|i_lw)&~Overflow;
    assign MemtoReg=i_lw;
    assign MemWr=i_sw;
    assign Extop=i_addiu|i_lw|i_sw|i_beq;

    assign PC_Sel[1]=i_j;
    assign PC_Sel[0]=(i_beq&Zero)|i_j;

    assign ALUop[2]=i_beq;
    assign ALUop[1]=i_ori;
    assign ALUop[0]=r_type;


endmodule
