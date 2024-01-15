`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/28 17:12:39
// Design Name: 
// Module Name: NPC
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

//������һ��ָ���ַ
module NPC(pc,npc,NPCOp,rsD,address,imm16SExt,pc_addfour);//NextPC���㵥Ԫ
    input   [31:0] pc;//��ǰָ���ַ
    input   [25:0] address; //j����ָ����adress
    input   [31:0] imm16SExt; //bne,beqָ��
    input   [1:0]  NPCOp; //��һ��ָ���ַ���γɷ�ʽ
    input   [31:0] rsD; //jr
    output  [31:0] pc_addfour; //pc+4
    output  reg [31:0] npc; //��һ��ָ��ĵ�ַ
    
    reg [27:0] midaddress;
      
    assign pc_addfour=pc+4; //��λһ����
       
    always @ (*) begin
    case(NPCOp)//������μ���NPC
       2'b00 : begin  npc=rsD; end //��תjr������jrָ��Ĺ���pc�� rs
       2'b01 : begin  midaddress=address<<2;  npc={pc[31:28],midaddress[27:0]};end //j����ָ��
       2'b10 : begin  npc=pc+4+(imm16SExt<<2); end //����ת��beq ,��ָ֧��bne
       2'b11 : begin  npc=pc+4;end  //һ���ָ��
    endcase
         
    end

endmodule
