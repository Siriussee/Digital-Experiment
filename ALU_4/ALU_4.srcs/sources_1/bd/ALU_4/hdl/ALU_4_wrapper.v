//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Tue Nov 14 23:24:59 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target ALU_4_wrapper.bd
//Design      : ALU_4_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module ALU_4_wrapper
   (A,
    A_1,
    A_2,
    A_3,
    B,
    B_1,
    B_2,
    B_3,
    Cn,
    Cn_1,
    GND,
    S0,
    S1,
    S2,
    Y,
    Y_1,
    Y_2,
    Y_3);
  input A;
  input A_1;
  input A_2;
  input A_3;
  input B;
  input B_1;
  input B_2;
  input B_3;
  input Cn;
  output Cn_1;
  input GND;
  input S0;
  input S1;
  input S2;
  output Y;
  output Y_1;
  output Y_2;
  output Y_3;

  wire A;
  wire A_1;
  wire A_2;
  wire A_3;
  wire B;
  wire B_1;
  wire B_2;
  wire B_3;
  wire Cn;
  wire Cn_1;
  wire GND;
  wire S0;
  wire S1;
  wire S2;
  wire Y;
  wire Y_1;
  wire Y_2;
  wire Y_3;

  ALU_4 ALU_4_i
       (.A(A),
        .A_1(A_1),
        .A_2(A_2),
        .A_3(A_3),
        .B(B),
        .B_1(B_1),
        .B_2(B_2),
        .B_3(B_3),
        .Cn(Cn),
        .Cn_1(Cn_1),
        .GND(GND),
        .S0(S0),
        .S1(S1),
        .S2(S2),
        .Y(Y),
        .Y_1(Y_1),
        .Y_2(Y_2),
        .Y_3(Y_3));
endmodule
