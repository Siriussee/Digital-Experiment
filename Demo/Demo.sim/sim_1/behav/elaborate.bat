@echo off
set xv_path=F:\\vivado\\Vivado\\2015.3\\bin
call %xv_path%/xelab  -wto 33690b7edeec4a6492f9700f1c4c6b8e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot AndLogic_tb_behav xil_defaultlib.AndLogic_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
