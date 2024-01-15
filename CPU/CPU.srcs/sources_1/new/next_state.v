`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/04 13:47:19
// Design Name: 
// Module Name: next_state
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
module next_state(state_in,state_next,op,funct);
       input  [2:0] state_in; //当前状态
       input  [5:0] op;
       input  [5:0] funct;
       output reg [2:0] state_next; //下一状态
       //当前状态根据指令类型等等因素决定下一状态
       parameter [2:0]   IF=3'b000,
                           ID=3'b001,
                           RI_EXE=3'b110,
                           b_EXE=3'b101,
                           sl_EXE=3'b010,
                           MEM=3'b011,
                           RI_WB=3'b111,
                           l_WB=3'b100;
       
       always @(state_in or op or funct ) begin
        case(state_in) 
          IF: state_next=ID;
          ID: begin
                  case(op) 
                  6'b0: begin  if(funct==6'b001000) state_next=IF;//jr
                               else   state_next=RI_EXE; //R
                        end
                  6'b000010: state_next=IF; //j
                  6'b000011: state_next=IF; //jal
                
                  6'b000100: state_next=b_EXE; //beq
                  6'b000101: state_next=b_EXE; //bne
                
                  6'b100011: state_next=sl_EXE; //lw
                  6'b101011: state_next=sl_EXE; //sw 
                  default:   state_next=RI_EXE; //I
                  endcase
              end
          RI_EXE: state_next=RI_WB;
          b_EXE : state_next=IF;
          sl_EXE: state_next=MEM;    
          RI_WB : state_next=IF;
          
          MEM   : begin
                       if(op==6'b100011) state_next=l_WB;
                       else state_next=IF;
                  end
          l_WB  : state_next=IF;        
       endcase
       end
endmodule
