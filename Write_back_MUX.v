`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2026 11:37:04 PM
// Design Name: 
// Module Name: Write_back_MUX
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


module Write_back_MUX(
    input [31:0] read_data,
    input [31:0] ALUResult,
    input MemtoReg,
    output reg [31:0] WriteBackData
    );
    
    always@(*) begin
    case(MemtoReg)
    1'b0:WriteBackData=ALUResult;
    1'b1: WriteBackData=read_data;
    default: WriteBackData=32'd0;    
    endcase
    end
endmodule
