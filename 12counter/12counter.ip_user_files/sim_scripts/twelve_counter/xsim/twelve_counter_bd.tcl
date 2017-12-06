
################################################################
# This is a generated script based on design: twelve_counter
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
# source twelve_counter_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name twelve_counter

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
  set GND [ create_bd_port -dir I GND ]
  set SWI [ create_bd_port -dir I SWI ]
  set Y0_n [ create_bd_port -dir O Y0_n ]
  set Y1_n [ create_bd_port -dir O Y1_n ]
  set a [ create_bd_port -dir O a ]
  set b [ create_bd_port -dir O b ]
  set c [ create_bd_port -dir O c ]
  set clk_in [ create_bd_port -dir I clk_in ]
  set d [ create_bd_port -dir O d ]
  set e [ create_bd_port -dir O e ]
  set f [ create_bd_port -dir O f ]
  set g [ create_bd_port -dir O g ]

  # Create instance: BCD2SEG7_0, and set properties
  set BCD2SEG7_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_0 ]

  # Create instance: clk_div_0, and set properties
  set clk_div_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_0 ]
  set_property -dict [ list \
CONFIG.N {999999} \
 ] $clk_div_0

  # Create instance: clk_div_1, and set properties
  set clk_div_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:clk_div:1.0 clk_div_1 ]
  set_property -dict [ list \
CONFIG.N {99999999} \
 ] $clk_div_1

  # Create instance: decimal_counter_0, and set properties
  set decimal_counter_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:decimal_counter:1.0 decimal_counter_0 ]

  # Create instance: decode138_0, and set properties
  set decode138_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_0 ]

  # Create instance: decode138_1, and set properties
  set decode138_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:decode138:1.0 decode138_1 ]

  # Create instance: four_2_input_and_gate_0, and set properties
  set four_2_input_and_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_0 ]

  # Create instance: four_2_input_and_gate_1, and set properties
  set four_2_input_and_gate_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_1 ]

  # Create instance: four_2_input_and_gate_2, and set properties
  set four_2_input_and_gate_2 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_2 ]

  # Create instance: four_2_input_nand_gate_0, and set properties
  set four_2_input_nand_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_nand_gate:1.0 four_2_input_nand_gate_0 ]

  # Create instance: four_2_input_nand_gate_1, and set properties
  set four_2_input_nand_gate_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_nand_gate:1.0 four_2_input_nand_gate_1 ]

  # Create instance: four_2_input_nand_gate_2, and set properties
  set four_2_input_nand_gate_2 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_nand_gate:1.0 four_2_input_nand_gate_2 ]

  # Create instance: four_2_input_or_gate_0, and set properties
  set four_2_input_or_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_or_gate:1.0 four_2_input_or_gate_0 ]

  # Create instance: mux_8_to_1_0, and set properties
  set mux_8_to_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_0 ]

  # Create instance: mux_8_to_1_1, and set properties
  set mux_8_to_1_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_1 ]

  # Create instance: mux_8_to_1_2, and set properties
  set mux_8_to_1_2 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_2 ]

  # Create instance: mux_8_to_1_3, and set properties
  set mux_8_to_1_3 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_3 ]

  # Create instance: six_not_gate_0, and set properties
  set six_not_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_0 ]

  # Create instance: tri_3_input_nand_gate_0, and set properties
  set tri_3_input_nand_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:tri_3_input_nand_gate:1.0 tri_3_input_nand_gate_0 ]

  # Create instance: tri_3_input_nand_gate_1, and set properties
  set tri_3_input_nand_gate_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:tri_3_input_nand_gate:1.0 tri_3_input_nand_gate_1 ]

  # Create instance: two_4_input_and_gate_0, and set properties
  set two_4_input_and_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:two_4_input_and_gate:1.0 two_4_input_and_gate_0 ]

  # Create instance: two_4_input_nand_gate_0, and set properties
  set two_4_input_nand_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:two_4_input_nand_gate:1.0 two_4_input_nand_gate_0 ]

  # Create instance: xup_jk_0, and set properties
  set xup_jk_0 [ create_bd_cell -type ip -vlnv sysu:user:xup_jk:1.0 xup_jk_0 ]

  # Create instance: xup_jk_1, and set properties
  set xup_jk_1 [ create_bd_cell -type ip -vlnv sysu:user:xup_jk:1.0 xup_jk_1 ]

  # Create port connections
  connect_bd_net -net A1_1 [get_bd_ports GND] [get_bd_pins decimal_counter_0/CP2_n] [get_bd_pins decimal_counter_0/R0_1] [get_bd_pins decimal_counter_0/R0_2] [get_bd_pins decimal_counter_0/R9_1] [get_bd_pins decimal_counter_0/R9_2] [get_bd_pins decode138_0/E2_n] [get_bd_pins decode138_0/E3_n] [get_bd_pins decode138_1/E2_n] [get_bd_pins decode138_1/E3_n] [get_bd_pins four_2_input_and_gate_1/A3] [get_bd_pins four_2_input_and_gate_1/A4] [get_bd_pins four_2_input_and_gate_1/B3] [get_bd_pins four_2_input_and_gate_1/B4] [get_bd_pins four_2_input_nand_gate_1/B4] [get_bd_pins four_2_input_nand_gate_2/A2] [get_bd_pins four_2_input_nand_gate_2/A3] [get_bd_pins four_2_input_nand_gate_2/A4] [get_bd_pins four_2_input_nand_gate_2/B2] [get_bd_pins four_2_input_nand_gate_2/B3] [get_bd_pins four_2_input_nand_gate_2/B4] [get_bd_pins mux_8_to_1_0/D0] [get_bd_pins mux_8_to_1_0/D2] [get_bd_pins mux_8_to_1_0/D3] [get_bd_pins mux_8_to_1_0/D4] [get_bd_pins mux_8_to_1_0/D5] [get_bd_pins mux_8_to_1_0/D6] [get_bd_pins mux_8_to_1_0/D7] [get_bd_pins mux_8_to_1_1/D0] [get_bd_pins mux_8_to_1_1/D2] [get_bd_pins mux_8_to_1_1/D3] [get_bd_pins mux_8_to_1_1/D4] [get_bd_pins mux_8_to_1_1/D5] [get_bd_pins mux_8_to_1_1/D6] [get_bd_pins mux_8_to_1_1/D7] [get_bd_pins mux_8_to_1_2/D2] [get_bd_pins mux_8_to_1_2/D3] [get_bd_pins mux_8_to_1_2/D4] [get_bd_pins mux_8_to_1_2/D5] [get_bd_pins mux_8_to_1_2/D6] [get_bd_pins mux_8_to_1_2/D7] [get_bd_pins mux_8_to_1_3/D0] [get_bd_pins mux_8_to_1_3/D2] [get_bd_pins mux_8_to_1_3/D3] [get_bd_pins mux_8_to_1_3/D4] [get_bd_pins mux_8_to_1_3/D5] [get_bd_pins mux_8_to_1_3/D6] [get_bd_pins mux_8_to_1_3/D7] [get_bd_pins six_not_gate_0/A1] [get_bd_pins tri_3_input_nand_gate_1/A2] [get_bd_pins tri_3_input_nand_gate_1/A3] [get_bd_pins tri_3_input_nand_gate_1/B2] [get_bd_pins tri_3_input_nand_gate_1/B3] [get_bd_pins tri_3_input_nand_gate_1/C2] [get_bd_pins tri_3_input_nand_gate_1/C3] [get_bd_pins two_4_input_and_gate_0/A2] [get_bd_pins two_4_input_and_gate_0/B2] [get_bd_pins two_4_input_and_gate_0/C2] [get_bd_pins two_4_input_and_gate_0/D2]
  connect_bd_net -net B1_1 [get_bd_ports SWI] [get_bd_pins four_2_input_and_gate_0/A3] [get_bd_pins four_2_input_and_gate_0/B1] [get_bd_pins four_2_input_and_gate_1/B2] [get_bd_pins six_not_gate_0/A2] [get_bd_pins six_not_gate_0/A3] [get_bd_pins six_not_gate_0/A4] [get_bd_pins six_not_gate_0/A5] [get_bd_pins six_not_gate_0/A6]
  connect_bd_net -net BCD2SEG7_0_a [get_bd_ports a] [get_bd_pins BCD2SEG7_0/a]
  connect_bd_net -net BCD2SEG7_0_b [get_bd_ports b] [get_bd_pins BCD2SEG7_0/b]
  connect_bd_net -net BCD2SEG7_0_c [get_bd_ports c] [get_bd_pins BCD2SEG7_0/c]
  connect_bd_net -net BCD2SEG7_0_d [get_bd_ports d] [get_bd_pins BCD2SEG7_0/d]
  connect_bd_net -net BCD2SEG7_0_e [get_bd_ports e] [get_bd_pins BCD2SEG7_0/e]
  connect_bd_net -net BCD2SEG7_0_f [get_bd_ports f] [get_bd_pins BCD2SEG7_0/f]
  connect_bd_net -net BCD2SEG7_0_g [get_bd_ports g] [get_bd_pins BCD2SEG7_0/g]
  connect_bd_net -net clk_div_0_clk_out [get_bd_pins clk_div_0/clk_out] [get_bd_pins decimal_counter_0/CP1_n]
  connect_bd_net -net clk_div_1_clk_out [get_bd_pins clk_div_1/clk_out] [get_bd_pins xup_jk_0/CP1] [get_bd_pins xup_jk_0/CP2] [get_bd_pins xup_jk_1/CP1] [get_bd_pins xup_jk_1/CP2]
  connect_bd_net -net clk_in_1 [get_bd_ports clk_in] [get_bd_pins clk_div_0/clk_in] [get_bd_pins clk_div_1/clk_in]
  connect_bd_net -net decimal_counter_0_Qa [get_bd_pins decimal_counter_0/Qa] [get_bd_pins decode138_0/A0] [get_bd_pins mux_8_to_1_0/A2] [get_bd_pins mux_8_to_1_1/A2] [get_bd_pins mux_8_to_1_2/A2] [get_bd_pins mux_8_to_1_3/A2]
  connect_bd_net -net decimal_counter_0_Qb [get_bd_pins decimal_counter_0/Qb] [get_bd_pins decode138_0/A1] [get_bd_pins mux_8_to_1_0/A1] [get_bd_pins mux_8_to_1_1/A1] [get_bd_pins mux_8_to_1_2/A1] [get_bd_pins mux_8_to_1_3/A1]
  connect_bd_net -net decimal_counter_0_Qc [get_bd_pins decimal_counter_0/Qc] [get_bd_pins decode138_0/A2] [get_bd_pins mux_8_to_1_0/A0] [get_bd_pins mux_8_to_1_1/A0] [get_bd_pins mux_8_to_1_2/A0] [get_bd_pins mux_8_to_1_3/A0]
  connect_bd_net -net decimal_counter_0_Qd [get_bd_pins decimal_counter_0/Qd] [get_bd_pins mux_8_to_1_0/S_n] [get_bd_pins mux_8_to_1_1/S_n] [get_bd_pins mux_8_to_1_2/S_n] [get_bd_pins mux_8_to_1_3/S_n]
  connect_bd_net -net decode138_0_Y0_n [get_bd_ports Y0_n] [get_bd_pins decode138_0/Y0_n]
  connect_bd_net -net decode138_0_Y1_n [get_bd_ports Y1_n] [get_bd_pins decode138_0/Y1_n]
  connect_bd_net -net decode138_1_Y0_n [get_bd_pins decode138_1/Y0_n] [get_bd_pins four_2_input_nand_gate_2/A1]
  connect_bd_net -net decode138_1_Y1_n [get_bd_pins decode138_1/Y1_n] [get_bd_pins four_2_input_nand_gate_2/B1]
  connect_bd_net -net decode138_1_Y2_n [get_bd_pins decode138_1/Y2_n] [get_bd_pins tri_3_input_nand_gate_1/A1] [get_bd_pins two_4_input_nand_gate_0/A2]
  connect_bd_net -net decode138_1_Y3_n [get_bd_pins decode138_1/Y3_n] [get_bd_pins tri_3_input_nand_gate_1/B1] [get_bd_pins two_4_input_nand_gate_0/B2]
  connect_bd_net -net decode138_1_Y4_n [get_bd_pins decode138_1/Y4_n] [get_bd_pins tri_3_input_nand_gate_1/C1] [get_bd_pins two_4_input_nand_gate_0/A1]
  connect_bd_net -net decode138_1_Y5_n [get_bd_pins decode138_1/Y5_n] [get_bd_pins two_4_input_nand_gate_0/B1]
  connect_bd_net -net decode138_1_Y6_n [get_bd_pins decode138_1/Y6_n] [get_bd_pins two_4_input_nand_gate_0/C1] [get_bd_pins two_4_input_nand_gate_0/C2]
  connect_bd_net -net decode138_1_Y7_n [get_bd_pins decode138_1/Y7_n] [get_bd_pins two_4_input_nand_gate_0/D1] [get_bd_pins two_4_input_nand_gate_0/D2]
  connect_bd_net -net four_2_input_and_gate_0_Y1 [get_bd_pins four_2_input_and_gate_0/Y1] [get_bd_pins four_2_input_or_gate_0/A1]
  connect_bd_net -net four_2_input_and_gate_0_Y2 [get_bd_pins four_2_input_and_gate_0/Y2] [get_bd_pins four_2_input_or_gate_0/B1]
  connect_bd_net -net four_2_input_and_gate_0_Y3 [get_bd_pins four_2_input_and_gate_0/Y3] [get_bd_pins four_2_input_or_gate_0/A2]
  connect_bd_net -net four_2_input_and_gate_0_Y4 [get_bd_pins four_2_input_and_gate_0/Y4] [get_bd_pins four_2_input_or_gate_0/B2]
  connect_bd_net -net four_2_input_and_gate_1_Y1 [get_bd_pins four_2_input_and_gate_1/Y1] [get_bd_pins four_2_input_or_gate_0/A3]
  connect_bd_net -net four_2_input_and_gate_1_Y2 [get_bd_pins four_2_input_and_gate_1/Y2] [get_bd_pins four_2_input_or_gate_0/B3]
  connect_bd_net -net four_2_input_and_gate_2_Y1 [get_bd_pins four_2_input_and_gate_2/Y1] [get_bd_pins mux_8_to_1_2/D0]
  connect_bd_net -net four_2_input_and_gate_2_Y2 [get_bd_pins four_2_input_and_gate_2/Y2] [get_bd_pins mux_8_to_1_1/D1]
  connect_bd_net -net four_2_input_and_gate_2_Y3 [get_bd_pins four_2_input_and_gate_2/Y3] [get_bd_pins mux_8_to_1_3/D1]
  connect_bd_net -net four_2_input_and_gate_2_Y4 [get_bd_pins four_2_input_and_gate_2/Y4] [get_bd_pins four_2_input_or_gate_0/A4]
  connect_bd_net -net four_2_input_nand_gate_0_Y1 [get_bd_pins four_2_input_nand_gate_0/A3] [get_bd_pins four_2_input_nand_gate_0/Y1]
  connect_bd_net -net four_2_input_nand_gate_0_Y2 [get_bd_pins four_2_input_nand_gate_0/B3] [get_bd_pins four_2_input_nand_gate_0/Y2] [get_bd_pins four_2_input_nand_gate_1/A4] [get_bd_pins four_2_input_nand_gate_1/B3]
  connect_bd_net -net four_2_input_nand_gate_0_Y3 [get_bd_pins four_2_input_and_gate_0/B3] [get_bd_pins four_2_input_nand_gate_0/Y3]
  connect_bd_net -net four_2_input_nand_gate_0_Y4 [get_bd_pins four_2_input_nand_gate_0/Y4] [get_bd_pins four_2_input_nand_gate_1/A1]
  connect_bd_net -net four_2_input_nand_gate_1_Y1 [get_bd_pins four_2_input_and_gate_0/B4] [get_bd_pins four_2_input_nand_gate_1/Y1]
  connect_bd_net -net four_2_input_nand_gate_1_Y2 [get_bd_pins four_2_input_and_gate_1/A1] [get_bd_pins four_2_input_nand_gate_1/Y2]
  connect_bd_net -net four_2_input_nand_gate_1_Y3 [get_bd_pins four_2_input_and_gate_1/A2] [get_bd_pins four_2_input_nand_gate_1/Y3]
  connect_bd_net -net four_2_input_nand_gate_2_Y1 [get_bd_pins four_2_input_and_gate_2/A2] [get_bd_pins four_2_input_nand_gate_2/Y1]
  connect_bd_net -net four_2_input_or_gate_0_Y1 [get_bd_pins four_2_input_or_gate_0/Y1] [get_bd_pins xup_jk_0/J2] [get_bd_pins xup_jk_0/K2]
  connect_bd_net -net four_2_input_or_gate_0_Y2 [get_bd_pins four_2_input_or_gate_0/Y2] [get_bd_pins xup_jk_1/J1] [get_bd_pins xup_jk_1/K1]
  connect_bd_net -net four_2_input_or_gate_0_Y3 [get_bd_pins four_2_input_or_gate_0/Y3] [get_bd_pins xup_jk_1/J2] [get_bd_pins xup_jk_1/K2]
  connect_bd_net -net four_2_input_or_gate_0_Y4 [get_bd_pins four_2_input_or_gate_0/Y4] [get_bd_pins mux_8_to_1_0/D1]
  connect_bd_net -net mux_8_to_1_0_Q [get_bd_pins BCD2SEG7_0/BCD_C] [get_bd_pins mux_8_to_1_0/Q]
  connect_bd_net -net mux_8_to_1_1_Q [get_bd_pins BCD2SEG7_0/BCD_A] [get_bd_pins mux_8_to_1_1/Q]
  connect_bd_net -net mux_8_to_1_2_Q [get_bd_pins BCD2SEG7_0/BCD_D] [get_bd_pins mux_8_to_1_2/Q]
  connect_bd_net -net mux_8_to_1_3_Q [get_bd_pins BCD2SEG7_0/BCD_B] [get_bd_pins mux_8_to_1_3/Q]
  connect_bd_net -net six_not_gate_0_Y1 [get_bd_pins BCD2SEG7_0/LT_n] [get_bd_pins BCD2SEG7_0/RBI_n] [get_bd_pins decode138_0/E1] [get_bd_pins decode138_1/E1] [get_bd_pins six_not_gate_0/Y1] [get_bd_pins xup_jk_0/CLR1_n] [get_bd_pins xup_jk_0/CLR2_n] [get_bd_pins xup_jk_0/J1] [get_bd_pins xup_jk_0/K1] [get_bd_pins xup_jk_0/PR1_n] [get_bd_pins xup_jk_0/PR2_n] [get_bd_pins xup_jk_1/CLR1_n] [get_bd_pins xup_jk_1/CLR2_n] [get_bd_pins xup_jk_1/PR1_n] [get_bd_pins xup_jk_1/PR2_n]
  connect_bd_net -net six_not_gate_0_Y2 [get_bd_pins four_2_input_and_gate_0/A2] [get_bd_pins four_2_input_and_gate_0/A4] [get_bd_pins four_2_input_and_gate_1/B1] [get_bd_pins six_not_gate_0/Y2]
  connect_bd_net -net tri_3_input_nand_gate_0_Y1 [get_bd_pins four_2_input_nand_gate_1/A2] [get_bd_pins four_2_input_nand_gate_1/B1] [get_bd_pins tri_3_input_nand_gate_0/Y1]
  connect_bd_net -net tri_3_input_nand_gate_0_Y2 [get_bd_pins four_2_input_nand_gate_1/B2] [get_bd_pins tri_3_input_nand_gate_0/Y2]
  connect_bd_net -net tri_3_input_nand_gate_0_Y3 [get_bd_pins four_2_input_nand_gate_1/A3] [get_bd_pins tri_3_input_nand_gate_0/Y3]
  connect_bd_net -net tri_3_input_nand_gate_1_Y1 [get_bd_pins four_2_input_and_gate_2/A1] [get_bd_pins tri_3_input_nand_gate_1/Y1]
  connect_bd_net -net two_4_input_and_gate_0_Y1 [get_bd_pins four_2_input_or_gate_0/B4] [get_bd_pins two_4_input_and_gate_0/Y1]
  connect_bd_net -net two_4_input_nand_gate_0_Y1 [get_bd_pins four_2_input_and_gate_2/A3] [get_bd_pins two_4_input_nand_gate_0/Y1]
  connect_bd_net -net two_4_input_nand_gate_0_Y2 [get_bd_pins four_2_input_and_gate_2/A4] [get_bd_pins two_4_input_nand_gate_0/Y2]
  connect_bd_net -net xup_jk_0_Q1 [get_bd_pins decode138_1/A0] [get_bd_pins four_2_input_and_gate_0/A1] [get_bd_pins four_2_input_nand_gate_0/A1] [get_bd_pins mux_8_to_1_2/D1] [get_bd_pins tri_3_input_nand_gate_0/A3] [get_bd_pins two_4_input_and_gate_0/D1] [get_bd_pins xup_jk_0/Q1]
  connect_bd_net -net xup_jk_0_Q1_n [get_bd_pins four_2_input_and_gate_0/B2] [get_bd_pins tri_3_input_nand_gate_0/A2] [get_bd_pins xup_jk_0/Q1_n]
  connect_bd_net -net xup_jk_0_Q2 [get_bd_pins decode138_1/A1] [get_bd_pins four_2_input_nand_gate_0/B1] [get_bd_pins tri_3_input_nand_gate_0/B3] [get_bd_pins xup_jk_0/Q2]
  connect_bd_net -net xup_jk_0_Q2_n [get_bd_pins four_2_input_nand_gate_0/B4] [get_bd_pins tri_3_input_nand_gate_0/A1] [get_bd_pins tri_3_input_nand_gate_0/B2] [get_bd_pins two_4_input_and_gate_0/C1] [get_bd_pins xup_jk_0/Q2_n]
  connect_bd_net -net xup_jk_1_Q1 [get_bd_pins decode138_1/A2] [get_bd_pins four_2_input_nand_gate_0/A2] [get_bd_pins four_2_input_nand_gate_0/A4] [get_bd_pins tri_3_input_nand_gate_0/C3] [get_bd_pins two_4_input_and_gate_0/B1] [get_bd_pins xup_jk_1/Q1]
  connect_bd_net -net xup_jk_1_Q1_n [get_bd_pins tri_3_input_nand_gate_0/B1] [get_bd_pins tri_3_input_nand_gate_0/C2] [get_bd_pins xup_jk_1/Q1_n]
  connect_bd_net -net xup_jk_1_Q2 [get_bd_pins four_2_input_and_gate_2/B1] [get_bd_pins four_2_input_and_gate_2/B2] [get_bd_pins four_2_input_nand_gate_0/B2] [get_bd_pins two_4_input_and_gate_0/A1] [get_bd_pins xup_jk_1/Q2]
  connect_bd_net -net xup_jk_1_Q2_n [get_bd_pins four_2_input_and_gate_2/B3] [get_bd_pins four_2_input_and_gate_2/B4] [get_bd_pins tri_3_input_nand_gate_0/C1] [get_bd_pins xup_jk_1/Q2_n]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port GND -pg 1 -y 200 -defaultsOSRD
