vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"./../../../../test-7seg.srcs/sources_1/bd/design_1/ipshared/xilinx.com/bcd2seg7_v1_0/BCD2SEG7.v" \
"./../../../../test-7seg.srcs/sources_1/bd/design_1/ip/design_1_BCD2SEG7_0_0/sim/design_1_BCD2SEG7_0_0.v" \
"./../../../../test-7seg.srcs/sources_1/bd/design_1/ipshared/xilinx.com/six_not_gate_v1_0/six_not_gate.v" \
"./../../../../test-7seg.srcs/sources_1/bd/design_1/ip/design_1_six_not_gate_0_0/sim/design_1_six_not_gate_0_0.v" \
"./../../../../test-7seg.srcs/sources_1/bd/design_1/hdl/design_1.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

