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

//ALUCtrl codes 
`define ADD 4'b0000
`define SUB 4'b0001
`define AND 4'b0010
`define OR 4'b0011
`define XOR 4'b0100
`define SLL 4'b0101
`define SRL 4'b0110
`define SRA 4'b0111
`define SLT 4'b1000

module alu_control_unit_tb();
//port declaration 
reg [1:0] ALUOp;
reg [2:0] funct3;
reg [6:0] funct7;
wire [3:0] ALUCtrl;
//module declaration 
alu_control_unit alu_control_unit_dut(ALUOp, funct3, funct7, ALUCtrl);
//stimulus 
initial begin 
ALUOp= 4'b0000;


#20 ALUOp=2'b00;  //add operation 

#20 ALUOp=2'b01;  //branch operation

#20 ALUOp=2'b11;  //default value
funct3= 3'b000 ;
funct7[5] =1;  

#20 ALUOp=2'b10;  //sub operation
funct3= 3'b000 ;
funct7[5] =1; 

#20 ALUOp=2'b10;  //add operation
funct3= 3'b000 ;
funct7[5] =0; 

#20 ALUOp=2'b10; //sll
funct3= 3'b001;

#20 ALUOp=2'b10; //default
funct3= 3'b011 ;

#20 ALUOp=2'b10;
funct3= 3'b101;   //sra
funct7[5] =1;

#20 ALUOp=2'b10;
funct3= 3'b101;   //srl
funct7[5] =0;

#20 ALUOp=2'b11; //default

end
endmodule
