//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Tue Nov 14 23:24:59 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target ALU_4.bd
//Design      : ALU_4
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ALU_4,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ALU_4,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=4,numReposBlks=4,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ALU_4.hwdef" *) 
module ALU_4
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

  wire ALU_1_wrapper_0_Cn_1;
  wire ALU_1_wrapper_0_Y;
  wire ALU_1_wrapper_1_Cn_1;
  wire ALU_1_wrapper_1_Y;
  wire ALU_1_wrapper_2_Cn_1;
  wire ALU_1_wrapper_2_Y;
  wire ALU_1_wrapper_3_Cn_1;
  wire ALU_1_wrapper_3_Y;
  wire \^A_1 ;
  wire A_1_1;
  wire A_2_1;
  wire A_3_1;
  wire \^B_1 ;
  wire B_1_1;
  wire B_2_1;
  wire B_3_1;
  wire \^Cn_1 ;
  wire GND_1;
  wire S0_1;
  wire S1_1;
  wire S2_1;

  assign A_1_1 = A_1;
  assign A_2_1 = A_2;
  assign A_3_1 = A_3;
  assign B_1_1 = B_1;
  assign B_2_1 = B_2;
  assign B_3_1 = B_3;
  assign Cn_1 = ALU_1_wrapper_3_Cn_1;
  assign GND_1 = GND;
  assign S0_1 = S0;
  assign S1_1 = S1;
  assign S2_1 = S2;
  assign Y = ALU_1_wrapper_0_Y;
  assign Y_1 = ALU_1_wrapper_1_Y;
  assign Y_2 = ALU_1_wrapper_2_Y;
  assign Y_3 = ALU_1_wrapper_3_Y;
  assign \^A_1  = A;
  assign \^B_1  = B;
  assign \^Cn_1  = Cn;
  ALU_4_ALU_1_wrapper_0_0 ALU_1_wrapper_0
       (.A(\^A_1 ),
        .B(\^B_1 ),
        .Cn(\^Cn_1 ),
        .Cn_1(ALU_1_wrapper_0_Cn_1),
        .GND(GND_1),
        .S0(S0_1),
        .S1(S1_1),
        .S2(S2_1),
        .Y(ALU_1_wrapper_0_Y));
  ALU_4_ALU_1_wrapper_0_1 ALU_1_wrapper_1
       (.A(A_1_1),
        .B(B_1_1),
        .Cn(ALU_1_wrapper_0_Cn_1),
        .Cn_1(ALU_1_wrapper_1_Cn_1),
        .GND(GND_1),
        .S0(S0_1),
        .S1(S1_1),
        .S2(S2_1),
        .Y(ALU_1_wrapper_1_Y));
  ALU_4_ALU_1_wrapper_0_2 ALU_1_wrapper_2
       (.A(A_2_1),
        .B(B_2_1),
        .Cn(ALU_1_wrapper_1_Cn_1),
        .Cn_1(ALU_1_wrapper_2_Cn_1),
        .GND(GND_1),
        .S0(S0_1),
        .S1(S1_1),
        .S2(S2_1),
        .Y(ALU_1_wrapper_2_Y));
  ALU_4_ALU_1_wrapper_0_3 ALU_1_wrapper_3
       (.A(A_3_1),
        .B(B_3_1),
        .Cn(ALU_1_wrapper_2_Cn_1),
        .Cn_1(ALU_1_wrapper_3_Cn_1),
        .GND(GND_1),
        .S0(S0_1),
        .S1(S1_1),
        .S2(S2_1),
        .Y(ALU_1_wrapper_3_Y));
endmodule
