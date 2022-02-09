`timescale 1ns / 1ps

module cnt32bit(
    input CLK,
    input [3:0] D,
    output reg [3:0] Q,
    input LC,
    input EN
    );
   
    always@(posedge CLK)
    begin
     if(LC==1) assign Q =D;
     else
     if(EN==1) assign Q = Q-1;
     else 
     Q=Q;       
    end
    
    
endmodule
