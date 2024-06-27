`timescale 1ns / 1ps

module ALU_TOP(a, b, OpCode, OVFlag, r);
input [3:0] a, b;
input [2:0] OpCode;
output reg [3:0] r;
output reg OVFlag;
wire [3:0] AndOut, OrOut, NotOut;
wire [4:0] sum, diff;
wire OverFlowFlag_Add, OverFlowFlag_Sub;
ALU_LogicCore logicMod(.a(a), .b(b), .AndOut(AndOut), .OrOut(OrOut), .NotOut(NotOut));
ALU_AddCore addMod(.a(a), .b(b), .sum(sum), .OverFlowFlag(OverFlowFlag_Add));
ALU_SubCore subMod(.a(a), .b(b), .diff(diff), .OverFlowFlag(OverFlowFlag_Sub));

always @ (OpCode or diff or sum or NotOut or OrOut or AndOut) 
begin
    case (OpCode)
        3'b000: 
            begin
                r = diff[3:0];
                OVFlag = OverFlowFlag_Sub;
            end // sub
        3'b001: 
            begin
                r = sum[3:0];
                OVFlag = OverFlowFlag_Add;
            end // add
        3'b010: r = NotOut; // NOT
        3'b011: r = OrOut; // OR
        3'b100: r = AndOut; // AND
        default: 
            begin
                r = 4'bxxxx;
                OVFlag = 1'bx;
            end // avoid incomplete specification
    endcase
end 

endmodule