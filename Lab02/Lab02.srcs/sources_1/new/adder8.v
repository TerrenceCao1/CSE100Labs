`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: 8 Bit Adder
// Module Name: adder8
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


module adder8 (
    input [7:0] A,
    input [7:0] B,
    input cin,

    output [7:0] S,
    output ovfl,
    output cout
);

  wire cout0_cin1, cout1_cin2, cout2_cin3, cout3_cin4, cout4_cin5, cout5_cin6, cout6_cin7;

  full_adder FA_0 (
      .A(A[0]),
      .B(B[0]),
      .cin(cin),
      .S(S[0]),
      .cout(cout0_cin1)
  );

  full_adder FA_1 (
      .A(A[1]),
      .B(B[1]),
      .cin(cout0_cin1),
      .S(S[1]),
      .cout(cout1_cin2)
  );

  full_adder FA_2 (
      .A(A[2]),
      .B(B[2]),
      .cin(cout1_cin2),
      .S(S[2]),
      .cout(cout2_cin3)
  );

  full_adder FA_3 (
      .A(A[3]),
      .B(B[3]),
      .cin(cout2_cin3),
      .S(S[3]),
      .cout(cout3_cin4)
  );

  full_adder FA_4 (
      .A(A[4]),
      .B(B[4]),
      .cin(cout3_cin4),
      .S(S[4]),
      .cout(cout4_cin5)
  );

  full_adder FA_5 (
      .A(A[5]),
      .B(B[5]),
      .cin(cout4_cin5),
      .S(S[5]),
      .cout(cout5_cin6)
  );

  full_adder FA_6 (
      .A(A[6]),
      .B(B[6]),
      .cin(cout5_cin6),
      .S(S[6]),
      .cout(cout6_cin7)
  );

  full_adder FA_7 (
      .A(A[7]),
      .B(B[7]),
      .cin(cout6_cin7),
      .S(S[7]),
      .cout(cout)
  );
  assign ovfl = cout6_cin7 ^ cout;

endmodule
