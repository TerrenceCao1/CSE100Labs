`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: SignChanger
// Module Name: SignChanger
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


module SignChanger (
    input [7:0] A,
    input sign,
    output [7:0] D,
    output ovfl
);

  AddSub8 add_sub_boring_name (
      .A(0),
      .B(A),
      .sub(sign),
      .S(D),
      .ovfl(ovfl)
  );

endmodule
