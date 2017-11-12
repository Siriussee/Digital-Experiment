@echo off
set xv_path=F:\\vivado\\Vivado\\2015.3\\bin
call %xv_path%/xsim alu_1_tb_behav -key {Behavioral:sim_1:Functional:alu_1_tb} -tclbatch alu_1_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
