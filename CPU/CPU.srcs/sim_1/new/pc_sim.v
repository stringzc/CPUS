`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/29 14:59:43
// Design Name: 
// Module Name: pc_sim
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


module pc_sim();
     reg clk=0,rst=0,PCWr=0;
     reg [31:0] npc;
     wire [31:0] pc;
    PC uut(npc,PCWr,clk,rst,pc);
    initial begin
     #15 rst=1;
     #20 PCWr=1;
    end
    always #5 clk=~clk;
    
endmodule
