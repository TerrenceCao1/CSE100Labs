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

module tb_AddSub8 ();

  reg [7:0] A;
  reg [7:0] B;
  reg sub;

  wire [7:0] S;
  wire ovfl;

  AddSub8 dut (
      .A(A),
      .B(B),
      .sub(sub),
      .S(S),
      .ovfl(ovfl)
  );

  reg [7:0] S_answer;
  reg ovfl_answer;

  integer a, b, sign;
  integer int_answer, num_errors;

  initial begin
    num_errors = 0;
    for (sign = 0; sign < 2; sign = sign + 1) begin
      for (a = 0; a < 256; a = a + 1) begin
        for (b = 0; b < 256; b = b + 1) begin
          A   = a[7:0];
          B   = b[7:0];
          sub = sign;
          #1;

          int_answer = sub ? ($signed(A) - $signed(B)) : ($signed(A) + $signed(B));
          S_answer = $signed(int_answer[7:0]);
          ovfl_answer = (int_answer > 127 || int_answer < -128) ? 1'b1 : 1'b0;

          if (S !== S_answer || ovfl !== ovfl_answer) begin
            num_errors = num_errors + 1;
            $display("FAIL: A=%0d B=%0d sub=%b | S=%0d (answer: %0d) ovfl=%b (answer: %b)",
                     $signed(A), $signed(B), sub, $signed(S), $signed(S_answer), ovfl, ovfl_answer);
          end
          #1;
        end
      end
    end

    if (num_errors == 0) $display("Passed! All cases correct.");
    else $display("Failure: %0d errors.", num_errors);

    $finish;
  end

endmodule
