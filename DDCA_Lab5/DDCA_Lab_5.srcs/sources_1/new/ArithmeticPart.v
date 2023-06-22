`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2023 04:44:42 PM
// Design Name: 
// Module Name: ArithmeticPart
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


module ArithmeticPart(
    input [3:0] opcode,
    input [31:0] A,
    input [31:0] B,
   
    output [31:0] result
    );
    
    wire [31:0] nb;
    wire [31:0] mux;
    wire [31:0] adder_out;
    reg [31:0] extend_out;
    
    assign nb = -B;
    Two2OneMUX b (B, nb, opcode[1], mux);
    
    ThirtyTwoBitAdder add1 (A, mux, adder_out);

    always @ (*)
    begin
    if (A < B)
        extend_out <= 1;
    else
        extend_out <= 0;
    end
    
    Two2OneMUX c (adder_out, extend_out, opcode[3], result);
    
    
endmodule
