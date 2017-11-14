//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Tue Nov 14 22:43:06 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target ALU_1_wrapper.bd
//Design      : ALU_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU_1_wrapper
   (A,
    B,
    Cn,
    Cn_1,
    GND,
    S0,
    S1,
    S2,
    Y);
  input A;
  input B;
  input Cn;
  output Cn_1;
  input GND;
  input S0;
  input S1;
  input S2;
  output Y;

  wire A;
  wire B;
  wire Cn;
  wire Cn_1;
  wire GND;
  wire S0;
  wire S1;
  wire S2;
  wire Y;

  ALU_1 ALU_1_i
       (.A(A),
        .B(B),
        .Cn(Cn),
        .Cn_1(Cn_1),
        .GND(GND),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .Y(Y));
endmodule
