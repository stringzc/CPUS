`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 21:18:25
// Design Name: 
// Module Name: ALUOut
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
module ALUOut(CLK,indata,outdata);
       input  CLK;
       input  [31:0] indata;
       output reg [31:0] outdata;
       
       always @ (posedge CLK) begin//…œ…˝—ÿ”––ß
              outdata<=indata;
       end
       
endmodule