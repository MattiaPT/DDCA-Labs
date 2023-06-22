`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 04:46:32 PM
// Design Name: 
// Module Name: LogicPart
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


module LogicPart(
    input [3:0] opcode,
    input [31:0] A,
    input [31:0] B,
    
    output [31:0] result
    );
    
    wire [31:0] and_out;
    wire [31:0] or_out;
    wire [31:0] nor_out;
    wire [31:0] xor_out;
    
    assign and_out = A & B;
    assign or_out = A | B;
    assign nor_out = ~or_out;
    assign xor_out = A^B;
    
    wire [31:0] mux1_out;
    wire [31:0] mux2_out;
    
    Two2OneMUX e (and_out, or_out, opcode[0], mux1_out);
    Two2OneMUX f (xor_out, nor_out, opcode[0], mux2_out);
    
    Two2OneMUX g (mux1_out, mux2_out, opcode[1], result);
    
endmodule
