vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"./../../../../demo2.srcs/sources_1/bd/AndLogic/ipshared/xilinx.com/xup_and2_v1_0/xup_and2.srcs/sources_1/new/xup_and2.v" \
"./../../../../demo2.srcs/sources_1/bd/AndLogic/ip/AndLogic_xup_and2_0_0/sim/AndLogic_xup_and2_0_0.v" \
"./../../../../demo2.srcs/sources_1/bd/AndLogic/hdl/AndLogic.v" \


vlog -work xil_defaultlib "glbl.v"

quit -f

