`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2026 08:00:56 PM
// Design Name: 
// Module Name: register_file
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


module register_file(
input [4:0] Ra,  //address bus
input [4:0] Rb,
input [4:0] Rw,
input clk,
input RegWrite, //write enable signal 
input [31:0] BusW, //write bus
output reg [31:0] BusA, //read ports
output reg [31:0] BusB
    //declare registers 

    );
  //declare 32-deep registers each 32-bit   
 reg [31:0] Reg [0:31];
    
    //logic for read 
    always @(*) begin
    BusA = Reg[Ra];
    BusB = Reg[Rb];
    end 
    
    //logic for write 
    always @(negedge clk) begin
    if(RegWrite==1 && Rw!=0) //we dont want to write to R0 
    Reg[Rw]= BusW;
    end
endmodule
