`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2023 01:35:16 PM
// Design Name: 
// Module Name: Four2OneMUX
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


module Four2OneMUX(
    input [3:0]a,
    input [1:0]s,
    output out
);

    wire ab, cd;
    Two2OneMUX mux_1 (a[3], a[2], s[0], ab);
    Two2OneMUX mux_2 (a[1], a[0], s[0], cd);
    
    Two2OneMUX mux_3 (ab, cd, s[1], out);
    
endmodule