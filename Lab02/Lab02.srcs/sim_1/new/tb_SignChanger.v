//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC
// Engineer: Terrence Cao
//
// Create Date: 10/07/2026 01:37:40 PM
// Design Name: Testbench for AddSub8 module
// Module Name: tb_AddSub8
// Project Name: Lab02
// Target Devices: Basys 3
// Tool Versions: Vivado 25.2
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 10ps

module tb_SignChanger ();

  reg [7:0] A;
  reg sign;

  wire [7:0] D;
  wire ovfl;

  SignChanger dut (
      .A(A),
      .sign(sign),
      .D(D),
      .ovfl(ovfl)
  );

  reg [7:0] D_answer;
  reg ovfl_answer;

  integer a, s;
  integer int_answer, num_errors;

  initial begin
    num_errors = 0;
    for (s = 0; s < 2; s = s + 1) begin
      for (a = 0; a < 256; a = a + 1) begin
        A = a[7:0];
        sign = s;
        #1;

        int_answer = sign ? -$signed(A) : $signed(A);
        D_answer = int_answer[7:0];
        ovfl_answer = (int_answer > 127 || int_answer < -128) ? 1'b1 : 1'b0;

        if (D != D_answer || ovfl != ovfl_answer) begin
          num_errors = num_errors + 1;
          $display("FAIL: A=%0d sign=%b | D=%0d (answer: %0d) ovfl=%b (answer: %b)", $signed(A),
                   sign, $signed(D), $signed(D_answer), ovfl, ovfl_answer);
        end
        #1;
      end
    end

    if (num_errors == 0) $display("Passed! All cases correct.");
    else $display("Failure: %0d errors.", num_errors);
  end
endmodule
