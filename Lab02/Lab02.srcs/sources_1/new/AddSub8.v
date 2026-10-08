`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: Adder/Subtractor
// Module Name: AddSub8
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

module AddSub8 (
    input [7:0] A,
    input [7:0] B,
    input sub,

    output [7:0] S,
    output ovfl
);

  wire [7:0] inv_B_w;
  wire [7:0] B_input;

  assign inv_B_w = ~B;

  mux8bit B_inv_B_mux (
      .A  (B),
      .B  (inv_B_w),
      .Sel(sub),
      .C  (B_input)
  );

  adder8 big_add (
      .A(A),
      .B(B_input),
      .cin(sub),
      .S(S),
      .ovfl(ovfl)
  );

endmodule
