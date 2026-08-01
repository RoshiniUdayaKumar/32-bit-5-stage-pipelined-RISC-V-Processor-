`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 05:41:35 PM
// Design Name: 
// Module Name: Nex_PC_Adder
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


module Nex_PC_Adder(
input [31:0] current_pc,
output [31:0] pc_plus4
);

assign pc_plus4 = current_pc+32'd4;

endmodule
