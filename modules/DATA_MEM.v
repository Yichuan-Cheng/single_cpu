`timescale 1ns / 1ps
module DATA_MEM(
        output[31:0] dataout,
        input [31:0] datain,
        input [31:0] addr,
        input  ReadWrite ,
        input  Clock
    );

    reg [31:0] ram [0:31];

    assign dataout = ReadWrite == 0? ram[addr[4:0]] : 0;

    always @(posedge Clock)
        if (ReadWrite)
            ram[addr[4:0]] = datain;

    integer i;

    initial
    begin
        for ( i = 0 ; i <= 31 ; i = i + 1)
            ram [i] = i ;
    end

endmodule
