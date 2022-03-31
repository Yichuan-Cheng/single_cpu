`timescale 1ns / 1ps
module FileRegister(
        input Clock,Reset,
        input [4:0]  Ra,Rb,Rw,
        input [31:0]  Data,
        input  Write,
        output [31:0] A,B

    );

    reg [31:0] Register[1:31]; //定义31个32位的寄存器
    integer i;
    initial
    begin
        for ( i = 1 ; i <= 31 ; i = i + 1)
            Register [i] = i ;
    end
    //Read data
    assign A = (Ra == 0)? 0 : Register[Ra];
    assign B = (Rb == 0)? 0 : Register[Rb];
    //Write data
    always @ ( posedge Clock)
        if (Reset)
        begin
            for ( i = 1 ; i <= 31 ; i = i + 1)
                Register [i] = i ;
        end
        else if (( Write ) && ( Rw != 0))
            Register[Rw] <= Data;

endmodule

