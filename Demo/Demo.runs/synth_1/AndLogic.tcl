# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/digital/Digital-Experiment/Demo/Demo.cache/wt [current_project]
set_property parent.project_path D:/digital/Digital-Experiment/Demo/Demo.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
read_verilog -library xil_defaultlib D:/digital/Digital-Experiment/Demo/Demo.srcs/sources_1/new/AndLogic.v
read_xdc D:/digital/Digital-Experiment/Demo/Demo.srcs/constrs_1/new/AndLogic.xdc
set_property used_in_implementation false [get_files D:/digital/Digital-Experiment/Demo/Demo.srcs/constrs_1/new/AndLogic.xdc]

synth_design -top AndLogic -part xc7a35tcpg236-1
write_checkpoint -noxdef AndLogic.dcp
catch { report_utilization -file AndLogic_utilization_synth.rpt -pb AndLogic_utilization_synth.pb }