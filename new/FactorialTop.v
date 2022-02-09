`timescale 1ns / 1ps

module FactorialTop(
    input Go,
    input CLK,
    input [3:0] n,
    output Done, 
    output Err,
    output [31:0] nF
    );
wire GT12, GT1, OE, Ld_CNT, Sel,EN, OE, LdR;

CU_Factorial ControlUnit( 
    .CLK(CLK),
    .GT12(GT12),
    .GT1(GT1),
    .OE(OE),
    .Ld_CNT(Ld_CNT),
    .Sel(Sel),
    .EN(EN),
    .LdR(LdR),
    .Done(Done),
    .Error(Err),
    .Go(Go));
        
dp_TOP DATAPATH(
    .OE(OE),
    .Ld_CNT(Ld_CNT),
    .Sel(Sel),
    .EN(EN),
    .LdR(LdR),
    .GT12(GT12),
    .GT1(GT1),
    .n(n),
    .RESULT(nF),
    .CLK(CLK));    
endmodule
