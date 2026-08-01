`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 05:27:14 PM
// Design Name: 
// Module Name: PC_Mux
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


module PC_Mux(
input [31:0] pc_plus4,
input [31:0] PC_target,
input branch,
input jump,
input zero,
output [31:0] next_pc
    );
    
assign next_pc = (jump) ? PC_target : (branch&&zero) ? PC_target : pc_plus4;
endmodule
