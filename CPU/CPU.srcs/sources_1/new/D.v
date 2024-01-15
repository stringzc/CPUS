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


module D(CLK,Reset,state_in,state_out);//D触发器
       input CLK;
       input Reset;
       input [2:0] state_in;  //下一状态
       output reg [2:0] state_out; //当前状态
       
       always @ (negedge CLK or posedge Reset) begin //时钟下降沿触发，Reset高电平初始化
             if(Reset==1) state_out<=3'b000;
             else state_out<=state_in;
       end 
       
endmodule
