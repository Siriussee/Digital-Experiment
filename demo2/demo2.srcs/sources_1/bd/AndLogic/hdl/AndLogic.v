//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Sat Nov 11 22:53:22 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target AndLogic.bd
//Design      : AndLogic
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "AndLogic,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=AndLogic,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "AndLogic.hwdef" *) 
module AndLogic
   (a,
    b,
    y);
  input a;
  input b;
  output y;

  wire a_1;
  wire b_1;
  wire xup_and2_0_y;

  assign a_1 = a;
  assign b_1 = b;
  assign y = xup_and2_0_y;
  AndLogic_xup_and2_0_0 xup_and2_0
       (.a(a_1),
        .b(b_1),
        .y(xup_and2_0_y));
endmodule
