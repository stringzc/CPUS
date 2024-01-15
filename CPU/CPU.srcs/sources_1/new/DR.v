`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 21:18:49
// Design Name: 
// Module Name: DR
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

module DR(CLK,indata,outdata);
       input  CLK;
       input  [31:0] indata;
       output reg [31:0] outdata;
       
       always @ (posedge CLK) begin
              outdata<=indata;
       end
       
endmodule
