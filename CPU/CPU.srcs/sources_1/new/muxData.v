`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/01 16:10:18
// Design Name: 
// Module Name: muxData
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module muxData(dataFromALU,dataFromDM,dataFromPC4,jal,Memtoreg,writeD); //ѡ��������Դ����ѡ����
       input [31:0] dataFromALU;
       input [31:0] dataFromDM;
       input [31:0] dataFromPC4;
       input jal,Memtoreg;
       output  reg [31:0] writeD;
       
       always @(*) begin
           if(jal==1) writeD<=dataFromPC4; //д��Ŀ��Ĵ�������������pc+8
           else
              if(Memtoreg==1) writeD<=dataFromDM; //�������ݼĴ���DM���������ݣ�д��Ŀ��Ĵ�����ָ��lw
              else writeD<=dataFromALU; //����ALU����������
       end
       
endmodule
