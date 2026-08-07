`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2026 11:28:12 PM
// Design Name: 
// Module Name: ALU_MUX
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


module ALU_MUX(
    input [31:0] Op2,
    input [31:0] Imm_Ext_Ins,
    input ALUSrc,
    output reg [31:0] Op2_out
    );
    
    always@(*) begin
    case(ALUSrc)
    1'b0:Op2_out=Op2;
    1'b1: Op2_out=Imm_Ext_Ins;
    default: Op2_out=32'd0;    
    endcase
    end
endmodule
