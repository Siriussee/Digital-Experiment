
################################################################
# This is a generated script based on design: ALU_4
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
# source ALU_4_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name ALU_4

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
  set A_1 [ create_bd_port -dir I A_1 ]
  set A_2 [ create_bd_port -dir I A_2 ]
  set A_3 [ create_bd_port -dir I A_3 ]
  set B [ create_bd_port -dir I B ]
  set B_1 [ create_bd_port -dir I B_1 ]
  set B_2 [ create_bd_port -dir I B_2 ]
  set B_3 [ create_bd_port -dir I B_3 ]
  set Cn [ create_bd_port -dir I Cn ]
  set Cn_1 [ create_bd_port -dir O Cn_1 ]
  set GND [ create_bd_port -dir I GND ]
  set S0 [ create_bd_port -dir I S0 ]
  set S1 [ create_bd_port -dir I S1 ]
  set S2 [ create_bd_port -dir I S2 ]
  set Y [ create_bd_port -dir O Y ]
  set Y_1 [ create_bd_port -dir O Y_1 ]
  set Y_2 [ create_bd_port -dir O Y_2 ]
  set Y_3 [ create_bd_port -dir O Y_3 ]

  # Create instance: ALU_1_wrapper_0, and set properties
  set ALU_1_wrapper_0 [ create_bd_cell -type ip -vlnv Sirius:user:ALU_1_wrapper:1.0 ALU_1_wrapper_0 ]

  # Create instance: ALU_1_wrapper_1, and set properties
  set ALU_1_wrapper_1 [ create_bd_cell -type ip -vlnv Sirius:user:ALU_1_wrapper:1.0 ALU_1_wrapper_1 ]

  # Create instance: ALU_1_wrapper_2, and set properties
  set ALU_1_wrapper_2 [ create_bd_cell -type ip -vlnv Sirius:user:ALU_1_wrapper:1.0 ALU_1_wrapper_2 ]

  # Create instance: ALU_1_wrapper_3, and set properties
  set ALU_1_wrapper_3 [ create_bd_cell -type ip -vlnv Sirius:user:ALU_1_wrapper:1.0 ALU_1_wrapper_3 ]

  # Create port connections
  connect_bd_net -net ALU_1_wrapper_0_Cn_1 [get_bd_pins ALU_1_wrapper_0/Cn_1] [get_bd_pins ALU_1_wrapper_1/Cn]
  connect_bd_net -net ALU_1_wrapper_0_Y [get_bd_ports Y] [get_bd_pins ALU_1_wrapper_0/Y]
  connect_bd_net -net ALU_1_wrapper_1_Cn_1 [get_bd_pins ALU_1_wrapper_1/Cn_1] [get_bd_pins ALU_1_wrapper_2/Cn]
  connect_bd_net -net ALU_1_wrapper_1_Y [get_bd_ports Y_1] [get_bd_pins ALU_1_wrapper_1/Y]
  connect_bd_net -net ALU_1_wrapper_2_Cn_1 [get_bd_pins ALU_1_wrapper_2/Cn_1] [get_bd_pins ALU_1_wrapper_3/Cn]
  connect_bd_net -net ALU_1_wrapper_2_Y [get_bd_ports Y_2] [get_bd_pins ALU_1_wrapper_2/Y]
  connect_bd_net -net ALU_1_wrapper_3_Cn_1 [get_bd_ports Cn_1] [get_bd_pins ALU_1_wrapper_3/Cn_1]
  connect_bd_net -net ALU_1_wrapper_3_Y [get_bd_ports Y_3] [get_bd_pins ALU_1_wrapper_3/Y]
  connect_bd_net -net A_1 [get_bd_ports A] [get_bd_pins ALU_1_wrapper_0/A]
  connect_bd_net -net A_1_1 [get_bd_ports A_1] [get_bd_pins ALU_1_wrapper_1/A]
  connect_bd_net -net A_2_1 [get_bd_ports A_2] [get_bd_pins ALU_1_wrapper_2/A]
  connect_bd_net -net A_3_1 [get_bd_ports A_3] [get_bd_pins ALU_1_wrapper_3/A]
  connect_bd_net -net B_1 [get_bd_ports B] [get_bd_pins ALU_1_wrapper_0/B]
  connect_bd_net -net B_1_1 [get_bd_ports B_1] [get_bd_pins ALU_1_wrapper_1/B]
  connect_bd_net -net B_2_1 [get_bd_ports B_2] [get_bd_pins ALU_1_wrapper_2/B]
  connect_bd_net -net B_3_1 [get_bd_ports B_3] [get_bd_pins ALU_1_wrapper_3/B]
  connect_bd_net -net Cn_1 [get_bd_ports Cn] [get_bd_pins ALU_1_wrapper_0/Cn]
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins ALU_1_wrapper_0/GND] [get_bd_pins ALU_1_wrapper_1/GND] [get_bd_pins ALU_1_wrapper_2/GND] [get_bd_pins ALU_1_wrapper_3/GND]
  connect_bd_net -net S0_1 [get_bd_ports S0] [get_bd_pins ALU_1_wrapper_0/S0] [get_bd_pins ALU_1_wrapper_1/S0] [get_bd_pins ALU_1_wrapper_2/S0] [get_bd_pins ALU_1_wrapper_3/S0]
  connect_bd_net -net S1_1 [get_bd_ports S1] [get_bd_pins ALU_1_wrapper_0/S1] [get_bd_pins ALU_1_wrapper_1/S1] [get_bd_pins ALU_1_wrapper_2/S1] [get_bd_pins ALU_1_wrapper_3/S1]
  connect_bd_net -net S2_1 [get_bd_ports S2] [get_bd_pins ALU_1_wrapper_0/S2] [get_bd_pins ALU_1_wrapper_1/S2] [get_bd_pins ALU_1_wrapper_2/S2] [get_bd_pins ALU_1_wrapper_3/S2]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port Y_2 -pg 1 -y 150 -defaultsOSRD
