`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/25/2023 01:33:52 PM
// Design Name: 
// Module Name: ThirtyTwoBitAdder
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


module ThirtyTwoBitAdder(
    input [31:0] a,
    input [31:0] b,
    
    output [31:0] s
    );
    wire [4:0] n1, n2, n3, n4, n5, n6, n7;
    wire [4:0] c1, c2, c3, c4, c5, c6, c7;
    
    FourBitAdder add1 (a[3:0], b[3:0], c1);
    assign s[3:0] = c1[3:0];
    
    FourBitAdder add2 (a[7:4], {3'b0, c1[4]}, n1);
    FourBitAdder add3 (n1, b[7:4], c2);
    assign s[7:4] = c2[3:0];
    
    FourBitAdder add4 (a[11:8], {3'b0, c2[4]}, n2);
    FourBitAdder add5 (n2, b[11:8], c3);
    assign s[11:8] = c3[3:0];
    
    FourBitAdder add6 (a[15:12], {3'b0, c3[4]}, n3);
    FourBitAdder add7 (n3, b[15:12], c4);
    assign s[15:12] = c4[3:0];
    
    FourBitAdder add8 (a[19:16], {3'b0, c4[4]}, n4);
    FourBitAdder add9 (n4, b[19:16], c5);
    assign s[19:16] = c5[3:0];
    
    FourBitAdder add10 (a[23:20], {3'b0, c5[4]}, n5);
    FourBitAdder add11 (n5, b[23:20], c6);
    assign s[23:20] = c6[3:0];
    
    FourBitAdder add12 (a[27:24], {3'b0, c6[4]}, n6);
    FourBitAdder add13 (n6, b[27:24], c7);
    assign s[27:24] = c7[3:0];
    
    wire [4:0] out;
    FourBitAdder add14 (a[31:28], {3'b0, c7[4]}, n7);
    FourBitAdder add15 (n7, b[31:28], out);
    
    assign s[31:28] = out[3:0];
    
endmodule
