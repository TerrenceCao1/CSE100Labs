`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: 2 input, 8 bit multiplexer
// Module Name: mux8bit
// Project Name: Lab02
// Target Devices: Basys 3
// Tool Versions: Vivado 2025.2
// Description: Lab for UCSC CSE100 lol
//
// Dependencies: N/A
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module mux8bit (
    input [7:0] A,
    input [7:0] B,
    input Sel,

    output [7:0] C
);

  assign C = (~{8{Sel}} & A) | ({8{Sel}} & B);
endmodule