preplace port clk_in -pg 1 -y 120 -defaultsOSRD
preplace port BI_RBO_n -pg 1 -y -630 -defaultsOSRD
preplace port a -pg 1 -y -770 -defaultsOSRD
preplace port Y0_n -pg 1 -y -410 -defaultsOSRD
preplace port b -pg 1 -y -750 -defaultsOSRD
preplace port c -pg 1 -y -730 -defaultsOSRD
preplace port Y1_n -pg 1 -y -390 -defaultsOSRD
preplace port d -pg 1 -y -710 -defaultsOSRD
preplace port SWI -pg 1 -y 70 -defaultsOSRD
preplace port e -pg 1 -y -690 -defaultsOSRD
preplace port f -pg 1 -y -670 -defaultsOSRD
preplace port g -pg 1 -y -650 -defaultsOSRD
preplace inst decimal_counter_0 -pg 1 -lvl 3 -y -360 -defaultsOSRD
preplace inst two_4_input_and_gate_0 -pg 1 -lvl 8 -y 670 -defaultsOSRD
preplace inst four_2_input_nand_gate_0 -pg 1 -lvl 4 -y 650 -defaultsOSRD
preplace inst four_2_input_or_gate_0 -pg 1 -lvl 6 -y 420 -defaultsOSRD
preplace inst four_2_input_nand_gate_1 -pg 1 -lvl 6 -y 690 -defaultsOSRD
preplace inst four_2_input_nand_gate_2 -pg 1 -lvl 9 -y 320 -defaultsOSRD
preplace inst two_4_input_nand_gate_0 -pg 1 -lvl 9 -y 40 -defaultsOSRD
preplace inst xup_jk_0 -pg 1 -lvl 4 -y 30 -defaultsOSRD
preplace inst four_2_input_and_gate_0 -pg 1 -lvl 4 -y 400 -defaultsOSRD
preplace inst xup_jk_1 -pg 1 -lvl 6 -y 130 -defaultsOSRD
preplace inst four_2_input_and_gate_1 -pg 1 -lvl 7 -y 690 -defaultsOSRD
preplace inst mux_8_to_1_0 -pg 1 -lvl 5 -y -740 -defaultsOSRD
preplace inst BCD2SEG7_0 -pg 1 -lvl 6 -y -700 -defaultsOSRD
preplace inst four_2_input_and_gate_2 -pg 1 -lvl 10 -y 250 -defaultsOSRD
preplace inst six_not_gate_0 -pg 1 -lvl 1 -y 250 -defaultsOSRD
preplace inst mux_8_to_1_1 -pg 1 -lvl 4 -y -740 -defaultsOSRD
preplace inst mux_8_to_1_2 -pg 1 -lvl 5 -y -380 -defaultsOSRD
preplace inst clk_div_0 -pg 1 -lvl 2 -y -320 -defaultsOSRD
preplace inst decode138_0 -pg 1 -lvl 6 -y -340 -defaultsOSRD
preplace inst mux_8_to_1_3 -pg 1 -lvl 4 -y -370 -defaultsOSRD
preplace inst decode138_1 -pg 1 -lvl 7 -y 90 -defaultsOSRD
preplace inst tri_3_input_nand_gate_0 -pg 1 -lvl 4 -y 910 -defaultsOSRD
preplace inst clk_div_1 -pg 1 -lvl 2 -y 230 -defaultsOSRD
preplace inst tri_3_input_nand_gate_1 -pg 1 -lvl 9 -y 620 -defaultsOSRD
preplace netloc four_2_input_nand_gate_2_Y1 1 9 1 2310
preplace netloc decode138_1_Y5_n 1 7 2 NJ -10 NJ
preplace netloc four_2_input_or_gate_0_Y3 1 5 2 1180 820 1430
preplace netloc clk_div_0_clk_out 1 2 1 260
preplace netloc four_2_input_or_gate_0_Y4 1 4 3 920 860 NJ 860 1420
preplace netloc two_4_input_and_gate_0_Y1 1 5 4 NJ 880 NJ 880 NJ 880 2010
preplace netloc four_2_input_and_gate_1_Y1 1 5 3 NJ 850 NJ 850 1750
preplace netloc mux_8_to_1_3_Q 1 4 2 860 -580 NJ
preplace netloc four_2_input_and_gate_1_Y2 1 5 3 NJ 870 NJ 870 1740
preplace netloc xup_jk_1_Q1 1 3 5 NJ 1080 NJ 1080 NJ 1080 1490 820 NJ
preplace netloc BCD2SEG7_0_a 1 6 5 NJ -770 NJ -770 NJ -770 NJ -770 NJ
preplace netloc clk_div_1_clk_out 1 2 4 260 180 470 180 NJ 100 1080
preplace netloc xup_jk_1_Q2 1 3 7 NJ 280 NJ 290 NJ 290 1480 220 1800 190 NJ 190 2290
preplace netloc BCD2SEG7_0_b 1 6 5 NJ -750 NJ -750 NJ -750 NJ -750 NJ
preplace netloc BCD2SEG7_0_c 1 6 5 NJ -730 NJ -730 NJ -730 NJ -730 NJ
preplace netloc BCD2SEG7_0_d 1 6 5 NJ -710 NJ -710 NJ -710 NJ -710 NJ
preplace netloc BCD2SEG7_0_e 1 6 5 NJ -690 NJ -690 NJ -690 NJ -690 NJ
preplace netloc BCD2SEG7_0_f 1 6 5 NJ -670 NJ -670 NJ -670 NJ -670 NJ
preplace netloc decode138_0_Y1_n 1 6 5 NJ -390 NJ -390 NJ -390 NJ -390 NJ
preplace netloc decode138_1_Y4_n 1 7 2 NJ 100 2020
preplace netloc BCD2SEG7_0_g 1 6 5 NJ -650 NJ -650 NJ -650 NJ -650 NJ
preplace netloc B1_1 1 0 7 NJ 150 NJ 150 NJ 150 NJ 240 NJ 240 NJ 810 NJ
preplace netloc xup_jk_0_Q2_n 1 3 5 580 1050 870 890 NJ 890 NJ 890 NJ
preplace netloc decode138_1_Y2_n 1 7 2 NJ 60 2060
preplace netloc four_2_input_nand_gate_0_Y1 1 3 2 590 780 850
preplace netloc tri_3_input_nand_gate_1_Y1 1 9 1 2300
preplace netloc four_2_input_nand_gate_0_Y2 1 3 3 600 770 860 720 NJ
preplace netloc four_2_input_nand_gate_0_Y3 1 3 2 530 1040 830
preplace netloc four_2_input_nand_gate_0_Y4 1 4 2 NJ 620 N
preplace netloc mux_8_to_1_1_Q 1 4 2 NJ -900 NJ
preplace netloc tri_3_input_nand_gate_0_Y1 1 4 2 840 660 1150
preplace netloc tri_3_input_nand_gate_0_Y2 1 4 2 890 680 NJ
preplace netloc tri_3_input_nand_gate_0_Y3 1 4 2 910 700 NJ
preplace netloc decode138_1_Y6_n 1 7 2 NJ 90 2010
preplace netloc four_2_input_nand_gate_1_Y1 1 3 4 NJ 1060 NJ 1060 NJ 1060 1410
preplace netloc four_2_input_nand_gate_1_Y2 1 6 1 1510
preplace netloc decode138_1_Y3_n 1 7 2 NJ 80 2070
preplace netloc four_2_input_nand_gate_1_Y3 1 6 1 1500
preplace netloc A1_1 1 0 9 -140 -260 NJ -260 NJ -260 NJ -930 NJ -200 NJ 840 NJ 810 NJ 790 NJ
preplace netloc mux_8_to_1_0_Q 1 5 1 1140
preplace netloc decimal_counter_0_Qa 1 3 3 460 -960 900 -540 1140
preplace netloc decimal_counter_0_Qb 1 3 3 470 -950 890 -210 NJ
preplace netloc decimal_counter_0_Qc 1 3 3 480 -920 880 -220 NJ
preplace netloc decimal_counter_0_Qd 1 3 2 520 -900 NJ
preplace netloc xup_jk_0_Q1_n 1 3 2 520 190 830
preplace netloc decode138_1_Y1_n 1 7 2 NJ 40 2030
preplace netloc xup_jk_0_Q1 1 3 5 480 -120 860 -30 NJ -30 1530 -30 NJ
preplace netloc mux_8_to_1_2_Q 1 5 1 1080
preplace netloc xup_jk_0_Q2 1 3 4 490 -110 850 -10 NJ -10 NJ
preplace netloc xup_jk_1_Q2_n 1 3 7 NJ 260 NJ 260 NJ 270 1470 210 NJ 200 NJ 200 NJ
preplace netloc clk_in_1 1 0 2 NJ 120 90
preplace netloc decode138_1_Y7_n 1 7 2 NJ 110 2040
preplace netloc six_not_gate_0_Y1 1 1 6 NJ 120 NJ 120 NJ -130 NJ -130 NJ 280 NJ
preplace netloc four_2_input_and_gate_2_Y1 1 4 7 930 300 NJ 300 NJ 300 NJ 160 NJ 160 NJ 130 2550
preplace netloc six_not_gate_0_Y2 1 1 6 NJ 280 NJ 280 NJ 250 NJ 250 NJ 830 NJ
preplace netloc four_2_input_and_gate_2_Y2 1 3 8 540 520 NJ 520 NJ 540 NJ 450 NJ 450 NJ 450 NJ 450 2550
preplace netloc decode138_1_Y0_n 1 7 2 NJ 20 2050
preplace netloc four_2_input_and_gate_2_Y3 1 3 8 550 530 NJ 530 NJ 550 NJ 460 NJ 460 NJ 460 NJ 460 2540
preplace netloc four_2_input_and_gate_0_Y1 1 4 2 NJ 350 N
preplace netloc four_2_input_and_gate_2_Y4 1 5 6 NJ 900 NJ 900 NJ 900 NJ 900 NJ 900 2530
preplace netloc four_2_input_and_gate_0_Y2 1 4 2 NJ 370 N
preplace netloc four_2_input_and_gate_0_Y3 1 4 2 NJ 390 N
preplace netloc two_4_input_nand_gate_0_Y1 1 9 1 2320
preplace netloc four_2_input_and_gate_0_Y4 1 4 2 NJ 410 N
preplace netloc two_4_input_nand_gate_0_Y2 1 9 1 2280
preplace netloc decode138_0_Y0_n 1 6 5 NJ -410 NJ -410 NJ -410 NJ -410 NJ
preplace netloc xup_jk_1_Q1_n 1 3 4 NJ 1070 NJ 1070 NJ 1070 1460
preplace netloc four_2_input_or_gate_0_Y1 1 3 4 NJ 170 NJ 170 NJ 560 1450
preplace netloc four_2_input_or_gate_0_Y2 1 5 2 1170 570 1440
levelinfo -pg 1 -170 10 180 380 730 1010 1310 1640 1910 2170 2430 2570 -top -970 -bot 1100
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


