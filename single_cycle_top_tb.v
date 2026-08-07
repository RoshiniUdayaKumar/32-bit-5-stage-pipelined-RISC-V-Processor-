`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2026 08:06:27 PM
// Design Name: 
// Module Name: single_cycle_top_tb
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


module single_cycle_top_tb();

//port declaration
reg clk;
reg rst;

//module instantiaion 
single_cycle_top single_cycle_top_dut(clk,rst);

//clock generation 
initial begin 
clk=1'b0;
forever #5 clk=~clk;
end

//reset stimulus 
initial begin 
rst=1'b0;
#10 rst=1'b1;
end

//end simulation 
initial begin 
#2000 $finish();
end
endmodule
