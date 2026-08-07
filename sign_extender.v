`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 05:35:16 PM
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(
    input [31:0] Ins,
    input [6:0] opcode,
    output reg [31:0] Imm_Ext_Ins
    );
    
    always @(*) begin 
    case(opcode)
    7'b0000011,
    7'b0010011: Imm_Ext_Ins = {{20{Ins[31]}},Ins[31:20]}; //I-type instruction+lw 
    7'b0100011: Imm_Ext_Ins = {{20{Ins[31]}},Ins[31:25],Ins[11:7]};//S-type instruction
    7'b1100011: Imm_Ext_Ins = {{20{Ins[31]}},Ins[7],Ins[30:25],Ins[11:8],1'b0}; //B-type instruction
    7'b1101111: Imm_Ext_Ins = {{12{Ins[31]}},Ins[19:12],Ins[20],Ins[30:21],1'b0}; //J-type instruction 
    default:  Imm_Ext_Ins=32'd0;
    endcase
    end
endmodule
