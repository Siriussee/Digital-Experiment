vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"./../../../bd/twelve_counter/ipshared/xilinx.com/mux_8_to_1_v1_0/mux_8_to_1.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_mux_8_to_1_0_0/sim/twelve_counter_mux_8_to_1_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_mux_8_to_1_0_1/sim/twelve_counter_mux_8_to_1_0_1.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_mux_8_to_1_0_2/sim/twelve_counter_mux_8_to_1_0_2.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_mux_8_to_1_0_3/sim/twelve_counter_mux_8_to_1_0_3.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/decode138_v1_0/decode138.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_decode138_0_0/sim/twelve_counter_decode138_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/ipshared/xilinx.com/d_flipflop_set_reset_v1_0/D_FlipFlop_Set_Reset.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_D_FlipFlop_Set_Reset_0_0/sim/xup_jk_D_FlipFlop_Set_Reset_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/ipshared/xilinx.com/xup_inv_v1_0/xup_inv.srcs/sources_1/new/xup_inv.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_inv_0_0/sim/xup_jk_xup_inv_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_inv_1_0/sim/xup_jk_xup_inv_1_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/ipshared/xilinx.com/xup_and2_v1_0/xup_and2.srcs/sources_1/new/xup_and2.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_and2_0_0/sim/xup_jk_xup_and2_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_and2_1_0/sim/xup_jk_xup_and2_1_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_and2_2_0/sim/xup_jk_xup_and2_2_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_and2_3_0/sim/xup_jk_xup_and2_3_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/ipshared/xilinx.com/xup_or2_v1_0/xup_or2.srcs/sources_1/new/xup_or2.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_or2_0_0/sim/xup_jk_xup_or2_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/src/xup_jk_xup_or2_1_0/sim/xup_jk_xup_or2_1_0.v" \
"./../../../bd/twelve_counter/ipshared/sysu/xup_jk_v1_0/src/xup_jk.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_0/sim/twelve_counter_xup_jk_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_xup_jk_0_1/sim/twelve_counter_xup_jk_0_1.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/clk_div_v1_0/clk_div.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_clk_div_0_0/sim/twelve_counter_clk_div_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_clk_div_0_1/sim/twelve_counter_clk_div_0_1.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/six_not_gate_v1_0/six_not_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_six_not_gate_0_0/sim/twelve_counter_six_not_gate_0_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/four_2_input_and_gate_v1_0/four_2_input_and_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_and_gate_0_0/sim/twelve_counter_four_2_input_and_gate_0_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/four_2_input_or_gate_v1_0/four_2_input_or_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_or_gate_0_0/sim/twelve_counter_four_2_input_or_gate_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_and_gate_0_1/sim/twelve_counter_four_2_input_and_gate_0_1.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/four_2_input_nand_gate_v1_0/four_2_input_nand_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_nand_gate_0_0/sim/twelve_counter_four_2_input_nand_gate_0_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/tri_3_input_nand_gate_v1_0/tri_3_input_nand_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_tri_3_input_nand_gate_0_0/sim/twelve_counter_tri_3_input_nand_gate_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_nand_gate_0_1/sim/twelve_counter_four_2_input_nand_gate_0_1.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_decode138_0_1/sim/twelve_counter_decode138_0_1.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/two_4_input_nand_gate_v1_0/two_4_input_nand_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_two_4_input_nand_gate_0_0/sim/twelve_counter_two_4_input_nand_gate_0_0.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_nand_gate_0_2/sim/twelve_counter_four_2_input_nand_gate_0_2.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_tri_3_input_nand_gate_0_1/sim/twelve_counter_tri_3_input_nand_gate_0_1.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_four_2_input_and_gate_1_0/sim/twelve_counter_four_2_input_and_gate_1_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/two_4_input_and_gate_v1_0/two_4_input_and_gate.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_two_4_input_and_gate_0_0/sim/twelve_counter_two_4_input_and_gate_0_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/decimal_counter_v1_0/decimal_counter.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_decimal_counter_0_0/sim/twelve_counter_decimal_counter_0_0.v" \
"./../../../bd/twelve_counter/ipshared/xilinx.com/bcd2seg7_v1_0/BCD2SEG7.v" \
"./../../../bd/twelve_counter/ip/twelve_counter_BCD2SEG7_0_0/sim/twelve_counter_BCD2SEG7_0_0.v" \
"./../../../bd/twelve_counter/hdl/twelve_counter.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

