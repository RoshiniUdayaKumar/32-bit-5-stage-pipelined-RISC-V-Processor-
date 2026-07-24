`timescale 1ns / 1ps
module inst_mem_tb();
//port declaration 
reg [31:0] current_pc;
wire [31:0] Ins;
//module instantiation 
inst_mem inst_mem_dut (current_pc, Ins);

//stimulus 
initial begin 
current_pc = 32'd8;
#20 current_pc= 32'd0;
#20 current_pc=32'd52;
#20 current_pc=32'd4;
current_pc = 32'd64;
#20 current_pc= 32'd80;
#20 current_pc=32'd92;
#20 current_pc=32'd508;  //no data is present
end

initial begin 
#1000 $finish();
end
endmodule
