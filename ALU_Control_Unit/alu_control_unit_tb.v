`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 12:36:19 PM
// Design Name: 
// Module Name: alu_control_unit_tb
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


//function codes
`define ADDFunc  6'b000000
`define SUBFunc  6'b000010
`define ANDFunc  6'b000011
`define ORFunc   6'b100000
`define NORFunc  6'b100001
`define SLLFunc  6'b000001
`define SRLFunc  6'b000110
`define SRAFunc  6'b000111

//ALUCtrl codes 
`define ADD 4'b0000
`define SUB 4'b0001
`define AND 4'b0010
`define OR 4'b0011
`define NOR 4'b0100
`define SLL 4'b0101
`define SRL 4'b0110
`define SRA 4'b0111

module alu_control_unit_tb();
//port declaration 
reg [3:0] ALUOp;
reg [5:0] FunCode;
wire [3:0] ALUCtrl;
//module declaration 
alu_control_unit alu_control_unit_dut(ALUOp, FunCode, ALUCtrl);
//stimulus 
initial begin 
ALUOp= 4'b0000;
FunCode=`NORFunc;

#20 ALUOp=4'b1111;
FunCode =`ADDFunc;

#20 ALUOp=4'b1111;
FunCode =`ORFunc;

#20 ALUOp=4'b1111;
FunCode =`SUBFunc;

#20 ALUOp=4'b1111;
FunCode =`ANDFunc;

#20 ALUOp=4'b1111;
FunCode =`NORFunc;

#20 ALUOp=4'b1111;
FunCode =`SLLFunc;

#20 ALUOp=4'b1111;
FunCode =`SRLFunc;

#20 ALUOp=4'b1111;
FunCode =`SRAFunc;



end
endmodule
