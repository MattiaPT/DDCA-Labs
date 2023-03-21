`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/15/2023 08:12:46 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input a,
    input b,
    input ci,
    output s,
    output co    
);

    xor xor_1 (s, a, b, ci);
    
    wire n1, n2;
    or or_1 (n1, b, ci);
    and and_1 (n2, a, n1);
    
    wire n3;
    and and_2 (n3, b, ci);
    
    or or_2 (co, n2, n3);
endmodule
