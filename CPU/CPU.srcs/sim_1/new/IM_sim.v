`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/29 16:37:10
// Design Name: 
// Module Name: IM_sim
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


module IM_sim( );
    reg [31:0] addr;
    wire [31:0] data;
    
    IM uut(addr,data);
    initial begin
    addr=32'b0;
    end
    always #15 addr=addr+4;
endmodule
