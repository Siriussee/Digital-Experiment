//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Wed Dec 06 14:30:50 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target twelve_counter.bd
//Design      : twelve_counter
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "twelve_counter,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=twelve_counter,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=24,numReposBlks=24,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "twelve_counter.hwdef" *) 
module twelve_counter
   (BI_RBO_n,
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
  inout BI_RBO_n;
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

  wire A1_1;
  wire B1_1;
  wire BCD2SEG7_0_a;
  wire BCD2SEG7_0_b;
  wire BCD2SEG7_0_c;
  wire BCD2SEG7_0_d;
  wire BCD2SEG7_0_e;
  wire BCD2SEG7_0_f;
  wire BCD2SEG7_0_g;
  wire clk_div_0_clk_out;
  wire clk_div_1_clk_out;
  wire clk_in_1;
  wire decimal_counter_0_Qa;
  wire decimal_counter_0_Qb;
  wire decimal_counter_0_Qc;
  wire decimal_counter_0_Qd;
  wire decode138_0_Y0_n;
  wire decode138_0_Y1_n;
  wire decode138_1_Y0_n;
  wire decode138_1_Y1_n;
  wire decode138_1_Y2_n;
  wire decode138_1_Y3_n;
  wire decode138_1_Y4_n;
  wire decode138_1_Y5_n;
  wire decode138_1_Y6_n;
  wire decode138_1_Y7_n;
  wire four_2_input_and_gate_0_Y1;
  wire four_2_input_and_gate_0_Y2;
  wire four_2_input_and_gate_0_Y3;
  wire four_2_input_and_gate_0_Y4;
  wire four_2_input_and_gate_1_Y1;
  wire four_2_input_and_gate_1_Y2;
  wire four_2_input_and_gate_2_Y1;
  wire four_2_input_and_gate_2_Y2;
  wire four_2_input_and_gate_2_Y3;
  wire four_2_input_and_gate_2_Y4;
  wire four_2_input_nand_gate_0_Y1;
  wire four_2_input_nand_gate_0_Y2;
  wire four_2_input_nand_gate_0_Y3;
  wire four_2_input_nand_gate_0_Y4;
  wire four_2_input_nand_gate_1_Y1;
  wire four_2_input_nand_gate_1_Y2;
  wire four_2_input_nand_gate_1_Y3;
  wire four_2_input_nand_gate_2_Y1;
  wire four_2_input_or_gate_0_Y1;
  wire four_2_input_or_gate_0_Y2;
  wire four_2_input_or_gate_0_Y3;
  wire four_2_input_or_gate_0_Y4;
  wire mux_8_to_1_0_Q;
  wire mux_8_to_1_1_Q;
  wire mux_8_to_1_2_Q;
  wire mux_8_to_1_3_Q;
  wire six_not_gate_0_Y1;
  wire six_not_gate_0_Y2;
  wire tri_3_input_nand_gate_0_Y1;
  wire tri_3_input_nand_gate_0_Y2;
  wire tri_3_input_nand_gate_0_Y3;
  wire tri_3_input_nand_gate_1_Y1;
  wire two_4_input_and_gate_0_Y1;
  wire two_4_input_nand_gate_0_Y1;
  wire two_4_input_nand_gate_0_Y2;
  wire xup_jk_0_Q1;
  wire xup_jk_0_Q1_n;
  wire xup_jk_0_Q2;
  wire xup_jk_0_Q2_n;
  wire xup_jk_1_Q1;
  wire xup_jk_1_Q1_n;
  wire xup_jk_1_Q2;
  wire xup_jk_1_Q2_n;

  assign A1_1 = GND;
  assign B1_1 = SWI;
  assign Y0_n = decode138_0_Y0_n;
  assign Y1_n = decode138_0_Y1_n;
  assign a = BCD2SEG7_0_a;
  assign b = BCD2SEG7_0_b;
  assign c = BCD2SEG7_0_c;
  assign clk_in_1 = clk_in;
  assign d = BCD2SEG7_0_d;
  assign e = BCD2SEG7_0_e;
  assign f = BCD2SEG7_0_f;
  assign g = BCD2SEG7_0_g;
  twelve_counter_BCD2SEG7_0_0 BCD2SEG7_0
       (.BCD_A(mux_8_to_1_1_Q),
        .BCD_B(mux_8_to_1_3_Q),
        .BCD_C(mux_8_to_1_0_Q),
        .BCD_D(mux_8_to_1_2_Q),
        .LT_n(six_not_gate_0_Y1),
        .RBI_n(six_not_gate_0_Y1),
        .a(BCD2SEG7_0_a),
        .b(BCD2SEG7_0_b),
        .c(BCD2SEG7_0_c),
        .d(BCD2SEG7_0_d),
        .e(BCD2SEG7_0_e),
        .f(BCD2SEG7_0_f),
        .g(BCD2SEG7_0_g));
  twelve_counter_clk_div_0_0 clk_div_0
       (.clk_in(clk_in_1),
        .clk_out(clk_div_0_clk_out));
  twelve_counter_clk_div_0_1 clk_div_1
       (.clk_in(clk_in_1),
        .clk_out(clk_div_1_clk_out));
  twelve_counter_decimal_counter_0_0 decimal_counter_0
       (.CP1_n(clk_div_0_clk_out),
        .CP2_n(A1_1),
        .Qa(decimal_counter_0_Qa),
        .Qb(decimal_counter_0_Qb),
        .Qc(decimal_counter_0_Qc),
        .Qd(decimal_counter_0_Qd),
        .R0_1(A1_1),
        .R0_2(A1_1),
        .R9_1(A1_1),
        .R9_2(A1_1));
  twelve_counter_decode138_0_0 decode138_0
       (.A0(decimal_counter_0_Qa),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qc),
        .E1(six_not_gate_0_Y1),
        .E2_n(A1_1),
        .E3_n(A1_1),
        .Y0_n(decode138_0_Y0_n),
        .Y1_n(decode138_0_Y1_n));
  twelve_counter_decode138_0_1 decode138_1
       (.A0(xup_jk_0_Q1),
        .A1(xup_jk_0_Q2),
        .A2(xup_jk_1_Q1),
        .E1(six_not_gate_0_Y1),
        .E2_n(A1_1),
        .E3_n(A1_1),
        .Y0_n(decode138_1_Y0_n),
        .Y1_n(decode138_1_Y1_n),
        .Y2_n(decode138_1_Y2_n),
        .Y3_n(decode138_1_Y3_n),
        .Y4_n(decode138_1_Y4_n),
        .Y5_n(decode138_1_Y5_n),
        .Y6_n(decode138_1_Y6_n),
        .Y7_n(decode138_1_Y7_n));
  twelve_counter_four_2_input_and_gate_0_0 four_2_input_and_gate_0
       (.A1(xup_jk_0_Q1),
        .A2(six_not_gate_0_Y2),
        .A3(B1_1),
        .A4(six_not_gate_0_Y2),
        .B1(B1_1),
        .B2(xup_jk_0_Q1_n),
        .B3(four_2_input_nand_gate_0_Y3),
        .B4(four_2_input_nand_gate_1_Y1),
        .Y1(four_2_input_and_gate_0_Y1),
        .Y2(four_2_input_and_gate_0_Y2),
        .Y3(four_2_input_and_gate_0_Y3),
        .Y4(four_2_input_and_gate_0_Y4));
  twelve_counter_four_2_input_and_gate_0_1 four_2_input_and_gate_1
       (.A1(four_2_input_nand_gate_1_Y2),
        .A2(four_2_input_nand_gate_1_Y3),
        .A3(A1_1),
        .A4(A1_1),
        .B1(six_not_gate_0_Y2),
        .B2(B1_1),
        .B3(A1_1),
        .B4(A1_1),
        .Y1(four_2_input_and_gate_1_Y1),
        .Y2(four_2_input_and_gate_1_Y2));
  twelve_counter_four_2_input_and_gate_1_0 four_2_input_and_gate_2
       (.A1(tri_3_input_nand_gate_1_Y1),
        .A2(four_2_input_nand_gate_2_Y1),
        .A3(two_4_input_nand_gate_0_Y1),
        .A4(two_4_input_nand_gate_0_Y2),
        .B1(xup_jk_1_Q2),
        .B2(xup_jk_1_Q2),
        .B3(xup_jk_1_Q2_n),
        .B4(xup_jk_1_Q2_n),
        .Y1(four_2_input_and_gate_2_Y1),
        .Y2(four_2_input_and_gate_2_Y2),
        .Y3(four_2_input_and_gate_2_Y3),
        .Y4(four_2_input_and_gate_2_Y4));
  twelve_counter_four_2_input_nand_gate_0_0 four_2_input_nand_gate_0
       (.A1(xup_jk_0_Q1),
        .A2(xup_jk_1_Q1),
        .A3(four_2_input_nand_gate_0_Y1),
        .A4(xup_jk_1_Q1),
        .B1(xup_jk_0_Q2),
        .B2(xup_jk_1_Q2),
        .B3(four_2_input_nand_gate_0_Y2),
        .B4(xup_jk_0_Q2_n),
        .Y1(four_2_input_nand_gate_0_Y1),
        .Y2(four_2_input_nand_gate_0_Y2),
        .Y3(four_2_input_nand_gate_0_Y3),
        .Y4(four_2_input_nand_gate_0_Y4));
  twelve_counter_four_2_input_nand_gate_0_1 four_2_input_nand_gate_1
       (.A1(four_2_input_nand_gate_0_Y4),
        .A2(tri_3_input_nand_gate_0_Y1),
        .A3(tri_3_input_nand_gate_0_Y3),
        .A4(four_2_input_nand_gate_0_Y2),
        .B1(tri_3_input_nand_gate_0_Y1),
        .B2(tri_3_input_nand_gate_0_Y2),
        .B3(four_2_input_nand_gate_0_Y2),
        .B4(A1_1),
        .Y1(four_2_input_nand_gate_1_Y1),
        .Y2(four_2_input_nand_gate_1_Y2),
        .Y3(four_2_input_nand_gate_1_Y3));
  twelve_counter_four_2_input_nand_gate_0_2 four_2_input_nand_gate_2
       (.A1(decode138_1_Y0_n),
        .A2(A1_1),
        .A3(A1_1),
        .A4(A1_1),
        .B1(decode138_1_Y1_n),
        .B2(A1_1),
        .B3(A1_1),
        .B4(A1_1),
        .Y1(four_2_input_nand_gate_2_Y1));
  twelve_counter_four_2_input_or_gate_0_0 four_2_input_or_gate_0
       (.A1(four_2_input_and_gate_0_Y1),
        .A2(four_2_input_and_gate_0_Y3),
        .A3(four_2_input_and_gate_1_Y1),
        .A4(four_2_input_and_gate_2_Y4),
        .B1(four_2_input_and_gate_0_Y2),
        .B2(four_2_input_and_gate_0_Y4),
        .B3(four_2_input_and_gate_1_Y2),
        .B4(two_4_input_and_gate_0_Y1),
        .Y1(four_2_input_or_gate_0_Y1),
        .Y2(four_2_input_or_gate_0_Y2),
        .Y3(four_2_input_or_gate_0_Y3),
        .Y4(four_2_input_or_gate_0_Y4));
  twelve_counter_mux_8_to_1_0_0 mux_8_to_1_0
       (.A0(decimal_counter_0_Qc),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qa),
        .D0(A1_1),
        .D1(four_2_input_or_gate_0_Y4),
        .D2(A1_1),
        .D3(A1_1),
        .D4(A1_1),
        .D5(A1_1),
        .D6(A1_1),
        .D7(A1_1),
        .Q(mux_8_to_1_0_Q),
        .S_n(decimal_counter_0_Qd));
  twelve_counter_mux_8_to_1_0_1 mux_8_to_1_1
       (.A0(decimal_counter_0_Qc),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qa),
        .D0(A1_1),
        .D1(four_2_input_and_gate_2_Y2),
        .D2(A1_1),
        .D3(A1_1),
        .D4(A1_1),
        .D5(A1_1),
        .D6(A1_1),
        .D7(A1_1),
        .Q(mux_8_to_1_1_Q),
        .S_n(decimal_counter_0_Qd));
  twelve_counter_mux_8_to_1_0_2 mux_8_to_1_2
       (.A0(decimal_counter_0_Qc),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qa),
        .D0(four_2_input_and_gate_2_Y1),
        .D1(xup_jk_0_Q1),
        .D2(A1_1),
        .D3(A1_1),
        .D4(A1_1),
        .D5(A1_1),
        .D6(A1_1),
        .D7(A1_1),
        .Q(mux_8_to_1_2_Q),
        .S_n(decimal_counter_0_Qd));
  twelve_counter_mux_8_to_1_0_3 mux_8_to_1_3
       (.A0(decimal_counter_0_Qc),
        .A1(decimal_counter_0_Qb),
        .A2(decimal_counter_0_Qa),
        .D0(A1_1),
        .D1(four_2_input_and_gate_2_Y3),
        .D2(A1_1),
        .D3(A1_1),
        .D4(A1_1),
        .D5(A1_1),
        .D6(A1_1),
        .D7(A1_1),
        .Q(mux_8_to_1_3_Q),
        .S_n(decimal_counter_0_Qd));
  twelve_counter_six_not_gate_0_0 six_not_gate_0
       (.A1(A1_1),
        .A2(B1_1),
        .A3(B1_1),
        .A4(B1_1),
        .A5(B1_1),
        .A6(B1_1),
        .Y1(six_not_gate_0_Y1),
        .Y2(six_not_gate_0_Y2));
  twelve_counter_tri_3_input_nand_gate_0_0 tri_3_input_nand_gate_0
       (.A1(xup_jk_0_Q2_n),
        .A2(xup_jk_0_Q1_n),
        .A3(xup_jk_0_Q1),
        .B1(xup_jk_1_Q1_n),
        .B2(xup_jk_0_Q2_n),
        .B3(xup_jk_0_Q2),
        .C1(xup_jk_1_Q2_n),
        .C2(xup_jk_1_Q1_n),
        .C3(xup_jk_1_Q1),
        .Y1(tri_3_input_nand_gate_0_Y1),
        .Y2(tri_3_input_nand_gate_0_Y2),
        .Y3(tri_3_input_nand_gate_0_Y3));
  twelve_counter_tri_3_input_nand_gate_0_1 tri_3_input_nand_gate_1
       (.A1(decode138_1_Y2_n),
        .A2(A1_1),
        .A3(A1_1),
        .B1(decode138_1_Y3_n),
        .B2(A1_1),
        .B3(A1_1),
        .C1(decode138_1_Y4_n),
        .C2(A1_1),
        .C3(A1_1),
        .Y1(tri_3_input_nand_gate_1_Y1));
  twelve_counter_two_4_input_and_gate_0_0 two_4_input_and_gate_0
       (.A1(xup_jk_1_Q2),
        .A2(A1_1),
        .B1(xup_jk_1_Q1),
        .B2(A1_1),
        .C1(xup_jk_0_Q2_n),
        .C2(A1_1),
        .D1(xup_jk_0_Q1),
        .D2(A1_1),
        .Y1(two_4_input_and_gate_0_Y1));
  twelve_counter_two_4_input_nand_gate_0_0 two_4_input_nand_gate_0
       (.A1(decode138_1_Y4_n),
        .A2(decode138_1_Y2_n),
        .B1(decode138_1_Y5_n),
        .B2(decode138_1_Y3_n),
        .C1(decode138_1_Y6_n),
        .C2(decode138_1_Y6_n),
        .D1(decode138_1_Y7_n),
        .D2(decode138_1_Y7_n),
        .Y1(two_4_input_nand_gate_0_Y1),
        .Y2(two_4_input_nand_gate_0_Y2));
  twelve_counter_xup_jk_0_0 xup_jk_0
       (.CLR1_n(six_not_gate_0_Y1),
        .CLR2_n(six_not_gate_0_Y1),
        .CP1(clk_div_1_clk_out),
        .CP2(clk_div_1_clk_out),
        .J1(six_not_gate_0_Y1),
        .J2(four_2_input_or_gate_0_Y1),
        .K1(six_not_gate_0_Y1),
        .K2(four_2_input_or_gate_0_Y1),
        .PR1_n(six_not_gate_0_Y1),
        .PR2_n(six_not_gate_0_Y1),
        .Q1(xup_jk_0_Q1),
        .Q1_n(xup_jk_0_Q1_n),
        .Q2(xup_jk_0_Q2),
        .Q2_n(xup_jk_0_Q2_n));
  twelve_counter_xup_jk_0_1 xup_jk_1
       (.CLR1_n(six_not_gate_0_Y1),
        .CLR2_n(six_not_gate_0_Y1),
        .CP1(clk_div_1_clk_out),
        .CP2(clk_div_1_clk_out),
        .J1(four_2_input_or_gate_0_Y2),
        .J2(four_2_input_or_gate_0_Y3),
        .K1(four_2_input_or_gate_0_Y2),
        .K2(four_2_input_or_gate_0_Y3),
        .PR1_n(six_not_gate_0_Y1),
        .PR2_n(six_not_gate_0_Y1),
        .Q1(xup_jk_1_Q1),
        .Q1_n(xup_jk_1_Q1_n),
        .Q2(xup_jk_1_Q2),
        .Q2_n(xup_jk_1_Q2_n));
endmodule
