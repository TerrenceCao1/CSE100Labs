`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: Hex to Seven Seg Display
// Module Name: hex7seg
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

module hex7seg (
    input  [3:0] N,
    output [6:0] Seg
);

  assign Seg[0] = (~N[3] & ~N[2] & ~N[1] & N[0])  // CA
      | (~N[3] &  N[2] & ~N[1] & ~N[0])
      | ( N[3] & ~N[2] &  N[1] &  N[0])
      | ( N[3] &  N[2] & ~N[1] &  N[0]);

  assign Seg[1] = (~N[3] & N[2] & ~N[1] & N[0])  // CB
      | (~N[3] &  N[2] &  N[1] & ~N[0])
      | ( N[3] & ~N[2] &  N[1] &  N[0])
      | ( N[3] &  N[2] & ~N[1] & ~N[0])
      | ( N[3] &  N[2] &  N[1] & ~N[0])
      | ( N[3] &  N[2] &  N[1] &  N[0]);

  assign Seg[2] = (~N[3] & ~N[2] & N[1] & ~N[0])  // CC
      | (N[3] & N[2] & ~N[1] & ~N[0]) | (N[3] & N[2] & N[1] & ~N[0]) | (N[3] & N[2] & N[1] & N[0]);

  assign Seg[3] = (~N[3] & ~N[2] & ~N[1] & N[0])  // CD
      | (~N[3] &  N[2] & ~N[1] & ~N[0])
      | (~N[3] &  N[2] &  N[1] &  N[0])
      | ( N[3] & ~N[2] & ~N[1] &  N[0])
      | ( N[3] & ~N[2] &  N[1] & ~N[0])
      | ( N[3] &  N[2] &  N[1] &  N[0]);

  assign Seg[4] = (~N[3] & ~N[2] & ~N[1] & N[0])  // CE
      | (~N[3] & ~N[2] &  N[1] &  N[0])
      | (~N[3] &  N[2] & ~N[1] & ~N[0])
      | (~N[3] &  N[2] & ~N[1] &  N[0])
      | (~N[3] &  N[2] &  N[1] &  N[0])
      | ( N[3] & ~N[2] & ~N[1] &  N[0]);

  assign Seg[5] = (~N[3] & ~N[2] & ~N[1] & N[0])  // CF
      | (~N[3] & ~N[2] &  N[1] & ~N[0])
      | (~N[3] & ~N[2] &  N[1] &  N[0])
      | ( N[3] &  N[2] & ~N[1] &  N[0]);

  assign Seg[6] = (~N[3] & ~N[2] & ~N[1] & ~N[0])  // CG
      | (~N[3] & ~N[2] & ~N[1] &  N[0])
      | (~N[3] &  N[2] &  N[1] &  N[0])
      | ( N[3] &  N[2] & ~N[1] & ~N[0]);

endmodule
