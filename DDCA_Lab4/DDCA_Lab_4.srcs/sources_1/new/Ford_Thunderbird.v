`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2023 04:36:16 PM
// Design Name: 
// Module Name: Ford_Thunderbird
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


module Ford_Thunderbird(
    input left,
    input right,
    
    input [5:0] state_p,
    output reg [5:0] state_n
    );
    
    
    always  @ (*)
    begin
        if (state_p == 6'b000111)
            state_n = 6'b000000;
        else if (state_p == 6'b000110)
            state_n = 6'b000111;
        else if (state_p == 6'b000100)
            state_n = 6'b000110;
        else if (state_p == 6'b111000)
            state_n = 6'b000000;
        else if (state_p == 6'b011000)
            state_n = 6'b111000;
        else if (state_p == 6'b001000)
            state_n = 6'b011000;
        else if (left)
            state_n = 6'b001000;
        else if (right) 
            state_n = 6'b000100;
        else 
            state_n = 6'b000000;
    end
endmodule
