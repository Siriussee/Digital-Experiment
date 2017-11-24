//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Fri Nov 24 13:25:20 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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

  wire A1_1;
  wire A2_1;
  wire A3_1;
  wire A4_1;
  wire BCD2SEG7_0_a;
  wire BCD2SEG7_0_b;
  wire BCD2SEG7_0_c;
  wire BCD2SEG7_0_d;
  wire BCD2SEG7_0_e;
  wire BCD2SEG7_0_f;
  wire BCD2SEG7_0_g;
  wire BCD_A_1;
  wire BCD_B_1;
  wire BCD_C_1;
  wire BCD_D_1;
  wire GND_1;
  wire Net;
  wire six_not_gate_0_Y1;
  wire six_not_gate_0_Y2;
  wire six_not_gate_0_Y3;
  wire six_not_gate_0_Y4;
  wire six_not_gate_0_Y5;

  assign A1_1 = A1;
  assign A2_1 = A2;
  assign A3_1 = A3;
  assign A4_1 = A4;
  assign BCD_A_1 = BCD_A;
  assign BCD_B_1 = BCD_B;
  assign BCD_C_1 = BCD_C;
  assign BCD_D_1 = BCD_D;
  assign GND_1 = GND;
  assign Y1 = six_not_gate_0_Y1;
  assign Y2 = six_not_gate_0_Y2;
  assign Y3 = six_not_gate_0_Y3;
  assign Y4 = six_not_gate_0_Y4;
  assign a = BCD2SEG7_0_a;
  assign b = BCD2SEG7_0_b;
  assign c = BCD2SEG7_0_c;
  assign d = BCD2SEG7_0_d;
  assign e = BCD2SEG7_0_e;
  assign f = BCD2SEG7_0_f;
  assign g = BCD2SEG7_0_g;
  design_1_BCD2SEG7_0_0 BCD2SEG7_0
       (.BCD_A(BCD_A_1),
        .BCD_B(BCD_B_1),
        .BCD_C(BCD_C_1),
        .BCD_D(BCD_D_1),
        .BI_RBO_n(BI_RBO_n),
        .LT_n(six_not_gate_0_Y5),
        .RBI_n(six_not_gate_0_Y5),
        .a(BCD2SEG7_0_a),
        .b(BCD2SEG7_0_b),
        .c(BCD2SEG7_0_c),
        .d(BCD2SEG7_0_d),
        .e(BCD2SEG7_0_e),
        .f(BCD2SEG7_0_f),
        .g(BCD2SEG7_0_g));
  design_1_six_not_gate_0_0 six_not_gate_0
       (.A1(A1_1),
        .A2(A2_1),
        .A3(A3_1),
        .A4(A4_1),
        .A5(GND_1),
        .A6(GND_1),
        .Y1(six_not_gate_0_Y1),
        .Y2(six_not_gate_0_Y2),
        .Y3(six_not_gate_0_Y3),
        .Y4(six_not_gate_0_Y4),
        .Y5(six_not_gate_0_Y5));
endmodule
