//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Fri Nov 24 13:25:20 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (A1,
    A2,
    A3,
    A4,
    BCD_A,
    BCD_B,
    BCD_C,
    BCD_D,
    BI_RBO_n,
    GND,
    Y1,
    Y2,
    Y3,
    Y4,
    a,
    b,
    c,
    d,
    e,
    f,
    g);
  input A1;
  input A2;
  input A3;
  input A4;
  input BCD_A;
  input BCD_B;
  input BCD_C;
  input BCD_D;
  inout BI_RBO_n;
  input GND;
  output Y1;
  output Y2;
  output Y3;
  output Y4;
  output a;
  output b;
  output c;
  output d;
  output e;
  output f;
  output g;

  wire A1;
  wire A2;
  wire A3;
  wire A4;
  wire BCD_A;
  wire BCD_B;
  wire BCD_C;
  wire BCD_D;
  wire BI_RBO_n;
  wire GND;
  wire Y1;
  wire Y2;
  wire Y3;
  wire Y4;
  wire a;
  wire b;
  wire c;
  wire d;
  wire e;
  wire f;
  wire g;

  design_1 design_1_i
       (.A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .BCD_A(BCD_A),
        .BCD_B(BCD_B),
        .BCD_C(BCD_C),
        .BCD_D(BCD_D),
        .BI_RBO_n(BI_RBO_n),
        .GND(GND),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g));
endmodule
