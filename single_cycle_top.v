`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2026 11:53:29 AM
// Design Name: 
// Module Name: single_cycle_top
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


module single_cycle_top(
input clk,
input rst
    );

wire [31:0] Ins;
wire [31:0] Op1;
wire [31:0] Op2; 
wire [31:0] BusA;
wire [31:0] BusB;
wire RegWrite;
wire [31:0] BusW;
wire [3:0] ALUCtrl;
wire zero;
wire [1:0] ALUOp;
wire [31:0] write_data;
wire MemWrite;
wire MemRead;
wire [31:0] read_data;
wire ALUSrc;
wire MemtoReg;
wire jump;
wire branch;
wire [31:0] current_pc;
wire [31:0] next_pc;
wire [31:0] ALUResult;
wire [31:0] Imm_Ext_Ins;
wire [31:0] Op2_out;
wire [31:0] WriteBackData;

//module instantiation   
    register_file register_file_inst(
    .Ra(Ins[19:15]),
    .Rb(Ins[24:20]),
    .Rw(Ins[11:7]),
    .clk(clk),
    .RegWrite(RegWrite),
    .BusW(WriteBackData),  
    .Op1(Op1),
    .Op2(Op2)
    );
    
   ALU ALU_inst(
    .BusA(Op1),
    .BusB(Op2_out),
    .ALUCtrl(ALUCtrl),
    .zero(zero),
    .ALUResult(ALUResult)
   ); 
    
   alu_control_unit alu_control_unit_inst(
   .ALUOp(ALUOp),
   .funct3(Ins[14:12]),
   .funct7(Ins[31:25]),
   .ALUCtrl(ALUCtrl)
   ); 
   
   Data_Memory Data_Memory_inst(
   .data_mem_addr(ALUResult),
   .write_data(Op2),
   .MemWrite(MemWrite),
   .MemRead(MemRead),
   .clk(clk),
   .read_data(read_data)   
   );
   
   control_unit control_unit_inst(
   .opcode(Ins[6:0]),
   .RegWrite(RegWrite),
   .MemWrite(MemWrite),
   .MemRead(MemRead),
   .ALUSrc(ALUSrc),
   .MemtoReg(MemtoReg),
   .ALUOp(ALUOp),
  .jump(jump),
  .branch(branch)
     );
     
     inst_mem inst_mem_inst(
     .current_pc(current_pc),
     .Ins(Ins)
     );
     
     sign_extender sign_extender_inst(
     .Ins(Ins),
     .opcode(Ins[6:0]),
     .Imm_Ext_Ins(Imm_Ext_Ins)
     );
    
    program_counter program_counter_inst(
    .clk(clk),
    .rst(rst),
    .Ins(Ins),
    .opcode(Ins[6:0]),
    .branch(branch),
    .jump(jump),
    .zero(zero),
    .current_pc(current_pc),
    .next_pc(next_pc),
    .Imm_Ext_Ins(Imm_Ext_Ins)
    );
    
    ALU_MUX ALU_MUX_inst(
    .Op2(Op2),
    .Imm_Ext_Ins(Imm_Ext_Ins),
    .ALUSrc(ALUSrc),
    .Op2_out(Op2_out)
    );
    
    Write_back_MUX Write_back_MUX_inst(
    .read_data(read_data),
    .ALUResult(ALUResult),
    .MemtoReg(MemtoReg),
    .WriteBackData(WriteBackData)
    );    
    
endmodule
