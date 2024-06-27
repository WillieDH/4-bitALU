`timescale 1ns / 1ps

module ALU_AddCore(a, b, sum, OverFlowFlag);
input [3:0] a, b;
output [4:0] sum;
output OverFlowFlag;

assign sum = a + b;
assign OverFlowFlag = sum[4];

endmodule