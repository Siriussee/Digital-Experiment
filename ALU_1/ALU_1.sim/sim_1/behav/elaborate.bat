@echo off
set xv_path=F:\\vivado\\Vivado\\2015.3\\bin
call %xv_path%/xelab  -wto 0cb8f4a33b4a4a2c8106032722186150 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot alu_1_tb_behav xil_defaultlib.alu_1_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
