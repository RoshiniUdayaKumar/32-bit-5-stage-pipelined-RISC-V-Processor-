`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/03/2026 05:18:52 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(

    input clk,
    input rst,
    input [31:0] Ins,
    input [6:0] opcode,
    input [31:0] Imm_Ext_Ins,
    input branch,
    input jump,
    input zero,
    output [31:0] current_pc,
    output [31:0] next_pc

);

    // Internal wires
    wire [31:0] pc_plus4;
    wire [31:0] PC_target;

    pc PC_Register(
        .next_pc(next_pc),
        .clk(clk),
        .rst(rst),
        .current_pc(current_pc)
    );

    Nex_PC_Adder PC_PLUS4(
        .current_pc(current_pc),
        .pc_plus4(pc_plus4)
    );

    pc_target PC_TARGET(
        .current_pc(current_pc),
        .Imm_Ext_Ins(Imm_Ext_Ins),
        .PC_target(PC_target)
    );

    PC_Mux NEXT_PC_MUX(
        .pc_plus4(pc_plus4),
        .PC_target(PC_target),
        .branch(branch),
        .jump(jump),
        .zero(zero),
        .next_pc(next_pc)
    );
    
endmodule
