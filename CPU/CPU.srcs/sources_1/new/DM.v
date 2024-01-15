`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 19:11:13
// Design Name: 
// Module Name: DM
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

`include "DEBUG.v"
module DM(CLK,Address,DMWr,write_data,read_data);//���ݴ洢�������ָ�������lw�ʹ洢��sw
          input  CLK;
          input  [31:0] Address;
          input  DMWr;//==1 ��洢��д�����ݣ�==0 �Ӵ洢����������,���ݴ洢��дʹ�ܣ��ߵ�ƽ��Ч
          input  [31:0] write_data;//��洢��д������ݣ�
          output  reg [31:0] read_data; //�Ӵ洢������������;
          
           reg [7:0] dm [4095:0]; //�������ݴ洢����һ���ֽ�һ����ַ
            
           integer i;
           initial begin
           for(i=0;i<4096;i=i+1)
              dm[i]<=8'b0;
           end
          
          always @ (posedge CLK) begin//��������Ч
          if(DMWr==1) begin   //�洢��sw
            dm[Address]<=write_data[7:0];
            dm[Address+1]<=write_data[15:8];
            dm[Address+2]<=write_data[23:16];
            dm[Address+3]<=write_data[31:24];  
            end
          else
             begin   //������lw
               read_data[7:0]<=dm[Address];
               read_data[15:8]<=dm[Address+1];
               read_data[23:16]<=dm[Address+2];
               read_data[31:24]<=dm[Address+3];
             end  
          end
          
endmodule

