`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2023 01:00:37 PM
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
    input [3:0] opcode,
    input [31:0] A,
    input [31:0] B,
    
    output zeroflag,
    output [31:0] out
);
    wire [31:0] arith_out;
    wire [31:0] logic_out;
    
    ArithmeticPart a (opcode, A, B, arith_out);
    LogicPart b (opcode, A, B, logic_out);
    
    Two2OneMUX c (arith_out, logic_out, opcode[2], out);
    assign zeroflag = ~|out;
    
endmodule
