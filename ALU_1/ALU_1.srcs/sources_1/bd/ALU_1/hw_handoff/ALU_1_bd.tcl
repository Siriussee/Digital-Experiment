
################################################################
# This is a generated script based on design: ALU_1
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
# source ALU_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name ALU_1

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
  set A [ create_bd_port -dir I A ]
  set B [ create_bd_port -dir I B ]
  set Cn [ create_bd_port -dir I Cn ]
  set Cn_1 [ create_bd_port -dir O Cn_1 ]
  set GND [ create_bd_port -dir I GND ]
  set S0 [ create_bd_port -dir I S0 ]
  set S1 [ create_bd_port -dir I S1 ]
  set S2 [ create_bd_port -dir I S2 ]
  set Y [ create_bd_port -dir O Y ]

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

  # Create instance: four_2_input_and_gate_3, and set properties
  set four_2_input_and_gate_3 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_and_gate:1.0 four_2_input_and_gate_3 ]

  # Create instance: four_2_input_or_gate_0, and set properties
  set four_2_input_or_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:four_2_input_or_gate:1.0 four_2_input_or_gate_0 ]

  # Create instance: mux_8_to_1_0, and set properties
  set mux_8_to_1_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_0 ]

  # Create instance: mux_8_to_1_1, and set properties
  set mux_8_to_1_1 [ create_bd_cell -type ip -vlnv xilinx.com:xup:mux_8_to_1:1.0 mux_8_to_1_1 ]

  # Create instance: six_not_gate_0, and set properties
  set six_not_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_0 ]

  # Create instance: six_not_gate_1, and set properties
  set six_not_gate_1 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_1 ]

  # Create instance: six_not_gate_2, and set properties
  set six_not_gate_2 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_2 ]

  # Create port connections
  connect_bd_net -net A0_2 [get_bd_ports S0] [get_bd_pins mux_8_to_1_0/A0] [get_bd_pins mux_8_to_1_1/A0]
  connect_bd_net -net A1_2 [get_bd_ports S1] [get_bd_pins mux_8_to_1_0/A1] [get_bd_pins mux_8_to_1_1/A1]
  connect_bd_net -net A2_2 [get_bd_ports S2] [get_bd_pins mux_8_to_1_0/A2] [get_bd_pins mux_8_to_1_1/A2]
  connect_bd_net -net A4_1 [get_bd_ports GND] [get_bd_pins decode138_0/E2_n] [get_bd_pins decode138_0/E3_n] [get_bd_pins decode138_1/E2_n] [get_bd_pins decode138_1/E3_n] [get_bd_pins four_2_input_and_gate_3/A4] [get_bd_pins four_2_input_and_gate_3/B4] [get_bd_pins four_2_input_or_gate_0/A3] [get_bd_pins four_2_input_or_gate_0/A4] [get_bd_pins four_2_input_or_gate_0/B3] [get_bd_pins four_2_input_or_gate_0/B4] [get_bd_pins mux_8_to_1_0/D7] [get_bd_pins mux_8_to_1_0/S_n] [get_bd_pins mux_8_to_1_1/D7] [get_bd_pins mux_8_to_1_1/S_n] [get_bd_pins six_not_gate_0/A5] [get_bd_pins six_not_gate_0/A6] [get_bd_pins six_not_gate_1/A3] [get_bd_pins six_not_gate_1/A4] [get_bd_pins six_not_gate_1/A5] [get_bd_pins six_not_gate_1/A6] [get_bd_pins six_not_gate_2/A4] [get_bd_pins six_not_gate_2/A5] [get_bd_pins six_not_gate_2/A6]
  connect_bd_net -net A_1 [get_bd_ports A] [get_bd_pins decode138_0/A2] [get_bd_pins decode138_1/A2] [get_bd_pins four_2_input_and_gate_3/A1] [get_bd_pins four_2_input_and_gate_3/A3] [get_bd_pins four_2_input_or_gate_0/A1] [get_bd_pins mux_8_to_1_1/D2] [get_bd_pins six_not_gate_1/A1]
  connect_bd_net -net B_1 [get_bd_ports B] [get_bd_pins decode138_0/A1] [get_bd_pins decode138_1/A1] [get_bd_pins four_2_input_and_gate_3/B1] [get_bd_pins four_2_input_and_gate_3/B2] [get_bd_pins four_2_input_or_gate_0/B1] [get_bd_pins mux_8_to_1_1/D3] [get_bd_pins six_not_gate_1/A2]
  connect_bd_net -net Cn_2 [get_bd_ports Cn] [get_bd_pins decode138_0/A0] [get_bd_pins decode138_1/A0]
  connect_bd_net -net decode138_0_Y1_n [get_bd_pins decode138_0/Y1_n] [get_bd_pins four_2_input_and_gate_0/A1]
  connect_bd_net -net decode138_0_Y2_n [get_bd_pins decode138_0/Y2_n] [get_bd_pins four_2_input_and_gate_0/B1]
  connect_bd_net -net decode138_0_Y3_n [get_bd_pins decode138_0/Y3_n] [get_bd_pins four_2_input_and_gate_0/A3]
  connect_bd_net -net decode138_0_Y4_n [get_bd_pins decode138_0/Y4_n] [get_bd_pins four_2_input_and_gate_0/A2]
  connect_bd_net -net decode138_0_Y5_n [get_bd_pins decode138_0/Y5_n] [get_bd_pins four_2_input_and_gate_0/B3]
  connect_bd_net -net decode138_0_Y6_n [get_bd_pins decode138_0/Y6_n] [get_bd_pins four_2_input_and_gate_0/A4]
  connect_bd_net -net decode138_0_Y7_n [get_bd_pins decode138_0/Y7_n] [get_bd_pins four_2_input_and_gate_0/B2] [get_bd_pins four_2_input_and_gate_0/B4]
  connect_bd_net -net decode138_1_Y1_n [get_bd_pins decode138_1/Y1_n] [get_bd_pins four_2_input_and_gate_2/A1] [get_bd_pins four_2_input_and_gate_2/A3]
  connect_bd_net -net decode138_1_Y2_n [get_bd_pins decode138_1/Y2_n] [get_bd_pins four_2_input_and_gate_2/B1] [get_bd_pins four_2_input_and_gate_2/B3]
  connect_bd_net -net decode138_1_Y3_n [get_bd_pins decode138_1/Y3_n] [get_bd_pins four_2_input_and_gate_2/A4]
  connect_bd_net -net decode138_1_Y4_n [get_bd_pins decode138_1/Y4_n] [get_bd_pins four_2_input_and_gate_2/A2]
  connect_bd_net -net decode138_1_Y7_n [get_bd_pins decode138_1/Y7_n] [get_bd_pins four_2_input_and_gate_2/B2] [get_bd_pins four_2_input_and_gate_2/B4]
  connect_bd_net -net four_2_input_and_gate_0_Y1 [get_bd_pins four_2_input_and_gate_0/Y1] [get_bd_pins four_2_input_and_gate_1/A1]
  connect_bd_net -net four_2_input_and_gate_0_Y2 [get_bd_pins four_2_input_and_gate_0/Y2] [get_bd_pins four_2_input_and_gate_1/B1]
  connect_bd_net -net four_2_input_and_gate_0_Y3 [get_bd_pins four_2_input_and_gate_0/Y3] [get_bd_pins four_2_input_and_gate_1/A2]
  connect_bd_net -net four_2_input_and_gate_0_Y4 [get_bd_pins four_2_input_and_gate_0/Y4] [get_bd_pins four_2_input_and_gate_1/B2]
  connect_bd_net -net four_2_input_and_gate_1_Y1 [get_bd_pins four_2_input_and_gate_1/Y1] [get_bd_pins six_not_gate_0/A1]
  connect_bd_net -net four_2_input_and_gate_1_Y2 [get_bd_pins four_2_input_and_gate_1/Y2] [get_bd_pins six_not_gate_0/A2]
  connect_bd_net -net four_2_input_and_gate_1_Y3 [get_bd_pins four_2_input_and_gate_1/Y3] [get_bd_pins six_not_gate_0/A3]
  connect_bd_net -net four_2_input_and_gate_1_Y4 [get_bd_pins four_2_input_and_gate_1/Y4] [get_bd_pins six_not_gate_0/A4]
  connect_bd_net -net four_2_input_and_gate_2_Y1 [get_bd_pins four_2_input_and_gate_1/A3] [get_bd_pins four_2_input_and_gate_2/Y1]
  connect_bd_net -net four_2_input_and_gate_2_Y2 [get_bd_pins four_2_input_and_gate_1/B3] [get_bd_pins four_2_input_and_gate_2/Y2]
  connect_bd_net -net four_2_input_and_gate_2_Y3 [get_bd_pins four_2_input_and_gate_1/A4] [get_bd_pins four_2_input_and_gate_2/Y3]
  connect_bd_net -net four_2_input_and_gate_2_Y4 [get_bd_pins four_2_input_and_gate_1/B4] [get_bd_pins four_2_input_and_gate_2/Y4]
  connect_bd_net -net four_2_input_and_gate_3_Y1 [get_bd_pins four_2_input_and_gate_3/Y1] [get_bd_pins mux_8_to_1_0/D0] [get_bd_pins six_not_gate_2/A1]
  connect_bd_net -net four_2_input_and_gate_3_Y2 [get_bd_pins four_2_input_and_gate_3/Y2] [get_bd_pins four_2_input_or_gate_0/A2]
  connect_bd_net -net four_2_input_and_gate_3_Y3 [get_bd_pins four_2_input_and_gate_3/Y3] [get_bd_pins four_2_input_or_gate_0/B2]
  connect_bd_net -net four_2_input_or_gate_0_Y1 [get_bd_pins four_2_input_or_gate_0/Y1] [get_bd_pins mux_8_to_1_0/D1] [get_bd_pins six_not_gate_2/A2]
  connect_bd_net -net four_2_input_or_gate_0_Y2 [get_bd_pins four_2_input_or_gate_0/Y2] [get_bd_pins mux_8_to_1_0/D4] [get_bd_pins six_not_gate_2/A3]
  connect_bd_net -net mux_8_to_1_0_Q [get_bd_ports Y] [get_bd_pins mux_8_to_1_0/Q]
  connect_bd_net -net mux_8_to_1_1_Q [get_bd_ports Cn_1] [get_bd_pins mux_8_to_1_1/Q]
  connect_bd_net -net six_not_gate_0_Y1 [get_bd_pins mux_8_to_1_0/D5] [get_bd_pins six_not_gate_0/Y1]
  connect_bd_net -net six_not_gate_0_Y2 [get_bd_pins mux_8_to_1_1/D5] [get_bd_pins six_not_gate_0/Y2]
  connect_bd_net -net six_not_gate_0_Y3 [get_bd_pins mux_8_to_1_0/D6] [get_bd_pins six_not_gate_0/Y3]
  connect_bd_net -net six_not_gate_0_Y4 [get_bd_pins mux_8_to_1_1/D6] [get_bd_pins six_not_gate_0/Y4]
  connect_bd_net -net six_not_gate_1_Y1 [get_bd_pins four_2_input_and_gate_3/A2] [get_bd_pins mux_8_to_1_0/D2] [get_bd_pins six_not_gate_1/Y1]
  connect_bd_net -net six_not_gate_1_Y2 [get_bd_pins four_2_input_and_gate_3/B3] [get_bd_pins mux_8_to_1_0/D3] [get_bd_pins six_not_gate_1/Y2]
  connect_bd_net -net six_not_gate_2_Y1 [get_bd_pins mux_8_to_1_1/D0] [get_bd_pins six_not_gate_2/Y1]
  connect_bd_net -net six_not_gate_2_Y2 [get_bd_pins mux_8_to_1_1/D1] [get_bd_pins six_not_gate_2/Y2]
  connect_bd_net -net six_not_gate_2_Y3 [get_bd_pins mux_8_to_1_1/D4] [get_bd_pins six_not_gate_2/Y3]
  connect_bd_net -net six_not_gate_2_Y4 [get_bd_pins decode138_0/E1] [get_bd_pins decode138_1/E1] [get_bd_pins six_not_gate_2/Y4]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port A -pg 1 -y -530 -defaultsOSRD
