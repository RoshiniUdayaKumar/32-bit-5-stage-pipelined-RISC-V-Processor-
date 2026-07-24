`timescale 1ns / 1ps
module inst_mem(
    input [31:0] current_pc,
    output reg [31:0] Ins
    );

//create an array for memory 
//It has 128 instructions where each inst is 32-bits wide
reg [31:0] memory [127:0];
wire [6:0] index;

initial begin 
//read from hex file
$readmemh("instruction.hex", memory);
end

//read from memory 
always@(*) begin
Ins = memory[index];
end

//convert byte address to word address
assign index =current_pc>>2;
endmodule
