`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 01:29:24 PM
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
    input a,
    input b,
    input s,
    output out
);
    wire ns;
    not not_1 (ns, s);
    
    wire n1, n2;
    and and_1 (n1, s, a);
    and and_2 (n2, ns, b);
    
    or or_1 (out, n1, n2);
    
endmodule