`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 04:36:59 PM
// Design Name: 
// Module Name: ALUcontrol
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


module ALUcontrol(input [1:0] ALUop, input [6:0] funct7, input [2:0] funct3, output reg [3:0] ALUinput);
    always@(*) begin
        casex({funct7, funct3, ALUop})
            12'bxxxxxxxxxx00: ALUinput = 0010; //sw, lw
            12'b000000000010: ALUinput = 0010; //add
            12'bxxxxxxx00011: ALUinput = 0010; //addi
            12'b010000000010: ALUinput = 0110; //sub
            12'b000000011110: ALUinput = 0000; //and
            12'bxxxxxxx11111: ALUinput = 0000; //andi
            12'b000000011010: ALUinput = 0001; //or
            12'bxxxxxxx11011: ALUinput = 0001; //ori
            12'b000000010010: ALUinput = 0011; //xor
            12'bxxxxxxx10011: ALUinput = 0011; //xori
            12'b000000010110: ALUinput = 0101; //srl
            12'bxxxxxxx10111: ALUinput = 0101; //srli
            12'b000000000110: ALUinput = 0100; //sll
            12'bxxxxxxx00111: ALUinput = 0100; //slli
            12'b010000010110: ALUinput = 1001; //sra
            12'bxxxxxxx10111: ALUinput = 1001; //srai
            12'b000000001110: ALUinput = 0111; //sltu
            12'b000000001010: ALUinput = 1000; //slt
            12'bxxxxxxx00001: ALUinput = 0110; //beq
            12'bxxxxxxx00101: ALUinput = 0110; //bne
            12'bxxxxxxx10001: ALUinput = 1000; //blt
            12'bxxxxxxx10101: ALUinput = 1000; //bge
            12'bxxxxxxx11001: ALUinput = 0111; //bltu
            12'bxxxxxxx11101: ALUinput = 0111; //bgeu
        endcase
    end                    
endmodule
