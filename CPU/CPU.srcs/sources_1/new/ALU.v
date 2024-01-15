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

//��ɶ��������ݵ������߼�����
module ALU(A,B,ALUresult,ALUOp,Zero,shamt);//�����߼���Ԫ
      input [31:0] A;//����
      input [31:0] B;
      input [3:0] ALUOp;
      input [4:0] shamt;
      output reg Zero;//���
      output reg[31:0] ALUresult;//������
        
      always @(*)begin
          case(ALUOp)
          4'b0000: ALUresult=A+B;
          4'b0001: begin  ALUresult=A-B;  Zero=(ALUresult==0) ? 1:0; end  //����ָ���beq��bneָ��
          4'b0010: ALUresult=A&B; //��
          4'b0011: ALUresult=A|B; //��
          4'b0100: ALUresult=A^B;  //���
          4'b0101: ALUresult=~(A|B); //ͬ��
          4'b0110: ALUresult=A<B ? 1:0; // �Ƚ�����
          4'b0111: ALUresult=B<<shamt; //�߼����ƺ���������
          4'b1000: ALUresult=B>>shamt; //�߼����ƺ���������
          4'b1001: ALUresult=B<<A;  
          4'B1010: ALUresult=B>>A;
          endcase
 
      end    
endmodule
