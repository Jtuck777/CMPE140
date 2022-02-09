`timescale 1ns / 1ps

module cmp32bit(
    input [3:0] A,
    input [3:0] B,
    output GT
    );
    assign GT=(A>B)? 1:0;
endmodule
