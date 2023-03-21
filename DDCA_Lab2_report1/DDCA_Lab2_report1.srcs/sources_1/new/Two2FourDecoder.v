`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 01:07:09 PM
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
    input a,
    input b,
    output [3:0]out
    );
    wire na, nb;
    not not_1 (na, a);
    not not_2 (nb, b);
    
    and and_1 (out[0], a, b);
    and and_2 (out[1], na, b);
    and and_3 (out[2], a, nb);
    and and_4 (out[3], na, nb);
    
endmodule