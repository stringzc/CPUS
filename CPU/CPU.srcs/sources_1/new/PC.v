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

//PC总是指向下一条将要执行的指令地址，即将要执行的指令代码
module PC(npc,PCWr,CLK,Reset,pc);//程序计数器
         input [31:0] npc; //下一条指令的地址
         input PCWr; //PC写使能，高电平有效  
         input CLK,Reset; 
         output reg [31:0] pc;  //当前指令的地址     
    always @(posedge CLK or posedge Reset)  //时钟上升沿触发，Reset高电平地址清零
       begin 
          if(Reset==1) pc<=32'b0;//高电平，地址清零，指向第一条指令地址，32位二进制0
          else  
          begin 
          if(PCWr==0) pc<=pc;//当前地址
          else pc<=npc;//指向下一条指令地址
          end
    end   
endmodule
