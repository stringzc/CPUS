`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/28 15:31:08
// Design Name: 
// Module Name: IM
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

//������Ӧ��32λָ��
module IM(addr,data);//ָ��洢��
      input [31:0] addr; //��pcģ�鴫���ָ���ַ,��ǰָ���ַ
      output reg [31:0] data; //�����ָ���ǰָ��
      
      reg [7:0] im [4095:0];  //����ָ��洢�� ��һ���ֽ�һ����ַ�Ĵ洢
           
    always @(*)
        begin//���ݵ���ĵ�ַȷ��ָ��
         data[7:0]=im[addr];
         data[15:8]=im[addr+1];
         data[23:16]=im[addr+2];
         data[31:24]=im[addr+3];
        end
        
endmodule
