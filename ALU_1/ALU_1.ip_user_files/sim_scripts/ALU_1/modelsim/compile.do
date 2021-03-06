vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ipshared/xilinx.com/four_2_input_and_gate_v1_0/four_2_input_and_gate.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_four_2_input_and_gate_0_0/sim/ALU_1_four_2_input_and_gate_0_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ipshared/xilinx.com/four_2_input_or_gate_v1_0/four_2_input_or_gate.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_four_2_input_or_gate_0_0/sim/ALU_1_four_2_input_or_gate_0_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ipshared/xilinx.com/six_not_gate_v1_0/six_not_gate.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_six_not_gate_0_0/sim/ALU_1_six_not_gate_0_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ipshared/xilinx.com/mux_8_to_1_v1_0/mux_8_to_1.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_mux_8_to_1_0_0/sim/ALU_1_mux_8_to_1_0_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ipshared/xilinx.com/decode138_v1_0/decode138.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_decode138_0_0/sim/ALU_1_decode138_0_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_four_2_input_and_gate_0_1/sim/ALU_1_four_2_input_and_gate_0_1.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_decode138_0_1/sim/ALU_1_decode138_0_1.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_four_2_input_and_gate_0_2/sim/ALU_1_four_2_input_and_gate_0_2.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_mux_8_to_1_0_1/sim/ALU_1_mux_8_to_1_0_1.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_four_2_input_and_gate_0_4/sim/ALU_1_four_2_input_and_gate_0_4.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_six_not_gate_0_1/sim/ALU_1_six_not_gate_0_1.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/ip/ALU_1_six_not_gate_1_0/sim/ALU_1_six_not_gate_1_0.v" \
"./../../../../ALU_1.srcs/sources_1/bd/ALU_1/hdl/ALU_1.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

