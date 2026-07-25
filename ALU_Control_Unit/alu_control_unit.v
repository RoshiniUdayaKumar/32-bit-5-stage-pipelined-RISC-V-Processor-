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

module alu_control_unit(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] ALUCtrl
    );
    
always @(*) begin 
case(ALUOp) 
2'b00: ALUCtrl = `ADD;  //for LW, SW, jump ins
2'b01: ALUCtrl =`SUB; //for brnach ins
2'b10: begin   //for r-type ins
case (funct3)
3'b000: ALUCtrl = (funct7[5]) ? `SUB:`ADD;
3'b001: ALUCtrl =`SLL;
3'b010: ALUCtrl=`SLT;
3'b100: ALUCtrl=`XOR;
3'b101: ALUCtrl= (funct7[5])? `SRA:`SRL;
3'b110: ALUCtrl= `OR;
3'b111: ALUCtrl=`AND;
default: ALUCtrl = 4'd0;
endcase
end
default: ALUCtrl=4'd0;
endcase
end     
endmodule
