`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 11:55:33 AM
// Design Name: 
// Module Name: alu_control_unit
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

module alu_control_unit(
    input [3:0] ALUOp,
    input [5:0] FunCode,
    output reg [3:0] ALUCtrl
    );
    
 //logic 
 always@(*) begin 
 if(ALUOp!=4'b1111) 
 ALUCtrl=ALUOp;
 else if(ALUOp==4'b1111);
 case(FunCode)
 `ADDFunc: ALUCtrl=`ADD;
 `SUBFunc: ALUCtrl=`SUB;
 `ANDFunc: ALUCtrl=`AND;
 `ORFunc: ALUCtrl=`OR;
 `NORFunc: ALUCtrl= `NOR;
 `SLLFunc: ALUCtrl=`SLL;
 `SRLFunc: ALUCtrl=`SRL;
 `SRAFunc: ALUCtrl=`SRA;
 default: ALUCtrl=4'd0;
 endcase
 
 end
    
    
endmodule
