// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: Sirius:user:ALU_1_wrapper:1.0
// IP Revision: 3

(* X_CORE_INFO = "ALU_1_wrapper,Vivado 2015.3" *)
(* CHECK_LICENSE_TYPE = "ALU_4_ALU_1_wrapper_0_2,ALU_1_wrapper,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module ALU_4_ALU_1_wrapper_0_2 (
  A,
  B,
  Cn,
  Cn_1,
  GND,
  S0,
  S1,
  S2,
  Y
);

input wire A;
input wire B;
input wire Cn;
output wire Cn_1;
input wire GND;
input wire S0;
input wire S1;
input wire S2;
output wire Y;

  ALU_1_wrapper inst (
    .A(A),
    .B(B),
    .Cn(Cn),
    .Cn_1(Cn_1),
    .GND(GND),
    .S0(S0),
    .S1(S1),
    .S2(S2),
    .Y(Y)
  );
endmodule
