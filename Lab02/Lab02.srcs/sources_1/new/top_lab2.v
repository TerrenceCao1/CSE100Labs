`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: UCSC CSE 100
// Engineer: Terrence Cao
//
// Create Date: 10/06/2026 10:13:57 AM
// Design Name: lab02 top module
// Module Name: lab02
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


module top_lab2 (
    input [7:0] sw,
    input btnU,
    input clkin,

    output [6:0] seg,
    output dp,
    output [3:0] an,
    output [7:0] led
);

  wire [7:0] sign_changer_output_w;
  wire [7:0] zero_seven_seg_to_mux_w, one_seven_seg_to_mux_w;
  wire dig_sel, ovfl_dp_w;

  SignChanger sign_change (
      .A(sw),
      .sign(btnU),
      .D(sign_changer_output_w),
      .ovfl(ovfl_dp_w)
  );
  assign dp = ~ovfl_dp_w;

  hex7seg zero_seven_seg (
      .N  (sign_changer_output_w[3:0]),
      .Seg(zero_seven_seg_to_mux_w)
  );

  hex7seg one_seven_seg (
      .N  (sign_changer_output_w[7:4]),
      .Seg(one_seven_seg_to_mux_w)
  );

  mux8bit seven_seg_mux (
      .A  (zero_seven_seg_to_mux_w),
      .B  (one_seven_seg_to_mux_w),
      .Sel(dig_sel),
      .C  (seg)
  );

  // active low
  assign an[0] = dig_sel;
  assign an[1] = ~dig_sel;
  assign an[2] = 1'b1;
  assign an[3] = 1'b1;

  lab2_digsel seven_seg_select (
      .clkin (clkin),
      .greset(btnR),
      .digsel(dig_sel)
  );

  switch_led led_clock (
      .sw (sw),
      .led(led)
  );

endmodule

// Tying switches to LEDs
module switch_led (
    input  [7:0] sw,
    output [7:0] led
);

  assign led = sw;
endmodule
