`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 21:17:00
// Design Name: 
// Module Name: A
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


module A(CLK,indata,outdata);
       input  CLK;
       input  [31:0] indata;
       output reg [31:0] outdata;
       
       always @ (posedge CLK) begin
              outdata<=indata;
       end
       
endmodule
