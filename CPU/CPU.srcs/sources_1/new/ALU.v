`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/31 15:31:10
// Design Name: 
// Module Name: ALU
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

//完成对输入数据的算数逻辑计算
module ALU(A,B,ALUresult,ALUOp,Zero,shamt);//算术逻辑单元
      input [31:0] A;//输入
      input [31:0] B;
      input [3:0] ALUOp;
      input [4:0] shamt;
      output reg Zero;//输出
      output reg[31:0] ALUresult;//运算结果
        
      always @(*)begin
          case(ALUOp)
          4'b0000: ALUresult=A+B;
          4'b0001: begin  ALUresult=A-B;  Zero=(ALUresult==0) ? 1:0; end  //减法指令和beq，bne指令
          4'b0010: ALUresult=A&B; //与
          4'b0011: ALUresult=A|B; //或
          4'b0100: ALUresult=A^B;  //异或
          4'b0101: ALUresult=~(A|B); //同或
          4'b0110: ALUresult=A<B ? 1:0; // 比较运算
          4'b0111: ALUresult=B<<shamt; //逻辑左移和算术左移
          4'b1000: ALUresult=B>>shamt; //逻辑右移和算术右移
          4'b1001: ALUresult=B<<A;  
          4'B1010: ALUresult=B>>A;
          endcase
 
      end    
endmodule
