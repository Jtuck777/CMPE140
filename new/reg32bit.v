`timescale 1ns / 1ps

module reg32bit(
    input CLK,
    input [31:0] D,
    input LdR,
    output reg [31:0] Q
    );
    always@(posedge CLK)
    begin
    assign Q =(LdR==0)? Q:D;
    end
endmodule
