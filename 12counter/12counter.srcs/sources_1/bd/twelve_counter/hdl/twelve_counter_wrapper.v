//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Wed Dec 06 15:08:20 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target twelve_counter_wrapper.bd
//Design      : twelve_counter_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module twelve_counter_wrapper
   (BI_RBO_n_1,
    GND,
    SWI,
    Y0_n,
    Y1_n,
    a,
    b,
    c,
    clk_in,
    d,
    e,
    f,
    g);
  inout BI_RBO_n_1;
  input GND;
  input SWI;
  output Y0_n;
  output Y1_n;
  output a;
  output b;
  output c;
  input clk_in;
  output d;
  output e;
  output f;
  output g;

  wire BI_RBO_n_1;
  wire GND;
  wire SWI;
  wire Y0_n;
  wire Y1_n;
  wire a;
  wire b;
  wire c;
  wire clk_in;
  wire d;
  wire e;
  wire f;
  wire g;

  twelve_counter twelve_counter_i
       (.BI_RBO_n_1(BI_RBO_n_1),
        .GND(GND),
        .SWI(SWI),
        .Y0_n(Y0_n),
        .Y1_n(Y1_n),
        .a(a),
        .b(b),
        .c(c),
        .clk_in(clk_in),
        .d(d),
        .e(e),
        .f(f),
        .g(g));
endmodule
