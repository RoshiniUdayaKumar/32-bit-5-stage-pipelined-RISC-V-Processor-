`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 03:20:36 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb();
//port declaration 
reg [4:0] Ra;
reg [4:0] Rb;
reg [4:0] Rw;
reg clk;
reg RegWrite;
reg [31:0] BusW;
wire [31:0] BusA;
wire [31:0] BusB;

//module instantiation 
register_file register_file_dut(Ra,Rb,Rw,clk,RegWrite,BusW, BusA, BusB);

//clock generation block
initial begin 
clk=1'b0;
forever #10 clk=~clk;
end

//Testcase-1
initial begin 
//Register 5
Rw=5'd5;
BusW=32'd40;
RegWrite=1;

//Register 10
#10 Rw=5'd10;
BusW=32'd36;
RegWrite=0;

//Register 22
#10 Rw=5'd22;
BusW=32'd160;
RegWrite=1;

//Register 0
#10 Rw=5'd0;
BusW=32'd90;
RegWrite=1;
end

//Testcase-2
initial begin 
Ra=5'd22; 
Rb=5'd10; 
end

//Testcase-3
initial begin 
#30 Ra=5'd5; //read from register 5 
Rb=5'd22; //read from reg 22
end

//testcase-4 
initial begin 
#35 Ra=5'd0; //read from register 5 
Rb=5'd5; //read from reg 22
end

//testcase-5 
initial begin 
#40 Ra=5'd20;
Rb=5'd22;
end

//stop simulation 
initial begin 
#200 $finish();
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/02/2026 03:20:36 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb();
//port declaration 
reg [4:0] Ra;
reg [4:0] Rb;
reg [4:0] Rw;
reg clk;
reg RegWrite;
reg [31:0] BusW;
wire [31:0] BusA;
wire [31:0] BusB;
integer i,j,k;

//module instantiation 
register_file register_file_dut(Ra,Rb,Rw,clk,RegWrite,BusW, BusA, BusB);

//clock generation block
initial begin 
clk=1'b0;
forever #10 clk=~clk;
end

//write operation 
initial begin 
for( i=1; i<32;i= i+1) begin
Rw=i;
BusW=i+5;
RegWrite=1;
#20;
end
end

//read operation for 
initial begin 
for(j=1; j<32; j=j+1) begin
Ra=j;
Rb= j;
#20;
end
end

//stop simulation 
initial begin 
#1000 $finish();
end
endmodule

