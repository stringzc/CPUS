`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 20:50:55
// Design Name: 
// Module Name: Flopr
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

//将四个缓冲器例化
module Flopr(CLK,B_in,A_in,ALUOut_in,DR_in,B_out,A_out,ALUOut_out,DR_out);//数据寄存器,数据缓冲，由带复位的D触发器构成
       input CLK;
       input [31:0] B_in,A_in,ALUOut_in,DR_in;
       output [31:0] B_out,A_out,ALUOut_out,DR_out;
      
    A u1(
    .CLK(CLK),
    .indata(A_in),
    .outdata(A_out)
        );
    
    B u2(
    .CLK(CLK),
    .indata(B_in),
    .outdata(B_out)
        );
    ALUOut u3(
    .CLK(CLK),
    .indata(ALUOut_in),
    .outdata(ALUOut_out)
              );
    DR u4(
    .CLK(CLK),
    .indata(DR_in),
    .outdata(DR_out)
          );
    
endmodule
