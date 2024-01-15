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

//计算下一条指令地址
module NPC(pc,npc,NPCOp,rsD,address,imm16SExt,pc_addfour);//NextPC计算单元
    input   [31:0] pc;//当前指令地址
    input   [25:0] address; //j类型指令传入的adress
    input   [31:0] imm16SExt; //bne,beq指令
    input   [1:0]  NPCOp; //下一条指令地址的形成方式
    input   [31:0] rsD; //jr
    output  [31:0] pc_addfour; //pc+4
    output  reg [31:0] npc; //下一条指令的地址
    
    reg [27:0] midaddress;
      
    assign pc_addfour=pc+4; //四位一部分
       
    always @ (*) begin
    case(NPCOp)//决定如何计算NPC
       2'b00 : begin  npc=rsD; end //跳转jr，根据jr指令的功能pc← rs
       2'b01 : begin  midaddress=address<<2;  npc={pc[31:28],midaddress[27:0]};end //j类型指令
       2'b10 : begin  npc=pc+4+(imm16SExt<<2); end //等于转移beq ,分支指令bne
       2'b11 : begin  npc=pc+4;end  //一般的指令
    endcase
         
    end

endmodule
