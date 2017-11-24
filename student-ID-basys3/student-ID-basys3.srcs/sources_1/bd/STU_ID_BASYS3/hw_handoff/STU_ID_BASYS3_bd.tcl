
################################################################
# This is a generated script based on design: STU_ID_BASYS3
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source STU_ID_BASYS3_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name STU_ID_BASYS3

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set BI_RBO_n [ create_bd_port -dir IO BI_RBO_n ]
  set CLK [ create_bd_port -dir I CLK ]
  set GND [ create_bd_port -dir I GND ]
  set Y1 [ create_bd_port -dir O Y1 ]
  set Y2 [ create_bd_port -dir O Y2 ]
  set Y3 [ create_bd_port -dir O Y3 ]
  set Y4 [ create_bd_port -dir O Y4 ]
  set a [ create_bd_port -dir O a ]
  set b [ create_bd_port -dir O b ]
  set c [ create_bd_port -dir O c ]
  set d [ create_bd_port -dir O d ]
  set e [ create_bd_port -dir O e ]
  set f [ create_bd_port -dir O f ]
  set g [ create_bd_port -dir O g ]
  set switch [ create_bd_port -dir I switch ]

  # Create instance: BCD2SEG7_0, and set properties
  set BCD2SEG7_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_0 ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]
  set_property -dict [ list \
CONFIG.N {99999} \
 ] $clk_div_0

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decode138_0, and set properties
  set decode138_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_0 ]

  # Create instance: decode138_1, and set properties
  set decode138_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_1 ]

  # Create instance: four_2_input_and_gate_0, and set properties
  set four_2_input_and_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_0 ]

  # Create instance: four_2_input_or_gate_0, and set properties
  set four_2_input_or_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_or_gate:1.0 four_2_input_or_gate_0 ]

  # Create instance: six_not_gate_0, and set properties
  set six_not_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_0 ]

  # Create instance: six_not_gate_1, and set properties
  set six_not_gate_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_1 ]

  # Create instance: two_4_input_nand_gate_0, and set properties
  set two_4_input_nand_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:two_4_input_nand_gate:1.0 two_4_input_nand_gate_0 ]

  # Create port connections
  connect_bd_net -net BCD2SEG7_0_a [get_bd_ports a] [get_bd_pins BCD2SEG7_0/a]
  connect_bd_net -net BCD2SEG7_0_b [get_bd_ports b] [get_bd_pins BCD2SEG7_0/b]
  connect_bd_net -net BCD2SEG7_0_c [get_bd_ports c] [get_bd_pins BCD2SEG7_0/c]
  connect_bd_net -net BCD2SEG7_0_d [get_bd_ports d] [get_bd_pins BCD2SEG7_0/d]
  connect_bd_net -net BCD2SEG7_0_e [get_bd_ports e] [get_bd_pins BCD2SEG7_0/e]
  connect_bd_net -net BCD2SEG7_0_f [get_bd_ports f] [get_bd_pins BCD2SEG7_0/f]
  connect_bd_net -net BCD2SEG7_0_g [get_bd_ports g] [get_bd_pins BCD2SEG7_0/g]
  connect_bd_net -net E1_1 [get_bd_ports switch] [get_bd_pins decode138_0/E1] [get_bd_pins six_not_gate_0/A1]
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R0_2] [get_bd_pins decimal_counter_0/R9_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decode138_0/E2_n] [get_bd_pins decode138_0/E3_n] [get_bd_pins decode138_1/E2_n] [get_bd_pins decode138_1/E3_n] [get_bd_pins four_2_input_or_gate_0/A3] [get_bd_pins four_2_input_or_gate_0/A4] [get_bd_pins four_2_input_or_gate_0/B3] [get_bd_pins four_2_input_or_gate_0/B4] [get_bd_pins six_not_gate_0/A2] [get_bd_pins six_not_gate_0/A3] [get_bd_pins six_not_gate_0/A4] [get_bd_pins six_not_gate_0/A5] [get_bd_pins six_not_gate_0/A6]
  connect_bd_net -net Net [get_bd_ports BI_RBO_n] [get_bd_pins BCD2SEG7_0/BI_RBO_n]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_in_1 [get_bd_ports CLK] [get_bd_pins clk_div_0/clk_in]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins BCD2SEG7_0/BCD_A] [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/Qa] [get_bd_pins decode138_0/A0] [get_bd_pins decode138_1/A0] [get_bd_pins six_not_gate_1/A1]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins BCD2SEG7_0/BCD_B] [get_bd_pins decimal_counter_0/Qb] [get_bd_pins decode138_0/A1] [get_bd_pins decode138_1/A1] [get_bd_pins six_not_gate_1/A2]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins BCD2SEG7_0/BCD_C] [get_bd_pins decimal_counter_0/Qc] [get_bd_pins decode138_0/A2] [get_bd_pins decode138_1/A2] [get_bd_pins six_not_gate_1/A3]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins BCD2SEG7_0/BCD_D] [get_bd_pins decimal_counter_0/Qd] [get_bd_pins four_2_input_or_gate_0/A1] [get_bd_pins four_2_input_or_gate_0/A2] [get_bd_pins six_not_gate_1/A4] [get_bd_pins six_not_gate_1/A5] [get_bd_pins six_not_gate_1/A6]
  connect_bd_net -net decode138_0_Y1_n [get_bd_pins decode138_0/Y1_n] [get_bd_pins four_2_input_or_gate_0/B1]
  connect_bd_net -net decode138_0_Y3_n [get_bd_pins decode138_0/Y3_n] [get_bd_pins four_2_input_and_gate_0/A3]
  connect_bd_net -net decode138_0_Y4_n [get_bd_pins decode138_0/Y4_n] [get_bd_pins four_2_input_and_gate_0/A4]
  connect_bd_net -net decode138_0_Y6_n [get_bd_pins decode138_0/Y6_n] [get_bd_pins four_2_input_and_gate_0/A2]
  connect_bd_net -net decode138_1_Y0_n [get_bd_pins decode138_1/Y0_n] [get_bd_pins four_2_input_or_gate_0/B2]
  connect_bd_net -net decode138_1_Y2_n [get_bd_pins decode138_1/Y2_n] [get_bd_pins four_2_input_and_gate_0/B2]
  connect_bd_net -net decode138_1_Y4_n [get_bd_pins decode138_1/Y4_n] [get_bd_pins four_2_input_and_gate_0/B3]
  connect_bd_net -net decode138_1_Y7_n [get_bd_pins decode138_1/Y7_n] [get_bd_pins four_2_input_and_gate_0/B4]
  connect_bd_net -net four_2_input_and_gate_0_Y1 [get_bd_ports Y1] [get_bd_pins four_2_input_and_gate_0/Y1]
  connect_bd_net -net four_2_input_and_gate_0_Y2 [get_bd_ports Y2] [get_bd_pins four_2_input_and_gate_0/Y2]
  connect_bd_net -net four_2_input_and_gate_0_Y3 [get_bd_ports Y3] [get_bd_pins four_2_input_and_gate_0/Y3]
  connect_bd_net -net four_2_input_and_gate_0_Y4 [get_bd_ports Y4] [get_bd_pins four_2_input_and_gate_0/Y4]
  connect_bd_net -net four_2_input_or_gate_0_Y1 [get_bd_pins four_2_input_and_gate_0/A1] [get_bd_pins four_2_input_or_gate_0/Y1]
  connect_bd_net -net four_2_input_or_gate_0_Y2 [get_bd_pins four_2_input_and_gate_0/B1] [get_bd_pins four_2_input_or_gate_0/Y2]
  connect_bd_net -net six_not_gate_0_Y1 [get_bd_pins decode138_1/E1] [get_bd_pins six_not_gate_0/Y1]
  connect_bd_net -net six_not_gate_0_Y2 [get_bd_pins BCD2SEG7_0/LT_n] [get_bd_pins BCD2SEG7_0/RBI_n] [get_bd_pins six_not_gate_0/Y2]
  connect_bd_net -net six_not_gate_1_Y1 [get_bd_pins six_not_gate_1/Y1] [get_bd_pins two_4_input_nand_gate_0/A1]
  connect_bd_net -net six_not_gate_1_Y2 [get_bd_pins six_not_gate_1/Y2] [get_bd_pins two_4_input_nand_gate_0/B1]
  connect_bd_net -net six_not_gate_1_Y3 [get_bd_pins six_not_gate_1/Y3] [get_bd_pins two_4_input_nand_gate_0/C1]
  connect_bd_net -net six_not_gate_1_Y4 [get_bd_pins six_not_gate_1/Y4] [get_bd_pins two_4_input_nand_gate_0/A2] [get_bd_pins two_4_input_nand_gate_0/B2] [get_bd_pins two_4_input_nand_gate_0/C2] [get_bd_pins two_4_input_nand_gate_0/D1] [get_bd_pins two_4_input_nand_gate_0/D2]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port GND -pg 1 -y -240 -defaultsOSRD
