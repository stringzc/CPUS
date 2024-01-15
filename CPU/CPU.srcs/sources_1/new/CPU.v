`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/28 19:20:41
// Design Name: 
// Module Name: CPU
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


module CPU(CLK,Reset);
     input CLK,Reset;      
     wire [31:0] pc_out;   //PC到IM和NPC
     wire [31:0] NPC_PC;   //NPC到PC
     wire [1:0]  NPCOp;
     wire [25:0] address;
     wire [31:0] pc_addfour;
     wire [31:0] IM_IR;    //IM到IR
     wire PCWr;            //控制信号PCWr
     wire IRWr;            //控制信号IRWr
     wire RegDst;
     wire jal;
     wire RFWr;
     wire ExtOp;
     wire ALUSrc;
     wire Memtoreg;
     wire [3:0] ALUOp;
     wire Zero;
     wire DMWr;
     wire [5:0] op;
     wire [5:0] funct;
     wire [4:0] shamt;
     wire [15:0] imm16;
     wire [31:0] IMM16;
     
     wire [4:0] rs;  //rs与readR1之间的连线
     wire [4:0] rt;  //从rt延伸的连线，分别接到readR2和muxDes
     wire [4:0] rd;   //从rd延伸的连线，接到muxDes
     wire [4:0] writeR;
     wire [31:0] writeD;
     wire [31:0] readD1;
     wire [31:0] readD2;
     
     wire [31:0] A_out;
     wire [31:0] B_out;
     wire [31:0] B;
     wire [31:0] ALUresult;
     wire [31:0] ALUOut_out;
     wire [31:0] read_data;
     wire [31:0] DR_out;
     PC PC(
     .CLK(CLK),
     .Reset(Reset),
     .PCWr(PCWr),   
     .npc(NPC_PC),
     .pc(pc_out)
         );
    
     
     IM IM(
      .addr(pc_out),
      .data(IM_IR)
     );
     
     NPC NPC(
     .pc(pc_out),
     .npc(NPC_PC),
     .NPCOp(NPCOp),
     .pc_addfour(pc_addfour),
     .address(address),
     .rsD(A_out),
     .imm16SExt(IMM16)
     );
     
     IR IR(
     .CLK(CLK),
     .IRWr(IRWr),
     .data(IM_IR),
     .op(op),
     .funct(funct),
     .rs(rs),
     .rt(rt),
     .rd(rd), 
     .imm16(imm16),
     .address(address),
     .shamt(shamt)
    
     );
     
     Ctrl Ctrl(
     .CLK(CLK),
     .Reset(Reset),
     .PCWr(PCWr),
     .NPCOp(NPCOp),
     .IRWr(IRWr),
     .RFWr(RFWr),
     .op(op),
     .funct(funct),
     .ExtOp(ExtOp),
     .Memtoreg(Memtoreg),
     .jal(jal),
     .ALUSrc(ALUSrc),
     .ALUOp(ALUOp),
     .Zero(Zero),
     .DMWr(DMWr),
     .RegDst(RegDst)
     );
     
     mux mux(
     .rd(rd),
     .rt(rt),
     .writeR(writeR),
     .RegDst(RegDst),
     .jal(jal),
     
     .readD2(B_out),
     .imm16(IMM16),
     .ALUSrc(ALUSrc),
     .B(B),
     
     .dataFromALU(ALUOut_out),
     .dataFromDM(DR_out),
     .dataFromPC4(pc_addfour),
     .Memtoreg(Memtoreg),
     .writeD(writeD)
     );

     
     RF RF(
     .readR1(rs),
     .readR2(rt),
     .writeR(writeR),
     .writeD(writeD),
     .RFWr(RFWr),
     .readD1(readD1),
     .readD2(readD2)
     );
     
     Flopr Flopr(
     .CLK(CLK),
     .A_in(readD1),
     .B_in(readD2),
     .A_out(A_out),
     .B_out(B_out),
     .ALUOut_in(ALUresult),
     .DR_in(read_data),
     .ALUOut_out(ALUOut_out),
     .DR_out(DR_out)
     
     
     );
     
     EXT EXT(
     .imm16(imm16),
     .ExtOp(ExtOp),
     .IMM16(IMM16)
     );
     
     ALU ALU(
     .A(A_out),
     .B(B),
     .ALUOp(ALUOp),
     .Zero(Zero),
     .ALUresult(ALUresult),
     .shamt(shamt)
     );
     
     DM DM(
     .CLK(CLK),
     .DMWr(DMWr),
     .Address(ALUOut_out),
     .write_data(B_out),
     .read_data(read_data)
     
     
     );
endmodule
