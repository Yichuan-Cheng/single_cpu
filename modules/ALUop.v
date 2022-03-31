`timescale 1ns / 1ps
module ALUop(
        input func1,func3,func0,
        input [2:0]ALUop,
        output[2:0]ALUctr
    );
    assign ALUctr[2]=(ALUop[0]&func1)|ALUop[2];
    assign ALUctr[1]=(ALUop[0]&func3)|ALUop[1];
    assign ALUctr[0]=(ALUop[0]&~func0)|(~ALUop[2]&~ALUop[1]& ~ALUop[0]);

endmodule
