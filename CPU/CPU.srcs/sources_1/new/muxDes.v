`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/01 16:25:30
// Design Name: 
// Module Name: muxDes
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


module muxDes(rt,rd,writeR,RegDst,jal);//ѡ��Ŀ��Ĵ�������ѡ����
       input  [4:0] rt;//��2��Դ�������Ĵ���
       input  [4:0] rd;//Ŀ�Ĳ������Ĵ���
       input  RegDst;
       input  jal;
       output reg [4:0]  writeR;
       
       always @ (*) begin
             if(jal==1) writeR<=31; //jalָ�Ŀ��Ĵ���Ϊ$31
             else 
                 if(RegDst==1) writeR<=rd; //Ŀ��Ĵ���Ϊrd
                 else writeR<=rt; //Ŀ��Ĵ���Ϊrt
       end
      
endmodule
