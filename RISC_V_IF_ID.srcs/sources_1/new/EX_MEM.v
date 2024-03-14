`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 08:31:12 PM
// Design Name: 
// Module Name: EX_MEM
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

module EX_MEM(input clk, write, reset, input [31:0] PC_in, input [2:0] funct3_in, input zero_in, input [31:0] ALU_in, input [31:0] reg2_data_in, input [4:0] rd_in,
              input RegWrite_EX, input MemtoReg_EX, input MemRead_EX, input MemWrite_EX, input [1:0] ALUop_EX, input ALUSrc_EX, input Branch_EX,
              output reg [31:0] PC_out, output reg [2:0] funct3_out, output reg zero_out, output reg [31:0] ALU_out, output reg [31:0] reg2_data_out, output reg [4:0] rd_out,
              output reg RegWrite_MEM, output reg MemtoReg_MEM, output reg MemRead_MEM, output reg MemWrite_MEM, output reg [1:0] ALUop_MEM, output reg ALUSrc_MEM, output reg Branch_MEM);
    always@(posedge clk) begin
        if(reset) begin
            PC_out <= 32'b0;
            funct3_out <= 3'b0;
            zero_out <= 0;
            ALU_out <= 32'b0;
            reg2_data_out <= 32'b0;
            rd_out <= 5'b0;
            RegWrite_MEM <= 0;
            MemtoReg_MEM <= 0;
            MemRead_MEM <= 0;
            MemWrite_MEM <= 0;
            ALUop_MEM <= 0;
            ALUSrc_MEM <= 0;
            Branch_MEM <= 0;
        end
        else
            if(write) begin
                PC_out <= PC_in;
                funct3_out <= funct3_in;
                zero_out <= zero_in;
                ALU_out <= ALU_in;
                reg2_data_out <= reg2_data_in;
                rd_out <= rd_in;
                RegWrite_MEM <= RegWrite_EX;
                MemtoReg_MEM <= MemtoReg_EX;
                MemRead_MEM <= MemRead_EX;
                MemWrite_MEM <= MemWrite_EX;
                ALUop_MEM <= ALUop_EX;
                ALUSrc_MEM <= ALUSrc_EX;
                Branch_MEM <= Branch_EX;
            end
    end
endmodule
