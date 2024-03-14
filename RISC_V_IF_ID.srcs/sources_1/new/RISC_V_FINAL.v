`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 10:18:01 PM
// Design Name: 
// Module Name: RISC_V_FINAL
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


module RISC_V_FINAL(input clk,
                    input reset,
                    output [31:0] PC_EX_out,
                    output [31:0] ALU_OUT_EX_out,
                    output [31:0] PC_MEM_out,
                    output PCSrc_out, 
                    output [31:0] DATA_MEMORY_MEM_out,
                    output [31:0] ALU_DATA_WB_out,
                    output [1:0] forwardA_out, forwardB_out,
                    output pipeline_stall_out);
    
    wire PCSrc;       
    wire [31:0] PC_Branch;
    wire [31:0] PC_IF;
    wire [31:0] INSTRUCTION_IF;
    wire IF_ID_WRITE;
    wire PCWrite;
    wire control_sel;
    
    wire [31:0] PC_ID;
    wire [31:0] INSTRUCTION_ID;
    wire [2:0] FUNCT3_ID;
    wire [6:0] FUNCT7_ID;
    wire [6:0] OPCODE_ID;
    wire [31:0] REG_DATA1_ID;
    wire [31:0] REG_DATA2_ID;
    wire [4:0] RS1_ID;
    wire [4:0] RS2_ID;
    wire [4:0] RD_ID;
    wire [31:0] IMM_ID;
    wire [1:0] ALUop_ID;
    wire ALUSrc_ID;
    wire RegWrite_ID;
    wire MemtoReg_ID;
    wire MemRead_ID;
    wire MemWrite_ID;
    wire Branch_ID;
    
    wire [31:0] PC_EX;
    wire [2:0] FUNCT3_EX;
    wire [6:0] FUNCT7_EX;
    wire [6:0] OPCODE_EX;
    wire [31:0] REG_DATA1_EX;
    wire [31:0] REG_DATA2_EX;
    wire [4:0] RS1_EX;
    wire [4:0] RS2_EX;
    wire [4:0] RD_EX;
    wire [31:0] IMM_EX;
    wire [31:0] PC_Branch_EX;
    wire ZERO_EX;
    wire [3:0] ALU_CONTROL; //?
    wire [1:0] ALUop_EX;
    wire ALUSrc_EX;
    wire RegWrite_EX;
    wire MemtoReg_EX;
    wire MemRead_EX;
    wire MemWrite_EX;
    wire Branch_EX;
    wire [1:0] forwardA;
    wire [1:0] forwardB;
    wire [31:0] ALU_OUT_EX;
    wire [31:0] REG_DATA2_EX_FINAL;
    
    wire [31:0] PC_MEM;
    wire [2:0] FUNCT3_MEM;
    wire ZERO_MEM;
    wire [31:0] ALU_OUT_MEM;
    wire [31:0] REG_DATA2_MEM;
    wire [4:0] RD_MEM;
    wire RegWrite_MEM;
    wire MemtoReg_MEM;
    wire MemRead_MEM;
    wire MemWrite_MEM;
    wire [1:0] ALUop_MEM;
    wire ALUSrc_MEM;
    wire Branch_MEM;
    wire [31:0] DATA_MEMORY_MEM;
    
    wire [31:0] ALU_OUT_WB;
    wire [31:0] ALU_DATA_WB;
    wire [31:0] DATA_MEMORY_WB;
    wire MemtoReg_WB;
    wire RegWrite_WB;
    wire [4:0] RD_WB;
    
    IF IF(clk, reset, PCSrc, PCWrite, PC_Branch, PC_IF, INSTRUCTION_IF);
    IF_ID_reg IFID(clk, reset, IF_ID_WRITE, PC_IF, INSTRUCTION_IF, PC_ID, INSTRUCTION_ID);
    ID ID(clk, PC_ID, INSTRUCTION_ID, RegWrite_WB, ALU_DATA_WB, RD_WB, IMM_ID, REG_DATA1_ID, 
          REG_DATA2_ID, RegWrite_ID, MemtoReg_ID, MemRead_ID, MemWrite_ID, ALUop_ID, ALUSrc_ID,
          Branch_ID, FUNCT3_ID, FUNCT7_ID, OPCODE_ID, RD_ID, RS1_ID, RS2_ID);
    ID_EX IDEX(clk, 1'b1, reset, PC_ID, FUNCT3_ID, FUNCT7_ID, REG_DATA1_ID, REG_DATA2_ID, RS1_ID, RS2_ID, RD_ID,
              IMM_ID, RegWrite_ID, MemtoReg_ID, MemRead_ID, MemWrite_ID, ALUop_ID, ALUSrc_ID, Branch_ID,
              PC_EX, FUNCT3_EX, FUNCT7_EX, REG_DATA1_EX, REG_DATA2_EX, RS1_EX, RS2_EX, RD_EX, IMM_EX,
              RegWrite_EX, MemtoReg_Ex, MemRead_EX, MemWrite_EX, ALUop_EX, ALUSrc_EX, Branch_EX);
    EX EX(IMM_EX, REG_DATA1_EX, REG_DATA2_EX, PC_EX, FUNCT3_EX, FUNCT7_EX, RD_EX, RS1_EX, RS2_EX,
          RegWrite_EX, MemtoReg_EX, MemRead_EX, MemWrite_EX, ALUop_EX, ALUSrc_EX, Branch_EX, forwardA,
          forwardB, ALU_DATA_WB, ALU_OUT_MEM, ZERO_EX, ALU_OUT_EX, PC_Branch_EX, REG_DATA2_EX_FINAL);
    EX_MEM EXMEM(clk, 1'b1, reset, PC_Branch_EX, FUNCT3_EX, ZERO_EX, ALU_OUT_EX, REG2_DATA_EX_FINAL, RD_EX,
                 RegWrite_EX, MemtoReg_EX, MemRead_EX, MemWrite_EX, ALUop_EX, ALUSrc_EX, Branch_EX, 
                 PC_MEM, FUNCT3_MEM, ZERO_MEM, ALU_OUT_MEM, REG2_DATA_MEM, RD_MEM, RegWrite_MEM, 
                 MemtoReg_MEM, MemRead_MEM, MemWrite_MEM, ALUop_MEM, ALUSrc_MEM, Branch_MEM);
    forwarding fw(RS1_EX, RS2_EX, RD_MEM, RD_WB, RegWrite_MEM, RegWrite_WB, forwardA, forwardB);
    data_memory dm(clk, MemRead_MEM, MemWrite_MEM, ALU_OUT_MEM, REG_DATA2_MEM, DATA_MEMORY_MEM);
    branch_control bc(ZERO_MEM, ALUSrc_MEM, BARNCH_MEM, FUNCT3_MEM, PCSrc);
    MEM_WB MEMWB(clk, 1'b1, reset, DATA_MEMORY_MEM, ALU_OUT_MEM, RD_MEM, RegWrite_MEM, MemtoREG_MEM,
                 DATA_MEMORY_WB, ALU_OUT_WB, RD_WB, RegWrite_WB, MemtoReg_WB);
    mux2_1 muxWB(ALU_OUT_WB, DATA_MEMORY_WB, MemtoReg_WB, ALU_DATA_WB);
    hazard_detection hd(RD_EX, RS1_ID, RS2_ID, MemRead_EX, PCWrite, IF_ID_WRITE, control_sel);
    control_path cp(OPCODE_ID, Branch_ID, MemRead_ID, MemtoReg_ID, ALUop_ID, MemWrite_ID,
                    ALUSrc_ID, RegWrite_ID);
    assign PC_EX_out = PC_EX;
    assign ALU_OUT_EX_out = ALU_OUT_EX;
    assign PC_MEM_out = PC_MEM; 
    assign PCSrc_out = PCSrc;
    assign DATA_MEMORY_MEM_out = DATA_MEMORY_MEM;
    assign ALU_DATA_WB_out = ALU_DATA_WB;
    assign forwardA_out = forwardA; 
    assign forwardB_out = forwardB;
    assign pipeline_stall_out = control_sel;   
    
endmodule