preplace port BI_RBO_n -pg 1 -y -480 -defaultsOSRD
preplace port a -pg 1 -y -580 -defaultsOSRD
preplace port b -pg 1 -y -560 -defaultsOSRD
preplace port CLK -pg 1 -y -280 -defaultsOSRD
preplace port c -pg 1 -y -540 -defaultsOSRD
preplace port switch -pg 1 -y -20 -defaultsOSRD
preplace port d -pg 1 -y -520 -defaultsOSRD
preplace port Y1 -pg 1 -y 180 -defaultsOSRD
preplace port e -pg 1 -y -500 -defaultsOSRD
preplace port Y2 -pg 1 -y 200 -defaultsOSRD
preplace port f -pg 1 -y -460 -defaultsOSRD
preplace port Y3 -pg 1 -y 220 -defaultsOSRD
preplace port g -pg 1 -y -440 -defaultsOSRD
preplace port Y4 -pg 1 -y 240 -defaultsOSRD
preplace inst decimal_counter_0 -pg 1 -lvl 2 -y 170 -defaultsOSRD
preplace inst four_2_input_or_gate_0 -pg 1 -lvl 4 -y 60 -defaultsOSRD
preplace inst two_4_input_nand_gate_0 -pg 1 -lvl 4 -y 600 -defaultsOSRD
preplace inst four_2_input_and_gate_0 -pg 1 -lvl 5 -y 210 -defaultsOSRD
preplace inst six_not_gate_0 -pg 1 -lvl 1 -y 180 -defaultsOSRD
preplace inst BCD2SEG7_0 -pg 1 -lvl 3 -y -500 -defaultsOSRD
preplace inst six_not_gate_1 -pg 1 -lvl 3 -y 610 -defaultsOSRD
preplace inst clk_div_0 -pg 1 -lvl 1 -y -280 -defaultsOSRD
preplace inst decode138_0 -pg 1 -lvl 3 -y 170 -defaultsOSRD
preplace inst decode138_1 -pg 1 -lvl 3 -y 410 -defaultsOSRD
preplace netloc decode138_1_Y2_n 1 3 2 670 200 NJ
preplace netloc four_2_input_or_gate_0_Y1 1 4 1 960
preplace netloc four_2_input_or_gate_0_Y2 1 4 1 950
preplace netloc decimal_counter_0_Qa 1 1 2 220 270 400
preplace netloc six_not_gate_1_Y1 1 3 1 640
preplace netloc decimal_counter_0_Qb 1 2 1 420
preplace netloc decode138_0_Y6_n 1 3 2 NJ 220 NJ
preplace netloc GND_1 1 0 4 -160 280 210 280 440 290 660
preplace netloc decode138_1_Y7_n 1 3 2 690 280 NJ
preplace netloc six_not_gate_1_Y2 1 3 1 660
preplace netloc decimal_counter_0_Qc 1 2 1 430
preplace netloc BCD2SEG7_0_a 1 3 3 630 -580 NJ -580 NJ
preplace netloc six_not_gate_1_Y3 1 3 1 680
preplace netloc decimal_counter_0_Qd 1 2 2 390 -10 NJ
preplace netloc BCD2SEG7_0_b 1 3 3 630 -560 NJ -560 NJ
preplace netloc six_not_gate_0_Y1 1 1 2 NJ 290 NJ
preplace netloc six_not_gate_1_Y4 1 3 1 690
preplace netloc four_2_input_and_gate_0_Y1 1 5 1 N
preplace netloc BCD2SEG7_0_c 1 3 3 630 -540 NJ -540 NJ
preplace netloc six_not_gate_0_Y2 1 1 2 NJ -530 NJ
preplace netloc clk_in_1 1 0 1 N
preplace netloc four_2_input_and_gate_0_Y2 1 5 1 N
preplace netloc BCD2SEG7_0_d 1 3 3 630 -520 NJ -520 NJ
preplace netloc decode138_1_Y4_n 1 3 2 680 240 NJ
preplace netloc four_2_input_and_gate_0_Y3 1 5 1 N
preplace netloc BCD2SEG7_0_e 1 3 3 630 -500 NJ -500 NJ
preplace netloc clk_div_0_clk_out 1 1 1 220
preplace netloc four_2_input_and_gate_0_Y4 1 5 1 N
preplace netloc BCD2SEG7_0_f 1 3 3 N -470 NJ -470 NJ
preplace netloc decode138_0_Y1_n 1 3 1 630
preplace netloc BCD2SEG7_0_g 1 3 3 N -450 NJ -450 NJ
preplace netloc Net 1 3 3 NJ -480 NJ -480 NJ
preplace netloc decode138_0_Y4_n 1 3 2 630 260 NJ
preplace netloc decode138_1_Y0_n 1 3 1 650
preplace netloc decode138_0_Y3_n 1 3 2 NJ 180 NJ
preplace netloc E1_1 1 0 3 NJ 70 NJ 70 NJ
levelinfo -pg 1 -190 120 310 550 850 1090 1330 -top -970 -bot 730
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


