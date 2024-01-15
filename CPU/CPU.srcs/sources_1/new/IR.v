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

//完成对来自IM的指令的缓冲
module IR(CLK,IRWr,data,op,rs,rt,rd,funct,imm16,address,shamt);//指令寄存器
      input  CLK;
      input  IRWr;//==1 将寄存器的指令输出，指令寄存器写使能信号，高电平有效
      input  [31:0]  data;//指令输入
      //输出指令的各个部分
      output reg [5:0] op;//操作码
      output reg [4:0] rs,rt,rd;//第1源操作数，第2源操作数，目的操作数
      output reg [5:0] funct; //功能码
      output reg [15:0] imm16;//16位立即数
      output reg [25:0] address;//地址
      output reg [4:0] shamt;//位移量

      always @(posedge CLK) begin //时钟下降沿触发
             if(IRWr==1) begin //IRWr=1，输出指令的各个部分
             op=data[31:26];//指令对应的地址
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
