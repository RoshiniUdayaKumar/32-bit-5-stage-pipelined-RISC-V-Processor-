`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 01:09:28 PM
// Design Name: 
// Module Name: data_memory
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


module Data_Memory(
    input [5:0] data_mem_addr,
    input [31:0] write_data,
    input MemWrite,
    input MemRead,
    input clk,
    output reg [31:0] read_data
    );
    
    //declare the memory 
   reg [31:0] memory [0:63];
    
    //write logic
    always@(negedge clk) begin 
    if(MemWrite)
    memory[data_mem_addr]<=write_data;
    end
    //read logic 
    always@(posedge clk) begin 
    if(MemRead==0)
    read_data<=read_data;  //preserve the old value
    else  
    read_data<=memory[data_mem_addr];  
    
    end
    
endmodule

