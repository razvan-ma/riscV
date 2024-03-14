`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer: 
// 
// Create Date: 01/17/2024 08:33:31 PM
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(input clk, write, reset, input [31:0] PC_in, input [2:0] funct3_in, input [6:0] funct7_in,
             input [31:0] ALU_A_in, ALU_B_in, input [4:0] RS1_in,RS2_in, RD_in, input [31:0] IMM_in,
             input RegWrite_ID, input MemtoReg_ID, input MemRead_ID, input MemWrite_ID, input [1:0] ALUop_ID,
             input ALUSrc_ID, input Branch_ID,
             output reg [31:0] PC_out, output reg [2:0] funct3_out, output reg [6:0] funct7_out,
             output reg [31:0] ALU_A_out, ALU_B_out, output reg [4:0] RS1_out, RS2_out, RD_out, output reg [31:0] IMM_out,
             output reg RegWrite_EX, output reg MemtoReg_EX, output reg MemRead_EX, output reg MemWrite_EX,
             output reg [1:0] ALUop_EX, output reg ALUSrc_EX, output reg Branch_EX);
    always@(posedge clk) begin
        if(reset) begin
            PC_out <= 32'b0;
            funct3_out <= 3'b0;
            funct7_out <= 7'b0;
            ALU_A_out <= 32'b0;
            ALU_B_out <= 32'b0;
            RS1_out <= 5'b0;
            RS2_out <= 5'b0;
            RD_out <= 5'b0;
            IMM_out <= 32'b0;
            RegWrite_EX <= 0;
            MemtoReg_EX <= 0;
            MemRead_EX <= 0;
            MemWrite_EX <= 0;
            ALUop_EX <= 0;
            ALUSrc_EX <= 0;
            Branch_EX <= 0;
        end
        else
            if(write) begin
                PC_out <= PC_in;
                funct3_out <= funct3_in;
                funct7_out <= funct7_in;
                ALU_A_out <= ALU_A_in;
                ALU_B_out <= ALU_B_in;
                RS1_out <= RS1_in;
                RS2_out <= RS2_in;
                RD_out <= RD_in;
                IMM_out <= IMM_in;
                RegWrite_EX <= RegWrite_ID;
                MemtoReg_EX <= MemtoReg_ID;
                MemRead_EX <= MemRead_ID;
                MemWrite_EX <= MemWrite_ID;
                ALUop_EX <= ALUop_ID;
                ALUSrc_EX <= ALUSrc_ID;
                Branch_EX <= Branch_ID;
            end
    end     
endmodule
