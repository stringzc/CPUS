`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/30 15:26:55
// Design Name: 
// Module Name: IR
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

//��ɶ�����IM��ָ��Ļ���
module IR(CLK,IRWr,data,op,rs,rt,rd,funct,imm16,address,shamt);//ָ��Ĵ���
      input  CLK;
      input  IRWr;//==1 ���Ĵ�����ָ�������ָ��Ĵ���дʹ���źţ��ߵ�ƽ��Ч
      input  [31:0]  data;//ָ������
      //���ָ��ĸ�������
      output reg [5:0] op;//������
      output reg [4:0] rs,rt,rd;//��1Դ����������2Դ��������Ŀ�Ĳ�����
      output reg [5:0] funct; //������
      output reg [15:0] imm16;//16λ������
      output reg [25:0] address;//��ַ
      output reg [4:0] shamt;//λ����

      always @(posedge CLK) begin //ʱ���½��ش���
             if(IRWr==1) begin //IRWr=1�����ָ��ĸ�������
             op=data[31:26];//ָ���Ӧ�ĵ�ַ
             rs=data[25:21];
             rt=data[20:16];
             rd=data[15:11];
             funct=data[5:0];
             imm16=data[15:0];
             address=data[25:0];
             shamt=data[10:6];
             end
      end
endmodule
