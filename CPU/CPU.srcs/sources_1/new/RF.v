`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/30 20:13:17
// Design Name: 
// Module Name: RF
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
module RF(readR1,readR2,readD1,readD2,writeR,writeD,RFWr);//ͨ�üĴ�����
       input [4:0] readR1; //rs
       input [4:0] readR2; //rt
       input [4:0] writeR; //rd
       input [31:0] writeD;
       input RFWr; //Regwrite����������д�أ�
       output [31:0] readD1;
       output [31:0] readD2;
       
       reg [31:0] Register [31:0];//��ʮ������ʮ��λ�ļĴ���
       integer i;
       initial begin
           for(i=0;i<32;i=i+1) 
              Register[i]=32'b0; 
       end
 
       assign   readD1=Register[readR1];
       assign   readD2=Register[readR2];
       
       always @(*) begin
       if(RFWr==1)   begin
          Register[writeR]=writeD; 
          `ifdef DEBUG  //���ԣ���32���Ĵ������������뵽����̨���Ա�۲�
          $display("R[00-07]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", 0, Register[1], Register[2], Register[3], Register[4], Register[5], Register[6], Register[7]);
          $display("R[08-15]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Register[8], Register[9], Register[10], Register[11], Register[12], Register[13], Register[14], Register[15]);
          $display("R[16-23]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Register[16], Register[17], Register[18], Register[19], Register[20], Register[21], Register[22], Register[23]);
          $display("R[24-31]=%8X, %8X, %8X, %8X, %8X, %8X, %8X, %8X", Register[24], Register[25], Register[26], Register[27], Register[28], Register[29], Register[30], Register[31]);
          `endif
        end  
       end       
endmodule
