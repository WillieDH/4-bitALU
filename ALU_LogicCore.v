`timescale 1ns / 1ps

module ALU_LogicCore(a, b, AndOut, OrOut, NotOut);
input [3:0] a, b;
output [3:0] AndOut, OrOut, NotOut;

assign AndOut = a & b;
assign OrOut = a | b;
assign NotOut = ~b;

endmodule