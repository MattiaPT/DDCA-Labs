`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 08:26:31 PM
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(
    input[3:0] a,
    input[3:0] b,
    output[4:0] s
);
    wire n1, n2, n3;
    FullAdder bit_one (a[0], b[0], 0, s[0], n1);
    FullAdder bit_two (a[1], b[1], n1, s[1], n2);
    FullAdder bit_three (a[2], b[2], n2, s[2], n3);
    FullAdder bit_four (a[3], b[3], n3, s[3], s[4]);
endmodule
