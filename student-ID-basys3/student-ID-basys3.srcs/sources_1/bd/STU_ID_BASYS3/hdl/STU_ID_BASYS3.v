//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Fri Nov 24 13:28:13 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target STU_ID_BASYS3.bd
//Design      : STU_ID_BASYS3
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "STU_ID_BASYS3,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=STU_ID_BASYS3,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=10,numReposBlks=10,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "STU_ID_BASYS3.hwdef" *) 
module STU_ID_BASYS3
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

  wire BCD2SEG7_0_a;
  wire BCD2SEG7_0_b;
  wire BCD2SEG7_0_c;
  wire BCD2SEG7_0_d;
  wire BCD2SEG7_0_e;
  wire BCD2SEG7_0_f;
  wire BCD2SEG7_0_g;
  wire E1_1;
  wire GND_1;
  wire Net;
  wire clk_div_0_clk_out;
  wire clk_in_1;
  wire decimal_counter_0_Qa;
  wire decimal_counter_0_Qb;
  wire decimal_counter_0_Qc;
  wire decimal_counter_0_Qd;
  wire decode138_0_Y1_n;
  wire decode138_0_Y3_n;
  wire decode138_0_Y4_n;
  wire decode138_0_Y6_n;
  wire decode138_1_Y0_n;
  wire decode138_1_Y2_n;
  wire decode138_1_Y4_n;
  wire decode138_1_Y7_n;
  wire four_2_input_and_gate_0_Y1;
  wire four_2_input_and_gate_0_Y2;
  wire four_2_input_and_gate_0_Y3;
  wire four_2_input_and_gate_0_Y4;
  wire four_2_input_or_gate_0_Y1;
  wire four_2_input_or_gate_0_Y2;
  wire six_not_gate_0_Y1;
  wire six_not_gate_0_Y2;
  wire six_not_gate_1_Y1;
  wire six_not_gate_1_Y2;
  wire six_not_gate_1_Y3;
  wire six_not_gate_1_Y4;

  assign E1_1 = switch;
  assign GND_1 = GND;
  assign Y1 = four_2_input_and_gate_0_Y1;
  assign Y2 = four_2_input_and_gate_0_Y2;
  assign Y3 = four_2_input_and_gate_0_Y3;
  assign Y4 = four_2_input_and_gate_0_Y4;
  assign a = BCD2SEG7_0_a;
  assign b = BCD2SEG7_0_b;
  assign c = BCD2SEG7_0_c;
  assign clk_in_1 = CLK;
  assign d = BCD2SEG7_0_d;
  assign e = BCD2SEG7_0_e;
  assign f = BCD2SEG7_0_f;
  assign g = BCD2SEG7_0_g;
  STU_ID_BASYS3_BCD2SEG7_0_0 BCD2SEG7_0
       (.BCD_A(decimal_counter_0_Qa),
        .BCD_B(decimal_counter_0_Qb),
        .BCD_C(decimal_counter_0_Qc),
        .BCD_D(decimal_counter_0_Qd),
        .BI_RBO_n(BI_RBO_n),
        .LT_n(six_not_gate_0_Y2),
        .RBI_n(six_not_gate_0_Y2),
        .a(BCD2SEG7_0_a),
        .b(BCD2SEG7_0_b),
        .c(BCD2SEG7_0_c),
        .d(BCD2SEG7_0_d),
        .e(BCD2SEG7_0_e),
        .f(BCD2SEG7_0_f),
        .g(BCD2SEG7_0_g));
  STU_ID_BASYS3_clk_div_0_0 clk_div_0
       (.clk_in(clk_in_1),
        .clk_out(clk_div_0_clk_out));
  STU_ID_BASYS3_decimal_counter_0_0 decimal_counter_0
       (.CP1_n(clk_div_0_clk_out),
        .CP2_n(decimal_counter_0_Qa),
        .Qa(decimal_counter_0_Qa),
        .Qb(decimal_counter_0_Qb),
        .Qc(decimal_counter_0_Qc),
        .Qd(decimal_counter_0_Qd),
        .R0_1(GND_1),
        .R0_2(GND_1),
        .R9_1(GND_1),
        .R9_2(GND_1));
  STU_ID_BASYS3_decode138_0_0 decode138_0
       (.A0(decimal_counter_0_Qa),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qc),
        .E1(E1_1),
        .E2_n(GND_1),
        .E3_n(GND_1),
        .Y1_n(decode138_0_Y1_n),
        .Y3_n(decode138_0_Y3_n),
        .Y4_n(decode138_0_Y4_n),
        .Y6_n(decode138_0_Y6_n));
  STU_ID_BASYS3_decode138_0_1 decode138_1
       (.A0(decimal_counter_0_Qa),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qc),
        .E1(six_not_gate_0_Y1),
        .E2_n(GND_1),
        .E3_n(GND_1),
        .Y0_n(decode138_1_Y0_n),
        .Y2_n(decode138_1_Y2_n),
        .Y4_n(decode138_1_Y4_n),
        .Y7_n(decode138_1_Y7_n));
  STU_ID_BASYS3_four_2_input_and_gate_0_0 four_2_input_and_gate_0
       (.A1(four_2_input_or_gate_0_Y1),
        .A2(decode138_0_Y6_n),
        .A3(decode138_0_Y3_n),
        .A4(decode138_0_Y4_n),
        .B1(four_2_input_or_gate_0_Y2),
        .B2(decode138_1_Y2_n),
        .B3(decode138_1_Y4_n),
        .B4(decode138_1_Y7_n),
        .Y1(four_2_input_and_gate_0_Y1),
        .Y2(four_2_input_and_gate_0_Y2),
        .Y3(four_2_input_and_gate_0_Y3),
        .Y4(four_2_input_and_gate_0_Y4));
  STU_ID_BASYS3_four_2_input_or_gate_0_0 four_2_input_or_gate_0
       (.A1(decimal_counter_0_Qd),
        .A2(decimal_counter_0_Qd),
        .A3(GND_1),
        .A4(GND_1),
        .B1(decode138_0_Y1_n),
        .B2(decode138_1_Y0_n),
        .B3(GND_1),
        .B4(GND_1),
        .Y1(four_2_input_or_gate_0_Y1),
        .Y2(four_2_input_or_gate_0_Y2));
  STU_ID_BASYS3_six_not_gate_0_1 six_not_gate_0
       (.A1(E1_1),
        .A2(GND_1),
        .A3(GND_1),
        .A4(GND_1),
        .A5(GND_1),
        .A6(GND_1),
        .Y1(six_not_gate_0_Y1),
        .Y2(six_not_gate_0_Y2));
  STU_ID_BASYS3_six_not_gate_1_0 six_not_gate_1
       (.A1(decimal_counter_0_Qa),
        .A2(decimal_counter_0_Qb),
        .A3(decimal_counter_0_Qc),
        .A4(decimal_counter_0_Qd),
        .A5(decimal_counter_0_Qd),
        .A6(decimal_counter_0_Qd),
        .Y1(six_not_gate_1_Y1),
        .Y2(six_not_gate_1_Y2),
        .Y3(six_not_gate_1_Y3),
        .Y4(six_not_gate_1_Y4));
  STU_ID_BASYS3_two_4_input_nand_gate_0_0 two_4_input_nand_gate_0
       (.A1(six_not_gate_1_Y1),
        .A2(six_not_gate_1_Y4),
        .B1(six_not_gate_1_Y2),
        .B2(six_not_gate_1_Y4),
        .C1(six_not_gate_1_Y3),
        .C2(six_not_gate_1_Y4),
        .D1(six_not_gate_1_Y4),
        .D2(six_not_gate_1_Y4));
endmodule
