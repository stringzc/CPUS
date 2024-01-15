`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/03 09:32:09
// Design Name: 
// Module Name: mux
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

//��ģ�齫��������ѡ����ģ��ʵ����
module mux(readD2,imm16,ALUSrc,B,rt,rd,RegDst,jal,writeR,dataFromALU,dataFromDM,dataFromPC4,Memtoreg,writeD);//����ѡ����
       //ѡ��ڶ�Դ����������ѡ����
       input   [31:0] readD2;
       input   [31:0] imm16;
       input   ALUSrc;
       output  [31:0] B;
       //ѡ��Ŀ��Ĵ�������ѡ����
       input  [4:0] rt;
       input  [4:0] rd;
       input  RegDst;
       input  jal;
       output [4:0]  writeR;
       //ѡ��������Դ����ѡ����
       input   [31:0] dataFromALU;
       input   [31:0] dataFromDM;
       input   [31:0] dataFromPC4;
       input   Memtoreg;
       output  [31:0] writeD;
      
    muxSource u1(
       .readD2(readD2),
       .imm16(imm16),
       .ALUSrc(ALUSrc),
       .B(B) 
    );
    
    muxDes  u2(
       .rt(rt),
       .rd(rd),
       .RegDst(RegDst),
       .jal(jal),
       .writeR(writeR)
    );
    
    muxData  u3(
       .dataFromALU(dataFromALU),
       .dataFromDM(dataFromDM),
       .dataFromPC4(dataFromPC4),
       .jal(jal),
       .Memtoreg(Memtoreg),
       .writeD(writeD)
    );
       
       
endmodule
