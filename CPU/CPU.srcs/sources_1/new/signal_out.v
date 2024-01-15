`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/04 13:47:53
// Design Name: 
// Module Name: signal_out
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

//取指令IF，指令译码ID，指令执行EXE，存储器访问MEM，结果写回WB
module signal_out(state,op,Zero,funct,
                  PCWr,IRWr,NPCOp,RFWr,ExtOp,ALUOp,DMWr,RegDst,Memtoreg,jal,ALUSrc);
       input [2:0] state;
       input [5:0] op;
       input [5:0] funct;
       input Zero;
       
       output reg PCWr,IRWr,RFWr,DMWr,ExtOp,RegDst,Memtoreg,jal,ALUSrc;
       output reg [1:0] NPCOp;
       output reg [3:0] ALUOp;         
       
       parameter [2:0]           IF=3'b000,
                                  ID=3'b001,
                                  RI_EXE=3'b110,
                                  b_EXE=3'b101,
                                  sl_EXE=3'b010,
                                  MEM=3'b011,
                                  RI_WB=3'b111,
                                  l_WB=3'b100;
                                  
//在某一状态下，根据指令来确定应该输出哪些控制信号
       always @(*) begin
        case(state)
         IF: begin 
             PCWr=1;
             IRWr=1;
             RFWr=0;
             DMWr=0;
    
         end    
         ID: begin
             PCWr=0;
             IRWr=0;
             RFWr=0;
             DMWr=0;
             case(op) 
               6'b000000: begin  if(funct==6'b001000) NPCOp=2'b00;//jr
                            else   begin NPCOp=2'b11; jal=0;RegDst=1; ALUSrc=0; end //R
                     end
             6'b000010:  NPCOp=2'b01;   //j
             6'b000011: begin  NPCOp=2'b01; jal=1; RFWr=1; end   //jal
           
             6'b000100:begin ALUSrc=0; ExtOp=1;    end //beq
           
             6'b100011: begin  NPCOp=2'b11; jal=0;  RegDst=0; ALUSrc=1;  ExtOp=1; end //lw
             6'b101011: begin  NPCOp=2'b11; ALUSrc=1; ExtOp=1;   end//sw 
             default:  begin   NPCOp=2'b11; jal=0; RegDst=0; ALUSrc=1;  ExtOp=0;  end   //I
             endcase
         end
         RI_EXE: begin
           PCWr=0;
           IRWr=0;
           RFWr=0;
           DMWr=0;
           case(op)
           6'b001000 : ALUOp=4'b0000; //addi
           6'b001001 : ALUOp=4'b0000; //addiu
           6'b001100 : ALUOp=4'b0010; //andi
           6'b001101 : ALUOp=4'b0011; //ori
           6'b001110 : ALUOp=4'b0100; //xori
           6'b001010 : ALUOp=4'b0110; //slti
           6'b001011 : ALUOp=4'b0110; //sltiu
           6'b000000 :   //R
                case(funct)
                6'b100001 : ALUOp=4'b0000; //addu
                6'b100011 : ALUOp=4'b0001; //subu
                6'b100000 : ALUOp=4'b0000; //add
                6'b100010 : ALUOp=4'b0001; //sub
                6'b100100 : ALUOp=4'b0010; //and
                6'b100101 : ALUOp=4'b0011; //or
                6'b100110 : ALUOp=4'b0100; //xor
                6'b100111 : ALUOp=4'b0101; //nor
                6'b101010 : ALUOp=4'b0110; //slt
                6'b101011 : ALUOp=4'b0110; //sltu
                6'b000000 : ALUOp=4'b0111; //sll
                6'b000010 : ALUOp=4'b1000; //srl
                6'b000011 : ALUOp=4'b1000; //sra
                6'b000100 : ALUOp=4'b1001; //sllv
                6'b000110 : ALUOp=4'b1010; //srlv
                6'b000111 : ALUOp=4'b1010; //srav
                
                
                endcase
           endcase     
         end
         
         RI_WB: begin
         PCWr=0;
         IRWr=0;
         RFWr=1;
         DMWr=0;
         Memtoreg=0;
         end
         
         b_EXE: begin
         PCWr=0; //Zero=1 beq ; =0 bne
         IRWr=0;
         RFWr=0;
         DMWr=0;
         if(Zero==1) NPCOp=2'b10;
         else NPCOp=2'b11;
         ALUOp=2'b01;
         end
         
         sl_EXE: begin
         PCWr=0;
         IRWr=0;
         RFWr=0;
         DMWr=0;
         ALUOp=2'b00;   
         end
         
         MEM: begin
         PCWr=0;
         IRWr=0;
         RFWr=0;
         if(op==6'b101011) begin DMWr=1; end  //sw
         else if(op==6'b100011) begin  DMWr=0; end //lw
         end
         
         l_WB: begin
         PCWr=0;
         IRWr=0;
         RFWr=1;
         DMWr=0;
         Memtoreg=1;
         end
         
         
                            
       endcase
       end
endmodule
