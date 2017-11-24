onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib STU_ID_BASYS3_opt

do {wave.do}

view wave
view structure
view signals

do {STU_ID_BASYS3.udo}

run -all

quit -force
