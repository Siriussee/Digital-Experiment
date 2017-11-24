//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Fri Nov 24 13:28:13 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target STU_ID_BASYS3_wrapper.bd
//Design      : STU_ID_BASYS3_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module STU_ID_BASYS3_wrapper
   (BI_RBO_n,
    CLK,
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
    g,
    switch);
  inout BI_RBO_n;
  input CLK;
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
  input switch;

  wire BI_RBO_n;
  wire CLK;
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
  wire switch;

  STU_ID_BASYS3 STU_ID_BASYS3_i
       (.BI_RBO_n(BI_RBO_n),
        .CLK(CLK),
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
        .g(g),
        .switch(switch));
endmodule
