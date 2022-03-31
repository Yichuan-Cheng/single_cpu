`timescale 1ns / 1ps
module Control_Unit(
        input[5:0]op,func,
        input Zero,Overflow,
        output RegDst,RegWr,ALUSrc,MemWr,MemtoReg,Extop,
        output[1:0]PC_Sel,
        output[2:0]ALUctr
    );
    wire[2:0]ALUop;

    Control maindec(.op(op),
                    .Zero(Zero),
                    .Overflow(Overflow),
                    .RegDst(RegDst),
                    .RegWr(RegWr),
                    .ALUSrc(ALUSrc),
                    .MemWr(MemWr),
                    .MemtoReg(MemtoReg),
                    .ALUop(ALUop),
                    .PC_Sel(PC_Sel),
                    .Extop(Extop));

    ALUop ALUdec(.func1(func[1]),.func3(func[3]),.func0(func[0]),.ALUop(ALUop),.ALUctr(ALUctr));

endmodule
