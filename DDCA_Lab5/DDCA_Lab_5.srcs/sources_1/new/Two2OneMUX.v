`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 04:48:30 PM
// Design Name: 
// Module Name: Two2OneMUX
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


module Two2OneMUX(
    input [31:0] A,
    input [31:0] B,
    input switch,
    
    output reg [31:0] out
    );
    
    always @ (*) 
    begin
    if (switch)
        out = B;
    else
        out = A;
    end    
endmodule
