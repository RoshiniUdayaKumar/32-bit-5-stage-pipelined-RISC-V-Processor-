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


module ALU(
    input [31:0] BusA,
    input [31:0] BusB,
    input [3:0] ALUCtrl,
    output zero,
    output reg [31:0] BusW
    );
    
    //logic for ALU 
    always@(*) begin 
    case(ALUCtrl) 
    4'b0000: BusW= BusA +BusB;  //ADD operation 
    4'b0001: BusW= BusA -BusB;  //SUB operation
    4'b0010: BusW= BusA &BusB; // AND operation 
    4'b0011: BusW= BusA|BusB; //OR operation
    4'b0100: BusW= ~(BusA|BusB);  //NOR operation
    4'b0101: BusW= BusA<<BusB;  //logical left shift operation
    4'b0110: BusW= BusA>>BusB; // Logical right shift operation 
    4'b0111: BusW= BusA>>>BusB; //Shift right arithmetic
    default: BusW= 32'd0;
    endcase
    end
    //logic for zero 
    assign zero = (BusW==0)?1'b1:1'b0;
endmodule
