//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Sat Nov 11 22:53:22 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target AndLogic_wrapper.bd
//Design      : AndLogic_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AndLogic_wrapper
   (a,
    b,
    y);
  input a;
  input b;
  output y;

  wire a;
  wire b;
  wire y;

  AndLogic AndLogic_i
       (.a(a),
        .b(b),
        .y(y));
endmodule
