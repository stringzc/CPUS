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

//读出对应的32位指令
module IM(addr,data);//指令存储器
      input [31:0] addr; //从pc模块传入的指令地址,当前指令地址
      output reg [31:0] data; //输出的指令，当前指令
      
      reg [7:0] im [4095:0];  //定义指令存储器 ，一个字节一个地址的存储
           
    always @(*)
        begin//根据导入的地址确定指令
         data[7:0]=im[addr];
         data[15:8]=im[addr+1];
         data[23:16]=im[addr+2];
         data[31:24]=im[addr+3];
        end
        
endmodule
