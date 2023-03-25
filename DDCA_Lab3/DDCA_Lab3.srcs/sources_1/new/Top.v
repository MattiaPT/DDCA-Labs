`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 05:07:59 PM
// Design Name: 
// Module Name: Top
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


module Top(
    input [3:0] a,
    input [3:0] b,
    input [1:0] s,
    
    output [3:0] D,
    output [7:0] out
);  
    
    Two2FourDecoder d (s, D);

    wire [4:0] sum;
    FourBitAdder addition (a, b, sum);
    
    Decoder decode (sum[3:0], out[6:0]);
    assign out[7] = sum[4];
    
endmodule