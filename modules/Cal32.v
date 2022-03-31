module Cal32(A, B, Sub, Result, Overflow);
    input [31:0] A, B;
    input Sub;
    output [31:0] Result;
    output Overflow;

    assign Result = A + (B^{32{Sub}}) + Sub;
    assign Overflow = Sub == 0 ? (A[31] & B[31]) | (~A[31] & ~B[31] & Result[31]):(~A[31] & B[31]) | (A[31] & ~B[31] & ~Result[31]);


endmodule
