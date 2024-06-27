`timescale 1ns / 1ps

module ALU_SubCore(a, b, diff, OverFlowFlag);
input [3:0] a, b;
output [4:0] diff;
output OverFlowFlag;

assign diff = a - b;
assign OverFlowFlag = diff[4];

endmodule