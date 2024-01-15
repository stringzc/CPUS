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


module muxSource(readD2,imm16,B,ALUSrc); //选择第二源操作数数据选择器
       input  [31:0] readD2;
       input  [31:0] imm16;
       input  ALUSrc;
       output reg [31:0] B;
       
       always @ (*) begin
              if(ALUSrc==1) B<=imm16; //第二源操作数为16位立即数
              else B<=readD2;  //第二源操作数为16位（rt）
       end
endmodule
