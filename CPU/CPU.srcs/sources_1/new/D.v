`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/04 13:46:36
// Design Name: 
// Module Name: D
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


module D(CLK,Reset,state_in,state_out);//D������
       input CLK;
       input Reset;
       input [2:0] state_in;  //��һ״̬
       output reg [2:0] state_out; //��ǰ״̬
       
       always @ (negedge CLK or posedge Reset) begin //ʱ���½��ش�����Reset�ߵ�ƽ��ʼ��
             if(Reset==1) state_out<=3'b000;
             else state_out<=state_in;
       end 
       
endmodule
