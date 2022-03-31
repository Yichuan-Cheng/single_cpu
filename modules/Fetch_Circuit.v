`timescale 1ns / 1ps
module Fetch_Circuit(
        input br_addr31,
        input[28:0] br_addr,
        input[25:0]j_addr,
        input[1:0]pc_sel,
        output[31:0]inst,
        input clock,reset
    );
    wire[31:0] addr,pc4,brench_address,next_pc;
    PC PCunit(addr,next_pc,clock,reset);
    //instmemo instmemory(addr[8:2],inst);
    dist_mem_gen_1 inst_rom(addr[10:2],inst);
    Add32 addder1(32'h4,addr,pc4);
    Add32 addder2(pc4,{br_addr31,br_addr,2'b00},brench_address);
    MUX32_4_1 mux_1(pc4,brench_address,pc4,{pc4[31:28],j_addr[25:0],2'b00},pc_sel,next_pc);
endmodule
