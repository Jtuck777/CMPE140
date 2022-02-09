`timescale 1ns / 1ps

module CU_Factorial(
    input CLK,
    input GT12,
    input GT1,
    output reg OE,
    output reg Ld_CNT,
    output reg Sel,
    output reg EN,
    output reg LdR,
    output reg Done,
    output reg Error,
    input Go
    );
reg[2:0] STATE;
reg[2:0] N_STATE;
parameter S0=0, S1=1, S2=2, S3=3, S4=4;

always @(posedge CLK)begin
STATE<=N_STATE;
end
always @(*) begin
case(STATE)
S0: 
    begin
    OE =0; Ld_CNT=1;Sel=1;
    EN=1; LdR=0; Error = 0;
    Done=0;
    if(Go==0) N_STATE <= S0;
    else
    if(GT12==1) 
    begin N_STATE <= S0; 
    Error = 1; end
    else
    N_STATE<=S1;
    end
S1:
    begin
    LdR=1;
    N_STATE<=S2;
    end
S2:
    begin
    Ld_CNT=0;Sel=0;
    EN=0; LdR=0;
    if(GT1==1)N_STATE<=S3;
    else N_STATE<=S4;
    end
S3:
    begin
    EN=1; LdR=1;
    N_STATE<=S2;
    end
S4:
    begin
     Done=1; OE=1;
     N_STATE<=S0;
     end
endcase
end
endmodule
