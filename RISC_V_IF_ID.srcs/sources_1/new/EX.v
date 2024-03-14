`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 05:16:23 PM
// Design Name: 
// Module Name: EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module EX(input [31:0] IMM_EX, input [31:0] REG_DATA1_EX, input [31:0] REG_DATA2_EX, input [31:0] PC_EX, input [2:0] FUNCT3_EX, input [6:0] FUNCT7_EX, 
          input [4:0] RD_EX, input [4:0] RS1_EX, input [4:0] RS2_EX, input RegWrite_EX, input MemtoReg_EX, input MemRead_EX, input MemWrite_EX,
          input [1:0] ALUop_EX, input ALUSrc_EX, input Branch_EX, input [1:0] forwardA, forwardB, input [31:0] ALU_DATA_WB, input [31:0] ALU_OUT_MEM,
          output ZERO_EX, output [31:0] ALU_OUT_EX, output [31:0] PC_Branch_EX, output [31:0] REG_DATA2_EX_FINAL);
    wire [31:0] ALU_Source1, MUX_B_temp, ALU_Source2;
    wire [3:0] ALU_Control;
    mux4_1 MUX_A(REG_DATA1_EX, ALU_DATA_WB, ALU_OUT_MEM, ALU_Source1);
    mux4_1 MUX_B(REG_DATA2_EX, ALU_DATA_WB, ALU_OUT_MEM, MUX_B_temp);
    mux2_1_32 MUX_C(IMM_EX, MUX_B_temp, ALU_Source2);
    ALU ALU(ALU_Control, ALU_Source1, ALU_Source2, ZERO_EX, ALU_OUT_EX);
    ALUcontrol ALUcontrol(ALUop_EX, FUNCT7_EX, FUNCT3_EX, ALU_Control);
    adder adder(PC_EX, IMM_EX, PC_BRANCH_EX);
endmodule
