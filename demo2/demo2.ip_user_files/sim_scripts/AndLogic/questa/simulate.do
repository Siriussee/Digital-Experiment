onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib AndLogic_opt

do {wave.do}

view wave
view structure
view signals

do {AndLogic.udo}

run -all

quit -force
