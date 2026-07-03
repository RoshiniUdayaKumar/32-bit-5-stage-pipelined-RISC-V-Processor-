`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 10:47:31 AM
// Design Name: 
// Module Name: ALU_tb
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

module ALU_tb();
//port declaration 
reg [31:0] BusA;
reg [31:0] BusB;
reg [3:0] ALUCtrl;
wire zero;
wire [31:0] BusW;
//module instantiation 
ALU ALU_tb(BusA, BusB, ALUCtrl, zero, BusW);
//Testcase-1
initial begin
ALUCtrl=4'b0000;
BusA= 32'd125;
BusB=32'd230; 

#20 ALUCtrl=4'b0000;
BusA= 32'hFFFFFFFF;
BusB=32'd1;  //overflow condition 

#20 ALUCtrl=4'b0000;
BusA= 32'd0;
BusB=32'd0;  //check for zero condition

//Testcase-2 (SUB operation)

ALUCtrl=4'b00001;
#20 BusA=32'd123;  
BusB=32'd12;

#20 ALUCtrl=4'b00001;
BusA=32'd450;
BusB=32'd560;

#20 ALUCtrl=4'b00001;
BusA=32'd1027;
BusB=32'd1027;

//Testcase-3 (AND operation)
#20 ALUCtrl= 4'b0010;
BusA= 32'd340;
BusB=32'd120;

#20 ALUCtrl= 4'b0010;
BusA=32'd0;
BusB=32'd80;

#20 ALUCtrl= 4'b0010;
BusA=32'd0;
BusB=32'd0;

//Testcase-4 (OR operation)

#20 ALUCtrl= 4'b0011;
BusA=32'd890;
BusB=32'd0;

#20 ALUCtrl= 4'b0011;
BusA=32'd2009;
BusB=32'd5609;

//Testcase-5 (SRA)
#20 ALUCtrl= 4'b0111;
BusA=32'd5;
BusB=32'd10;

//Testcase-6 (SLL , SLR)
#20 ALUCtrl=4'b0101;
BusA=32'd450;
BusB=32'd100;

#20 ALUCtrl=4'b0110;
BusA=32'd450;
BusB=32'd100;

//Testcase-7 (default values)
#20 ALUCtrl=4'b1001;
BusA=32'd560;
BusB=32'd8900;
end


endmodule
