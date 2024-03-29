`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 08:14:21 PM
// Design Name: 
// Module Name: forwarding
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


module forwarding(input [4:0] rs1, input [4:0] rs2, input [4:0] ex_mem_rd, input [4:0] mem_wb_rd, input ex_mem_regwrite, input mem_wb_write, output reg [1:0] forwardA, forwardB);
    always@(*) begin
        if(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs1))
            forwardA = 2'b10;
        if(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs2))
            forwardB = 2'b10;
        if(mem_wb_write && (mem_wb_rd != 0) && !(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs1)) && (mem_wb_rd == rs1))
            forwardA = 2'b1;
        if(mem_wb_write && (mem_wb_rd != 0) && !(ex_mem_regwrite && (ex_mem_rd != 0) && (ex_mem_rd == rs2)) && (mem_wb_rd == rs2))
            forwardB = 2'b1;
    end
endmodule