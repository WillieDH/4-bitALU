`timescale 1ns / 1ps

module ALU_TOP_tb;
//inputs
reg [3:0] a, b;
reg [2:0] OpCode;
//outputs
wire [3:0] r;
wire OVFlag;
integer i;

ALU_TOP DUT(.a(a), .b(b), .OpCode(OpCode), .OVFlag(OVFlag), .r(r));

initial 
    begin
        //global reset
        a = 0;
        b = 0;
        OpCode = 0;
        #100; // wait for global reset to finish
        //testing modes
        a = 4'b1000;
        b = 4'b0111;
        #50; // wair for propagation delay for opcode 0(sub)
        for (i = 0; i < 4; i = i + 1)
            begin
                OpCode = OpCode + 1;
                #50;
                /*
                Expected Results
                0(Sub) | r = 0001 OVFlag = 0
                1(Add) | r = 1111 OVFlag = 0
                2(NOT) | r = 1000 OVFlag = x
                3(OR) | r = 1111 OVFlag = x
                4(AND) | r = 0000 OVFlag = x          
                */
            end // for begin
        //testing overflow
        //subtraction
        a = 4'b1010; //10
        b = 4'b1100; //12
        OpCode = 3'b000;
        #50;
        /*
        Expected Result
        r = 1110 OVFlag = 1
        */
        //addition
        a = 4'b1010; //10
        b = 4'b1100; //12
        OpCode = 3'b001;
        #50;
        /*
        Expected Result
        r = 1110 OVFlag = 1
        */
        
        //test end values
        a = 4'b1111;
        b = 4'b1111;
        OpCode = 3'b100;
        
    end // initial begin
        

endmodule