preplace port A_1 -pg 1 -y -80 -defaultsOSRD
preplace port A -pg 1 -y 130 -defaultsOSRD
preplace port Y_3 -pg 1 -y 60 -defaultsOSRD
preplace port A_2 -pg 1 -y -110 -defaultsOSRD
preplace port Cn -pg 1 -y 30 -defaultsOSRD
preplace port B -pg 1 -y 150 -defaultsOSRD
preplace port A_3 -pg 1 -y -30 -defaultsOSRD
preplace port GND -pg 1 -y 50 -defaultsOSRD
preplace port Cn_1 -pg 1 -y 40 -defaultsOSRD
preplace port B_1 -pg 1 -y -60 -defaultsOSRD
preplace port B_2 -pg 1 -y -10 -defaultsOSRD
preplace port S0 -pg 1 -y 70 -defaultsOSRD
preplace port Y -pg 1 -y -80 -defaultsOSRD
preplace port B_3 -pg 1 -y 10 -defaultsOSRD
preplace port S1 -pg 1 -y 90 -defaultsOSRD
preplace port Y_1 -pg 1 -y 170 -defaultsOSRD
preplace port S2 -pg 1 -y 110 -defaultsOSRD
preplace inst ALU_1_wrapper_1 -pg 1 -lvl 2 -y 50 -defaultsOSRD
preplace inst ALU_1_wrapper_2 -pg 1 -lvl 3 -y 50 -defaultsOSRD
preplace inst ALU_1_wrapper_3 -pg 1 -lvl 4 -y 50 -defaultsOSRD
preplace inst ALU_1_wrapper_0 -pg 1 -lvl 1 -y 50 -defaultsOSRD
preplace netloc ALU_1_wrapper_2_Y 1 3 2 NJ 160 NJ
preplace netloc A_1 1 0 1 -590
preplace netloc ALU_1_wrapper_0_Cn_1 1 1 1 -350
preplace netloc ALU_1_wrapper_1_Y 1 2 3 NJ 170 NJ 170 NJ
preplace netloc S0_1 1 0 4 -610 170 -370 170 NJ 160 60
preplace netloc ALU_1_wrapper_2_Cn_1 1 3 1 90
preplace netloc ALU_1_wrapper_0_Y 1 1 4 NJ -80 NJ -80 NJ -80 NJ
preplace netloc B_3_1 1 0 4 NJ -100 NJ -100 NJ -100 NJ
preplace netloc GND_1 1 0 4 -580 -70 -340 -70 -130 -70 100
preplace netloc ALU_1_wrapper_1_Cn_1 1 2 1 -140
preplace netloc A_2_1 1 0 3 NJ -130 NJ -130 NJ
preplace netloc S1_1 1 0 4 -630 180 -340 180 NJ 180 110
preplace netloc B_2_1 1 0 3 NJ -110 NJ -110 NJ
preplace netloc S2_1 1 0 4 -620 160 -350 160 NJ -60 80
preplace netloc A_1_1 1 0 2 NJ -80 NJ
preplace netloc Cn_1 1 0 1 N
preplace netloc B_1 1 0 1 -570
preplace netloc ALU_1_wrapper_3_Cn_1 1 4 1 N
preplace netloc A_3_1 1 0 4 NJ -120 NJ -120 NJ -120 NJ
preplace netloc B_1_1 1 0 2 NJ -60 NJ
preplace netloc ALU_1_wrapper_3_Y 1 4 1 N
levelinfo -pg 1 -650 -460 -240 -30 210 350 -top -240 -bot 620
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


