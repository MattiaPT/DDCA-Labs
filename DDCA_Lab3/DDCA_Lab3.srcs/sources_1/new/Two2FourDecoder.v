`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2023 01:05:26 PM
// Design Name: 
// Module Name: Two2FourDecoder
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


module Two2FourDecoder(
    input [1:0] a,
    output [3:0] out
    );
    
    wire na0, na1;
    not n1 (na0, a[0]);
    not n2 (na1, a[1]);
    
    nand a1 (out[0], a[0], a[1]);
    nand a2 (out[1], na0, a[1]);
    nand a3 (out[2], a[0], na1);
    nand a4 (out[3], na0, na1);
endmodule