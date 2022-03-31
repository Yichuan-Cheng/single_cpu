module MUX32_4_1(a,b,c,d,sel,o);
    input [31:0]a,b,c,d;
    input[1:0] sel;
    output reg[31:0]o;
    always @(sel or a or b or c or d)
    begin
        case(sel)
            2'b00:
                o=a;
            2'b01:
                o=b;
            2'b10:
                o=c;
            2'b11:
                o=d;
            default:
                o=0;
        endcase
    end
endmodule
