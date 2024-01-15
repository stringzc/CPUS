`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/01 16:25:30
// Design Name: 
// Module Name: muxDes
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


module muxDes(rt,rd,writeR,RegDst,jal);//选择目标寄存器数据选择器
       input  [4:0] rt;//第2个源操作数寄存器
       input  [4:0] rd;//目的操作数寄存器
       input  RegDst;
       input  jal;
       output reg [4:0]  writeR;
       
       always @ (*) begin
             if(jal==1) writeR<=31; //jal指令，目标寄存器为$31
             else 
                 if(RegDst==1) writeR<=rd; //目标寄存器为rd
                 else writeR<=rt; //目标寄存器为rt
       end
      
endmodule
