`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/18/2024 01:07:19 AM
// Design Name: 
// Module Name: mux2_1_32
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


module mux2_1_32(input [31:0] ina, inb,
              input [31:0] sel,
              output [31:0] out);
  
  assign out=(sel==32'b0) ? ina : inb;

endmodule
