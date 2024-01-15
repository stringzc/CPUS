`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/03 09:47:17
// Design Name: 
// Module Name: Ctrl
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

//Ctrl模块由一个D触发器模块，下一状态模块，输出信号模块组成
module Ctrl(CLK,Reset,op,Zero,funct,
                  PCWr,IRWr,NPCOp,RFWr,ExtOp,ALUOp,DMWr,RegDst,Memtoreg,jal,ALUSrc);//控制单元
       input CLK,Reset;
       
    
       input [5:0] op;
       input [5:0] funct;
       input Zero;
       //Ctrl模块输出到各个模块所需要的信号
       output  PCWr,IRWr,RFWr,DMWr,ExtOp,RegDst,Memtoreg,jal,ALUSrc;
       output  [1:0] NPCOp;
       output  [3:0] ALUOp;     
       
       wire [2:0] state_out;
       wire [2:0] state_next;
       
       D u1(
       .CLK(CLK),
       .Reset(Reset),
       .state_in(state_next),
       .state_out(state_out)
       );
       
       next_state u2(
       .op(op),
       .funct(funct),
       .state_in(state_out),
       .state_next(state_next)
       );
       
       signal_out u3(
       .op(op),
       .funct(funct),
       .Zero(Zero),
       .state(state_out),
       .PCWr(PCWr),
       .IRWr(IRWr),
       .RFWr(RFWr),
       .DMWr(DMWr),
       .ExtOp(ExtOp),
       .RegDst(RegDst),
       .Memtoreg(Memtoreg),
       .jal(jal),
       .ALUSrc(ALUSrc),
       .NPCOp(NPCOp),
       .ALUOp(ALUOp)
       );
       
   
endmodule
