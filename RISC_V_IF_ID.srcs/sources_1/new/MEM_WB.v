`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2024 08:35:11 PM
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(input clk, write, reset, input [31:0] data_in, alu_in, input [4:0] rd_in, input RegWrite_MEM, input MemtoReg_MEM,
              output reg [31:0] data_out, alu_out, output reg [4:0] rd_out, output reg RegWrite_WB, output reg MemtoReg_WB);
    always@(posedge clk) begin
        if(reset) begin
            data_out <= 32'b0;
            alu_out <= 32'b0;
            rd_out <=5'b0;
            RegWrite_WB <= 0;
            MemtoReg_WB <= 0;
        end
        else
            if(write) begin
                data_out <= data_in;
                alu_out <= alu_in;
                rd_out <= rd_in;
                RegWrite_WB <= RegWrite_MEM;
                MemtoReg_WB <= MemtoReg_MEM;
            end
    end
endmodule
