module SLT(
        input [31:0]a,b,
        output reg[31:0]c
    );
    always@(*)
        if ((a[31]^b[31]==0))
            c=a<b?32'b1:32'b0;
        else
            c=a[31]==1?32'b1:32'b0;
endmodule
