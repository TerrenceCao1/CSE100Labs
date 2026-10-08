`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: full Adder
// Module Name: full_adder
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


module full_adder (
    input A,
    input B,
    input cin,

    output S,
    output cout,
    output ovfl
);

  wire ha1_cout_w, ha1_s_w, ha2_cout_w;

  half_adder HA_1 (
      .A(A),
      .B(B),
      .cout(ha1_cout_w),
      .S(ha1_s_w)
  );
  half_adder HA_2 (
      .A(ha1_s_w),
      .B(cin),
      .cout(ha2_cout_w),
      .S(S)
  );

  assign cout = ha1_cout_w | ha2_cout_w;
endmodule
