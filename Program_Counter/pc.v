`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 08:50:55 PM
// Design Name: 
// Module Name: pc
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



module pc(
    input [31:0] next_pc,
    input clk,
    input rst,
    output reg [31:0] current_pc
    );
    
    //logic 
    always@(negedge clk or negedge rst) begin 
    if(~rst)
    current_pc<=32'd0;
    else
    current_pc<=next_pc;    
    end
endmodule
