//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Sun Dec 10 12:22:55 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (BI_RBO_n,
    GND,
    S,
    Y0_n,
    Y1_n,
    Y2_n,
    Y3_n,
    a,
    b,
    c,
    clk,
    d,
    e,
    f,
    g);
  inout BI_RBO_n;
  input GND;
  input S;
  output Y0_n;
  output Y1_n;
  output Y2_n;
  output Y3_n;
  output a;
  output b;
  output c;
  input clk;
  output d;
  output e;
  output f;
  output g;

  wire BI_RBO_n;
  wire GND;
  wire S;
  wire Y0_n;
  wire Y1_n;
  wire Y2_n;
  wire Y3_n;
  wire a;
  wire b;
  wire c;
  wire clk;
  wire d;
  wire e;
  wire f;
  wire g;

  design_1 design_1_i
       (.BI_RBO_n(BI_RBO_n),
        .GND(GND),
        .S(S),
        .Y0_n(Y0_n),
        .Y1_n(Y1_n),
        .Y2_n(Y2_n),
        .Y3_n(Y3_n),
        .a(a),
        .b(b),
        .c(c),
        .clk(clk),
        .d(d),
        .e(e),
        .f(f),
        .g(g));
endmodule
