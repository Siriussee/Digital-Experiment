//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.3 (win64) Build 1368829 Mon Sep 28 20:06:43 MDT 2015
//Date        : Tue Nov 14 22:43:06 2017
//Host        : SiriusPC running 64-bit major release  (build 9200)
//Command     : generate_target ALU_1.bd
//Design      : ALU_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "ALU_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=ALU_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=12,numReposBlks=12,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,synth_mode=Global}" *) (* HW_HANDOFF = "ALU_1.hwdef" *) 
module ALU_1
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

  wire A0_2;
  wire A1_2;
  wire A2_2;
  wire A4_1;
  wire A_1;
  wire B_1;
  wire Cn_2;
  wire decode138_0_Y1_n;
  wire decode138_0_Y2_n;
  wire decode138_0_Y3_n;
  wire decode138_0_Y4_n;
  wire decode138_0_Y5_n;
  wire decode138_0_Y6_n;
  wire decode138_0_Y7_n;
  wire decode138_1_Y1_n;
  wire decode138_1_Y2_n;
  wire decode138_1_Y3_n;
  wire decode138_1_Y4_n;
  wire decode138_1_Y7_n;
  wire four_2_input_and_gate_0_Y1;
  wire four_2_input_and_gate_0_Y2;
  wire four_2_input_and_gate_0_Y3;
  wire four_2_input_and_gate_0_Y4;
  wire four_2_input_and_gate_1_Y1;
  wire four_2_input_and_gate_1_Y2;
  wire four_2_input_and_gate_1_Y3;
  wire four_2_input_and_gate_1_Y4;
  wire four_2_input_and_gate_2_Y1;
  wire four_2_input_and_gate_2_Y2;
  wire four_2_input_and_gate_2_Y3;
  wire four_2_input_and_gate_2_Y4;
  wire four_2_input_and_gate_3_Y1;
  wire four_2_input_and_gate_3_Y2;
  wire four_2_input_and_gate_3_Y3;
  wire four_2_input_or_gate_0_Y1;
  wire four_2_input_or_gate_0_Y2;
  wire mux_8_to_1_0_Q;
  wire mux_8_to_1_1_Q;
  wire six_not_gate_0_Y1;
  wire six_not_gate_0_Y2;
  wire six_not_gate_0_Y3;
  wire six_not_gate_0_Y4;
  wire six_not_gate_1_Y1;
  wire six_not_gate_1_Y2;
  wire six_not_gate_2_Y1;
  wire six_not_gate_2_Y2;
  wire six_not_gate_2_Y3;
  wire six_not_gate_2_Y4;

  assign A0_2 = S0;
  assign A1_2 = S1;
  assign A2_2 = S2;
  assign A4_1 = GND;
  assign A_1 = A;
  assign B_1 = B;
  assign Cn_1 = mux_8_to_1_1_Q;
  assign Cn_2 = Cn;
  assign Y = mux_8_to_1_0_Q;
  ALU_1_decode138_0_0 decode138_0
       (.A0(Cn_2),
        .A1(B_1),
        .A2(A_1),
        .E1(six_not_gate_2_Y4),
        .E2_n(A4_1),
        .E3_n(A4_1),
        .Y1_n(decode138_0_Y1_n),
        .Y2_n(decode138_0_Y2_n),
        .Y3_n(decode138_0_Y3_n),
        .Y4_n(decode138_0_Y4_n),
        .Y5_n(decode138_0_Y5_n),
        .Y6_n(decode138_0_Y6_n),
        .Y7_n(decode138_0_Y7_n));
  ALU_1_decode138_0_1 decode138_1
       (.A0(Cn_2),
        .A1(B_1),
        .A2(A_1),
        .E1(six_not_gate_2_Y4),
        .E2_n(A4_1),
        .E3_n(A4_1),
        .Y1_n(decode138_1_Y1_n),
        .Y2_n(decode138_1_Y2_n),
        .Y3_n(decode138_1_Y3_n),
        .Y4_n(decode138_1_Y4_n),
        .Y7_n(decode138_1_Y7_n));
  ALU_1_four_2_input_and_gate_0_0 four_2_input_and_gate_0
       (.A1(decode138_0_Y1_n),
        .A2(decode138_0_Y4_n),
        .A3(decode138_0_Y3_n),
        .A4(decode138_0_Y6_n),
        .B1(decode138_0_Y2_n),
        .B2(decode138_0_Y7_n),
        .B3(decode138_0_Y5_n),
        .B4(decode138_0_Y7_n),
        .Y1(four_2_input_and_gate_0_Y1),
        .Y2(four_2_input_and_gate_0_Y2),
        .Y3(four_2_input_and_gate_0_Y3),
        .Y4(four_2_input_and_gate_0_Y4));
  ALU_1_four_2_input_and_gate_0_1 four_2_input_and_gate_1
       (.A1(four_2_input_and_gate_0_Y1),
        .A2(four_2_input_and_gate_0_Y3),
        .A3(four_2_input_and_gate_2_Y1),
        .A4(four_2_input_and_gate_2_Y3),
        .B1(four_2_input_and_gate_0_Y2),
        .B2(four_2_input_and_gate_0_Y4),
        .B3(four_2_input_and_gate_2_Y2),
        .B4(four_2_input_and_gate_2_Y4),
        .Y1(four_2_input_and_gate_1_Y1),
        .Y2(four_2_input_and_gate_1_Y2),
        .Y3(four_2_input_and_gate_1_Y3),
        .Y4(four_2_input_and_gate_1_Y4));
  ALU_1_four_2_input_and_gate_0_2 four_2_input_and_gate_2
       (.A1(decode138_1_Y1_n),
        .A2(decode138_1_Y4_n),
        .A3(decode138_1_Y1_n),
        .A4(decode138_1_Y3_n),
        .B1(decode138_1_Y2_n),
        .B2(decode138_1_Y7_n),
        .B3(decode138_1_Y2_n),
        .B4(decode138_1_Y7_n),
        .Y1(four_2_input_and_gate_2_Y1),
        .Y2(four_2_input_and_gate_2_Y2),
        .Y3(four_2_input_and_gate_2_Y3),
        .Y4(four_2_input_and_gate_2_Y4));
  ALU_1_four_2_input_and_gate_0_4 four_2_input_and_gate_3
       (.A1(A_1),
        .A2(six_not_gate_1_Y1),
        .A3(A_1),
        .A4(A4_1),
        .B1(B_1),
        .B2(B_1),
        .B3(six_not_gate_1_Y2),
        .B4(A4_1),
        .Y1(four_2_input_and_gate_3_Y1),
        .Y2(four_2_input_and_gate_3_Y2),
        .Y3(four_2_input_and_gate_3_Y3));
  ALU_1_four_2_input_or_gate_0_0 four_2_input_or_gate_0
       (.A1(A_1),
        .A2(four_2_input_and_gate_3_Y2),
        .A3(A4_1),
        .A4(A4_1),
        .B1(B_1),
        .B2(four_2_input_and_gate_3_Y3),
        .B3(A4_1),
        .B4(A4_1),
        .Y1(four_2_input_or_gate_0_Y1),
        .Y2(four_2_input_or_gate_0_Y2));
  ALU_1_mux_8_to_1_0_0 mux_8_to_1_0
       (.A0(A0_2),
        .A1(A1_2),
        .A2(A2_2),
        .D0(four_2_input_and_gate_3_Y1),
        .D1(four_2_input_or_gate_0_Y1),
        .D2(six_not_gate_1_Y1),
        .D3(six_not_gate_1_Y2),
        .D4(four_2_input_or_gate_0_Y2),
        .D5(six_not_gate_0_Y1),
        .D6(six_not_gate_0_Y3),
        .D7(A4_1),
        .Q(mux_8_to_1_0_Q),
        .S_n(A4_1));
  ALU_1_mux_8_to_1_0_1 mux_8_to_1_1
       (.A0(A0_2),
        .A1(A1_2),
        .A2(A2_2),
        .D0(six_not_gate_2_Y1),
        .D1(six_not_gate_2_Y2),
        .D2(A_1),
        .D3(B_1),
        .D4(six_not_gate_2_Y3),
        .D5(six_not_gate_0_Y2),
        .D6(six_not_gate_0_Y4),
        .D7(A4_1),
        .Q(mux_8_to_1_1_Q),
        .S_n(A4_1));
  ALU_1_six_not_gate_0_0 six_not_gate_0
       (.A1(four_2_input_and_gate_1_Y1),
        .A2(four_2_input_and_gate_1_Y2),
        .A3(four_2_input_and_gate_1_Y3),
        .A4(four_2_input_and_gate_1_Y4),
        .A5(A4_1),
        .A6(A4_1),
        .Y1(six_not_gate_0_Y1),
        .Y2(six_not_gate_0_Y2),
        .Y3(six_not_gate_0_Y3),
        .Y4(six_not_gate_0_Y4));
  ALU_1_six_not_gate_0_1 six_not_gate_1
       (.A1(A_1),
        .A2(B_1),
        .A3(A4_1),
        .A4(A4_1),
        .A5(A4_1),
        .A6(A4_1),
        .Y1(six_not_gate_1_Y1),
        .Y2(six_not_gate_1_Y2));
  ALU_1_six_not_gate_1_0 six_not_gate_2
       (.A1(four_2_input_and_gate_3_Y1),
        .A2(four_2_input_or_gate_0_Y1),
        .A3(four_2_input_or_gate_0_Y2),
        .A4(A4_1),
        .A5(A4_1),
        .A6(A4_1),
        .Y1(six_not_gate_2_Y1),
        .Y2(six_not_gate_2_Y2),
        .Y3(six_not_gate_2_Y3),
        .Y4(six_not_gate_2_Y4));
endmodule
