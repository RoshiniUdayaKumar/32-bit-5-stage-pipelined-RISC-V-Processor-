`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 03:57:18 PM
// Design Name: 
// Module Name: control_unit_tb
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

//opcodes
`define RTYPEOPCODE 7'b0110011
`define LWOPCODE 7'b0000011
`define SWOPCODE 7'b0100011
`define BEQOPCODE 7'b1100011
`define JOPCODE  7'b1101111
`define ITYPEOPCODE 7'b0010011

module control_unit_tb( );
//port declaration 
reg [6:0] opcode;
wire RegWrite;
wire MemWrite;
wire MemRead;
wire ALUSrc;
wire MemtoReg;
wire [1:0] ALUOp;
wire jump;
wire branch;
//module instantiation 
control_unit control_unit_dut(opcode, RegWrite, MemWrite, MemRead, ALUSrc, MemtoReg, ALUOp,jump,branch);
//stimulus
initial begin 
#20 opcode=`RTYPEOPCODE;
#20 opcode=`LWOPCODE;
#20 opcode=`SWOPCODE;
#20 opcode=`BEQOPCODE;
#20 opcode=`JOPCODE;
#20 opcode=`ITYPEOPCODE;
end
endmodule
