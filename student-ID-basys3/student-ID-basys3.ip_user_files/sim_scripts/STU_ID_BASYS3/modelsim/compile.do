vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/decode138_v1_0/decode138.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_decode138_0_0/sim/STU_ID_BASYS3_decode138_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/bcd2seg7_v1_0/BCD2SEG7.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_BCD2SEG7_0_0/sim/STU_ID_BASYS3_BCD2SEG7_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/clk_div_v1_0/clk_div.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_clk_div_0_0/sim/STU_ID_BASYS3_clk_div_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/decimal_counter_v1_0/decimal_counter.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_decimal_counter_0_0/sim/STU_ID_BASYS3_decimal_counter_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_decode138_0_1/sim/STU_ID_BASYS3_decode138_0_1.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/six_not_gate_v1_0/six_not_gate.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_six_not_gate_0_1/sim/STU_ID_BASYS3_six_not_gate_0_1.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/four_2_input_or_gate_v1_0/four_2_input_or_gate.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_four_2_input_or_gate_0_0/sim/STU_ID_BASYS3_four_2_input_or_gate_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ipshared/xilinx.com/four_2_input_and_gate_v1_0/four_2_input_and_gate.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/ip/STU_ID_BASYS3_four_2_input_and_gate_0_0/sim/STU_ID_BASYS3_four_2_input_and_gate_0_0.v" \
"./../../../../student-ID-basys3.srcs/sources_1/bd/STU_ID_BASYS3/hdl/STU_ID_BASYS3.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

