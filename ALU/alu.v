`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 10:38:43 AM
// Design Name: 
// Module Name: ALU
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

`define ADD 4'b0000
`define SUB 4'b0001
`define AND 4'b0010
`define OR 4'b0011
`define XOR 4'b0100
`define SLL 4'b0101
`define SRL 4'b0110
`define SRA 4'b0111

module ALU(
    input [31:0] BusA,
    input [31:0] BusB,
    input [3:0] ALUCtrl,
    output zero,
    output reg [31:0] ALUResult
    );
    
    //logic for ALU 
    always@(*) begin 
    case(ALUCtrl) 
    `ADD: ALUResult= BusA +BusB;  //ADD operation 
    `SUB: ALUResult= BusA -BusB;  //SUB operation
    `AND: ALUResult= BusA &BusB; // AND operation 
    `OR: ALUResult= BusA|BusB; //OR operation
    `XOR: ALUResult= BusA^BusB;  //XOR operation
    `SLL: ALUResult= BusA<<BusB;  //logical left shift operation
    `SRL: ALUResult= BusA>>BusB; // Logical right shift operation 
    `SRA: ALUResult= BusA>>>BusB; //Shift right arithmetic
    default: ALUResult= 32'd0;
    endcase
    end
    //logic for zero 
    assign zero = (ALUResult==0)?1'b1:1'b0;
endmodule
