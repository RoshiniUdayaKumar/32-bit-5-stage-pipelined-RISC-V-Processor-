`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 05:26:27 PM
// Design Name: 
// Module Name: pc_target
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


module pc_target(
    input [31:0] current_pc,
    input [31:0] Imm_Ext_Ins,
    output [31:0] PC_target
    );
    
    assign PC_target= current_pc + Imm_Ext_Ins;  
endmodule