preplace port Cn -pg 1 -y -450 -defaultsOSRD
preplace port B -pg 1 -y -490 -defaultsOSRD
preplace port GND -pg 1 -y -1060 -defaultsOSRD
preplace port Cn_1 -pg 1 -y -250 -defaultsOSRD
preplace port S0 -pg 1 -y -290 -defaultsOSRD
preplace port Y -pg 1 -y -600 -defaultsOSRD
preplace port S1 -pg 1 -y -310 -defaultsOSRD
preplace port POW -pg 1 -y -270 -defaultsOSRD
preplace port S2 -pg 1 -y -330 -defaultsOSRD
preplace inst four_2_input_or_gate_0 -pg 1 -lvl 1 -y -870 -defaultsOSRD
preplace inst four_2_input_and_gate_0 -pg 1 -lvl 4 -y -480 -defaultsOSRD
preplace inst four_2_input_and_gate_1 -pg 1 -lvl 5 -y -260 -defaultsOSRD
preplace inst mux_8_to_1_0 -pg 1 -lvl 7 -y -590 -defaultsOSRD
preplace inst mux_8_to_1_1 -pg 1 -lvl 7 -y -240 -defaultsOSRD
preplace inst four_2_input_and_gate_2 -pg 1 -lvl 4 -y -200 -defaultsOSRD
preplace inst six_not_gate_0 -pg 1 -lvl 6 -y -460 -defaultsOSRD
preplace inst six_not_gate_1 -pg 1 -lvl 1 -y -630 -defaultsOSRD
preplace inst four_2_input_and_gate_3 -pg 1 -lvl 1 -y -1120 -defaultsOSRD
preplace inst six_not_gate_2 -pg 1 -lvl 2 -y -780 -defaultsOSRD
preplace inst decode138_0 -pg 1 -lvl 3 -y -480 -defaultsOSRD
preplace inst decode138_1 -pg 1 -lvl 3 -y -200 -defaultsOSRD
preplace netloc A4_1 1 0 7 -1300 -730 -920 -660 NJ -80 NJ -80 NJ -440 NJ -360 NJ
preplace netloc four_2_input_or_gate_0_Y1 1 1 6 NJ -680 NJ -680 NJ -680 NJ -680 NJ -680 NJ
preplace netloc A_1 1 0 7 NJ -520 NJ -520 NJ -360 NJ -360 NJ -420 NJ -170 NJ
preplace netloc decode138_1_Y2_n 1 3 1 -30
preplace netloc decode138_0_Y7_n 1 3 1 -10
preplace netloc decode138_0_Y2_n 1 3 1 -40
preplace netloc mux_8_to_1_1_Q 1 7 1 N
preplace netloc four_2_input_or_gate_0_Y2 1 1 6 NJ -610 NJ -610 NJ -610 NJ -610 NJ -610 NJ
preplace netloc four_2_input_and_gate_1_Y1 1 5 1 560
preplace netloc four_2_input_and_gate_1_Y2 1 5 1 600
preplace netloc mux_8_to_1_0_Q 1 7 1 N
preplace netloc six_not_gate_2_Y1 1 2 5 NJ -830 NJ -830 NJ -830 NJ -830 NJ
preplace netloc four_2_input_and_gate_3_Y1 1 1 6 NJ -880 NJ -880 NJ -880 NJ -880 NJ -880 920
preplace netloc six_not_gate_1_Y1 1 0 7 -1290 -750 -940 -670 NJ -670 NJ -670 NJ -670 NJ -670 NJ
preplace netloc four_2_input_and_gate_1_Y3 1 5 1 610
preplace netloc decode138_0_Y6_n 1 3 1 N
preplace netloc six_not_gate_2_Y2 1 2 5 NJ -810 NJ -810 NJ -810 NJ -810 810
preplace netloc four_2_input_and_gate_3_Y2 1 0 2 -1270 -1240 -930
preplace netloc six_not_gate_1_Y2 1 0 7 -1280 -530 -960 -600 NJ -600 NJ -600 NJ -560 NJ -560 NJ
preplace netloc four_2_input_and_gate_1_Y4 1 5 1 630
preplace netloc four_2_input_and_gate_2_Y1 1 4 1 320
preplace netloc decode138_1_Y7_n 1 3 1 -10
preplace netloc six_not_gate_2_Y3 1 2 5 NJ -790 NJ -790 NJ -790 NJ -790 NJ
preplace netloc four_2_input_and_gate_3_Y3 1 0 2 -1260 -1000 -930
preplace netloc six_not_gate_0_Y1 1 6 1 850
preplace netloc four_2_input_and_gate_2_Y2 1 4 1 330
preplace netloc six_not_gate_2_Y4 1 2 1 -480
preplace netloc six_not_gate_0_Y2 1 6 1 790
preplace netloc four_2_input_and_gate_2_Y3 1 4 1 340
preplace netloc decode138_0_Y5_n 1 3 1 N
preplace netloc four_2_input_and_gate_0_Y1 1 4 1 320
preplace netloc six_not_gate_0_Y3 1 6 1 840
preplace netloc four_2_input_and_gate_2_Y4 1 4 1 350
preplace netloc decode138_1_Y4_n 1 3 1 -20
preplace netloc four_2_input_and_gate_0_Y2 1 4 1 300
preplace netloc A2_1 1 0 3 NJ -450 NJ -450 -500
preplace netloc A2_2 1 0 7 NJ -320 NJ -320 NJ -320 NJ -320 NJ -390 NJ -340 NJ
preplace netloc six_not_gate_0_Y4 1 6 1 780
preplace netloc four_2_input_and_gate_0_Y3 1 4 1 270
preplace netloc four_2_input_and_gate_0_Y4 1 4 1 250
preplace netloc decode138_0_Y1_n 1 3 1 -50
preplace netloc A1_1 1 0 7 -1320 -510 NJ -510 -470 -340 NJ -340 NJ -380 NJ -190 NJ
preplace netloc A1_2 1 0 7 NJ -330 NJ -330 NJ -330 NJ -330 NJ -400 NJ -330 NJ
preplace netloc decode138_0_Y4_n 1 3 1 -30
preplace netloc decode138_1_Y1_n 1 3 1 -50
preplace netloc A0_2 1 0 7 NJ -350 NJ -350 NJ -350 NJ -350 NJ -410 NJ -350 NJ
preplace netloc decode138_1_Y3_n 1 3 1 -40
preplace netloc decode138_0_Y3_n 1 3 1 -20
levelinfo -pg 1 -1340 -1060 -570 -110 130 450 710 1000 1090 -top -1250 -bot 230
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


