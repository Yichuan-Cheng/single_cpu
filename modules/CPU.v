`timescale 1ns / 1ps
module CPU(
        input clock,reset,
        output[31:0]alu_result,write_data,
        output memtoreg,memwr,
        input[31:0]data
    );
    wire[31:0]inst,imm32,alu_a,alu_b,b_dataout;
    wire regdst,alusrc,regwr,extop,zero,overflow;
    wire[1:0]pc_sel;
    wire[2:0]aluctr;
    wire[4:0]rw;
    Fetch_Circuit fetch(imm32[31],imm32[28:0],inst[25:0],pc_sel,inst,clock,reset);
    Control_Unit control(inst[31:26],inst[5:0],zero,overflow,regdst,regwr,alusrc,memwr,memtoreg,extop,pc_sel,aluctr);
    FileRegister regfile(clock,reset,inst[25:21],inst[20:16],rw,data,regwr,alu_a,alu_b);
    ALU alu(alu_a,b_dataout,aluctr,alu_result,zero,overflow);
    Ext16_32 extender(inst[15:0],extop,imm32);
    MUX5_2_1 mux5_2_1(inst[20:16],inst[15:11],regdst,rw);
    MUX32_2_1 mux32_2_1(alu_b,imm32,alusrc,b_dataout);
    assign write_data=alu_b;
endmodule
