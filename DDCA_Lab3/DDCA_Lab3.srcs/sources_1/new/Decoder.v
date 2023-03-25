`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 04:08:35 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input [3:0]in,
    output [6:0]D
);
    assign D[0] = ((in[0] & ~in[1] & ~in[2] & ~in[3]) | (~in[0] & ~in[1] & in[2] & ~in[3]) |
                    (in[0] & in[1] & ~in[2] & in[3]) | (in[0] & ~in[1] & in[2] & in[3]));
    
    assign D[1] = ((in[0] & ~in[1] & in[2] & ~in[3]) | (~in[0] & in[1] & in[2] & ~in[3]) |
                    (in[0] & in[1] & ~in[2] & in[3]) | (~in[0] & ~in[1] & in[2] & in[3]) |
                    (in[1] & in[2] & in[3]));

    assign D[2] = ((~in[0] & in[1] & ~in[2] & ~in[3]) | (~in[0] & ~in[1] & in[2] & in[3]) |
                    (in[1] & in[2] & in[3]));
                    
    assign D[3] = ((in[0] & ~in[1] & ~in[2] & ~in[3]) | (~in[0] & ~in[1] & in[2] & ~in[3]) |
                    (in[0] & in[1] & in[2] & ~in[3]) | (~in[0] & in[1] & ~in[2] & in[3]) |
                    (in[0] & in[1] & in[2] & in[3]));
                    
    assign D[4] = ((in[0] & ~in[1] & ~in[2] & ~in[3]) | (~in[1] & in[2] & ~in[3]) |
                    (in[0] & in[1] & ~in[2] & ~in[3]) | (in[0] & in[1] & in[2] & ~in[3]) |
                    (in[0] & ~in[1] & ~in[2] & in[3]));
    
    assign D[5] = (((in[0] | in[1]) & ~in[2] & ~in[3]) | (in[0] & in[1] & in[2] & ~in[3]) | 
                    (in[0] & ~in[1] & in[2] & in[3]));
    
    assign D[6] = ((~in[0] & ~in[1] & ~in[2] & ~in[3]) | (in[0] & ~in[1] & ~in[2] & ~in[3]) |
                    (in[0] & in[1] & in[2] & ~in[3]) | (~in[0] & ~in[1] & in[2] & in[3]));
    
endmodule