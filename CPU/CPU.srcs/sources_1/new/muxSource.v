`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/01 16:52:41
// Design Name: 
// Module Name: muxSource
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


module muxSource(readD2,imm16,B,ALUSrc); //ѡ��ڶ�Դ����������ѡ����
       input  [31:0] readD2;
       input  [31:0] imm16;
       input  ALUSrc;
       output reg [31:0] B;
       
       always @ (*) begin
              if(ALUSrc==1) B<=imm16; //�ڶ�Դ������Ϊ16λ������
              else B<=readD2;  //�ڶ�Դ������Ϊ16λ��rt��
       end
endmodule
