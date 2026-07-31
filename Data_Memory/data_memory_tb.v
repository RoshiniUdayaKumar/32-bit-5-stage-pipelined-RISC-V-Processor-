`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 01:10:15 PM
// Design Name: 
// Module Name: data_memory_tb
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


module Data_Memory_tb();
//port declaration 
reg [5:0] data_mem_addr;
reg [31:0] write_data;
reg MemWrite;
reg MemRead;
reg clk;
wire [31:0] read_data;
//module instantiation 
Data_Memory Data_Memory_dut (data_mem_addr, write_data, MemWrite, MemRead, clk, read_data);
//clock generation block 
initial begin 
clk=1'b0;
forever #10 clk=~clk;
end
//stimulus for writing data 
initial begin 
#20 data_mem_addr=6'd24;
write_data=32'd124;
MemWrite=1;
MemRead=1;

#20 data_mem_addr=6'd58;
write_data=32'd856;
MemWrite=1;
MemRead=1;

//Testcase-5
#20 data_mem_addr=6'd100;
write_data=32'd4506;
MemWrite=1;
MemRead=1;

//Testcase-6
#20 data_mem_addr=6'd41;
write_data=32'd10000;
MemWrite=0;
MemRead=1;

//Testcase-7
#20 data_mem_addr=6'd29;
write_data=32'd10;
MemWrite=1;
MemRead=0;

//Testcase-8
#20 data_mem_addr=6'd11;
write_data=32'd501;
MemWrite=0;
MemRead=0;

//Testcase-9 (upper boundry)
#20 data_mem_addr=6'd63;
write_data=32'd8790;
MemWrite=1;
MemRead=1;

//lower boundry
#20 data_mem_addr=6'd0;
write_data=32'd83;
MemWrite=1;
MemRead=1;

end
endmodule

