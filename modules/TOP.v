`timescale 1ns / 1ps
module TOP(
        input clk_150MHz,reset,
        output[31:0] alu_result1,datainm,dataoutm,
        output[4:0] dataaddr,
        output memwri
    );
    wire[31:0] data,write_data,alu_result,dataout;
    wire memtoreg,memwr;
    wire[9:0]clocknum;
    assign dataaddr=alu_result[4:0];
    assign memwri=memwr;
    assign datainm=write_data;
    assign dataoutm=data;
    assign alu_result1=alu_result;
    CPU cpu(clk_150MHz,reset,alu_result,write_data,memtoreg,memwr,data);
    MUX32_2_1 mux(alu_result,dataout,memtoreg,data);
    dist_mem_gen_0 memRAM(alu_result[4:0],write_data,clk_150MHz,memwr,dataout);
    Counter clockcouter(clk_150MHz,clocknum);
    ila_0 ila_unit(clk_150MHz,reset,dataout,clocknum);
//    clk_wiz_0 C0(clk_150MHz,clk);
endmodule
