`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/31 20:25:15
// Design Name: 
// Module Name: EXT
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


module EXT(imm16,ExtOp,IMM16 );//��չ��Ԫ����16λ��������չΪ32λ����
      input [15:0] imm16;//��Ҫ������չ��������
      input ExtOp;//��չ��ʽ�Ŀ����ź�
      output [31:0] IMM16;//��չ���
      //16λ����������չ������ָ���ȷ���Ƿ�����չ��������չ
      assign IMM16[15:0]=imm16;
      assign IMM16[31:16]=ExtOp ? (imm16[15] ? 16'hffff : 16'h0000):16'h0000;//0����������չ,1�����з�����չ

endmodule
