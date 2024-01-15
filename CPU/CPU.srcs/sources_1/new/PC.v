`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/28 15:21:11
// Design Name: 
// Module Name: PC
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

//PC����ָ����һ����Ҫִ�е�ָ���ַ������Ҫִ�е�ָ�����
module PC(npc,PCWr,CLK,Reset,pc);//���������
         input [31:0] npc; //��һ��ָ��ĵ�ַ
         input PCWr; //PCдʹ�ܣ��ߵ�ƽ��Ч  
         input CLK,Reset; 
         output reg [31:0] pc;  //��ǰָ��ĵ�ַ     
    always @(posedge CLK or posedge Reset)  //ʱ�������ش�����Reset�ߵ�ƽ��ַ����
       begin 
          if(Reset==1) pc<=32'b0;//�ߵ�ƽ����ַ���㣬ָ���һ��ָ���ַ��32λ������0
          else  
          begin 
          if(PCWr==0) pc<=pc;//��ǰ��ַ
          else pc<=npc;//ָ����һ��ָ���ַ
          end
    end   
endmodule
