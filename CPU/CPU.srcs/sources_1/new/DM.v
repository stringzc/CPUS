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
module DM(CLK,Address,DMWr,write_data,read_data);//数据存储器，完成指令加载字lw和存储字sw
          input  CLK;
          input  [31:0] Address;
          input  DMWr;//==1 向存储器写入数据；==0 从存储器读出数据,数据存储器写使能，高电平有效
          input  [31:0] write_data;//向存储器写入的数据；
          output  reg [31:0] read_data; //从存储器读出的数据;
          
           reg [7:0] dm [4095:0]; //定义数据存储器，一个字节一个地址
            
           integer i;
           initial begin
           for(i=0;i<4096;i=i+1)
              dm[i]<=8'b0;
           end
          
          always @ (posedge CLK) begin//上升沿有效
          if(DMWr==1) begin   //存储字sw
            dm[Address]<=write_data[7:0];
            dm[Address+1]<=write_data[15:8];
            dm[Address+2]<=write_data[23:16];
            dm[Address+3]<=write_data[31:24];  
            end
          else
             begin   //加载字lw
               read_data[7:0]<=dm[Address];
               read_data[15:8]<=dm[Address+1];
               read_data[23:16]<=dm[Address+2];
               read_data[31:24]<=dm[Address+3];
             end  
          end
          
endmodule

