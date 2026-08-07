`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 03:24:39 PM
// Design Name: 
// Module Name: control_unit
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

//ALUCtrl codes 
`define ADD 4'b0000
`define SUB 4'b0001
`define AND 4'b0010
`define OR 4'b0011
`define XOR 4'b0100
`define SLL 4'b0101
`define SRL 4'b0110
`define SRA 4'b0111

module control_unit(
    input [6:0] opcode,
    output reg RegWrite,
    output reg MemWrite,
    output reg MemRead,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg jump,
    output reg branch
    );
    
    //ALUSrc-> 0 when BusB is register 
    //ALUSrc->1 when BusB is Immediate 
    
    //MemtoReg->0 when data needs to be written to register
    //MemtoReg->0 when data needs to be written to data memory
    
    always@(*) begin 
    //initialize
    RegWrite=0;
    MemWrite=0;
    MemRead=0;
    ALUSrc=0;
    MemtoReg=0;
    ALUOp=2'b00;
    jump=0;
    branch=0;  
    
    case(opcode)
   `RTYPEOPCODE: begin 
    RegWrite=1;
    MemWrite=0;
    MemRead=0;
    ALUSrc=0;
    MemtoReg=0;
    ALUOp=2'b10;
    jump=0;
    branch=0;    
    end
    
    
    //lw x2,0(x1)
    `LWOPCODE: begin 
    RegWrite=1;
    MemWrite=0;
    MemRead=1;
    ALUSrc=1;
    MemtoReg=0;
    ALUOp=`ADD;
    jump=0;
    branch=0; 
    end
    
    `SWOPCODE:begin
    RegWrite=0;
    MemWrite=1;
    MemRead=0;
    ALUSrc=1;
    MemtoReg=1; //store data from reg file into data memory
    ALUOp=`ADD;
    jump=0;
    branch=0;    
    end
   
   `BEQOPCODE: begin 
    RegWrite=0;
    MemWrite=0;
    MemRead=0;
    ALUSrc=0;
    MemtoReg=0;
    ALUOp=`SUB;
    jump=0;
    branch=1;   
    end
    
    `JOPCODE:begin 
    RegWrite=0;
    MemWrite=0;
    MemRead=0;
    ALUSrc=0; 
    MemtoReg=0;
    ALUOp=2'b00;
    jump=1;
    branch=0;
    end
    
`ITYPEOPCODE: begin 
    RegWrite=1;
    MemWrite=0;
    MemRead=0;
    ALUSrc=1; 
    MemtoReg=0;
    ALUOp=2'b10;
    jump=0;
    branch=0;
end
    
    default: begin 
    RegWrite=1'bx;
    MemWrite=1'bx;
    MemRead=1'bx;
    ALUSrc=1'bx;
    MemtoReg=1'bx;
    ALUOp=4'b1111;
    jump=1'bx;
    branch=1'bx;
    
    
    end
    endcase
    end
endmodule
