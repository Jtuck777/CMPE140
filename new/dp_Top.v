`timescale 1ns / 1ps

module dp_Top(
    input OE,
    input Ld_CNT,
    input Sel,
    input EN,
    input LdR,
    output GT12,
    output GT1,
    input [3:0] n,
    output [31:0] RESULT,
    input CLK
    );
    wire CNT_OUT;
    wire [31:0]REG_OUT;
    wire [31:0]MULT_OUT;
    wire [31:0]LM_OUT;
    cnt32bit COUNTER(.CLK(CLK),.D(n),.Q(CNT_OUT), .LC(Ld_CNT), .EN(EN));
    cmp32bit COMP12(.A(n), .B(4'b1100),.GT(GT12));
    cmp32bit COMP1(.A(CNT_OUT), .B(4'b0001),.GT(GT1));
    mult32bit MULT (.X(REG_OUT), .Y(CNT_OUT), .Z(MULT_OUT));
    MUX2_1 OutputMUX (.A(MULT_OUT), .B(), .Q(RESULT), .Sel(OE));
    MUX2_1 LoopMUX (.A(MULT_OUT), .B(1), .Q(LM_OUT), .Sel(Sel));
    reg32bit REG(.CLK(CLK),.D(LM_OUT),.LdR(LdR),.Q(REG_OUT));
    
endmodule
