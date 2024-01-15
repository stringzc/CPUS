`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/28 19:41:36
// Design Name: 
// Module Name: cpu_sim
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


module cpu_sim();
      reg CLK=1;
      reg Reset=1;
      
      CPU uut(CLK,Reset);
         initial begin
          $readmemh( "D:/test2.txt" , uut.IM.im ) ;
          $monitor("PC = %8X, IR = %8X, NPC=%8X", uut.PC.pc, uut.IR.data ,uut.NPC.npc);  
         #25 Reset=0;
  
         end   
         always begin
          #10 CLK=~CLK;
   
          end 
endmodule
