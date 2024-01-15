`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/31 20:25:15
// Design Name: 
// Module Name: EXT
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


module EXT(imm16,ExtOp,IMM16 );//扩展单元，将16位的数据扩展为32位数据
      input [15:0] imm16;//需要进行扩展的立即数
      input ExtOp;//扩展方式的控制信号
      output [31:0] IMM16;//扩展结果
      //16位立即数的扩展，根据指令，来确定是符号扩展还是零扩展
      assign IMM16[15:0]=imm16;
      assign IMM16[31:16]=ExtOp ? (imm16[15] ? 16'hffff : 16'h0000):16'h0000;//0：进行零扩展,1：进行符号扩展

endmodule
