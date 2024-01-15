`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/01/02 21:17:33
// Design Name: 
// Module Name: B
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


module B(CLK,indata,outdata);
       input  CLK;
       input  [31:0] indata;
       output reg [31:0] outdata;
       
       always @ (posedge CLK) begin
              outdata<=indata;
       end
       
endmodule
