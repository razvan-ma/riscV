`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/14/2023 05:27:59 PM
// Design Name: 
// Module Name: mux4_1
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


module mux4_1(input [31:0] ina, inb, inc,
              input [31:0] sel,
              output reg [31:0] out);
    always@(*) begin
        case(sel)
            2'b00: out = ina;
            2'b01: out = inb;
            2'b10: out = inc;
        endcase
    end
endmodule
