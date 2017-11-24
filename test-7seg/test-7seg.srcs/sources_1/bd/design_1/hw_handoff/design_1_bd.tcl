
################################################################
# This is a generated script based on design: design_1
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
# source design_1_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7a35tcpg236-1

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name design_1

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
  set A1 [ create_bd_port -dir I A1 ]
  set A2 [ create_bd_port -dir I A2 ]
  set A3 [ create_bd_port -dir I A3 ]
  set A4 [ create_bd_port -dir I A4 ]
  set BCD_A [ create_bd_port -dir I BCD_A ]
  set BCD_B [ create_bd_port -dir I BCD_B ]
  set BCD_C [ create_bd_port -dir I BCD_C ]
  set BCD_D [ create_bd_port -dir I BCD_D ]
  set BI_RBO_n [ create_bd_port -dir IO BI_RBO_n ]
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

  # Create instance: BCD2SEG7_0, and set properties
  set BCD2SEG7_0 [ create_bd_cell -type ip -vlnv xilinx.com:xup:BCD2SEG7:1.0 BCD2SEG7_0 ]

  # Create instance: six_not_gate_0, and set properties
  set six_not_gate_0 [ create_bd_cell -type ip -vlnv xilinx.com:XUP:six_not_gate:1.0 six_not_gate_0 ]

  # Create port connections
  connect_bd_net -net A1_1 [get_bd_ports A1] [get_bd_pins six_not_gate_0/A1]
  connect_bd_net -net A2_1 [get_bd_ports A2] [get_bd_pins six_not_gate_0/A2]
  connect_bd_net -net A3_1 [get_bd_ports A3] [get_bd_pins six_not_gate_0/A3]
  connect_bd_net -net A4_1 [get_bd_ports A4] [get_bd_pins six_not_gate_0/A4]
  connect_bd_net -net BCD2SEG7_0_a [get_bd_ports a] [get_bd_pins BCD2SEG7_0/a]
  connect_bd_net -net BCD2SEG7_0_b [get_bd_ports b] [get_bd_pins BCD2SEG7_0/b]
  connect_bd_net -net BCD2SEG7_0_c [get_bd_ports c] [get_bd_pins BCD2SEG7_0/c]
  connect_bd_net -net BCD2SEG7_0_d [get_bd_ports d] [get_bd_pins BCD2SEG7_0/d]
  connect_bd_net -net BCD2SEG7_0_e [get_bd_ports e] [get_bd_pins BCD2SEG7_0/e]
  connect_bd_net -net BCD2SEG7_0_f [get_bd_ports f] [get_bd_pins BCD2SEG7_0/f]
  connect_bd_net -net BCD2SEG7_0_g [get_bd_ports g] [get_bd_pins BCD2SEG7_0/g]
  connect_bd_net -net BCD_A_1 [get_bd_ports BCD_A] [get_bd_pins BCD2SEG7_0/BCD_A]
  connect_bd_net -net BCD_B_1 [get_bd_ports BCD_B] [get_bd_pins BCD2SEG7_0/BCD_B]
  connect_bd_net -net BCD_C_1 [get_bd_ports BCD_C] [get_bd_pins BCD2SEG7_0/BCD_C]
  connect_bd_net -net BCD_D_1 [get_bd_ports BCD_D] [get_bd_pins BCD2SEG7_0/BCD_D]
  connect_bd_net -net GND_1 [get_bd_ports GND] [get_bd_pins six_not_gate_0/A5] [get_bd_pins six_not_gate_0/A6]
  connect_bd_net -net Net [get_bd_ports BI_RBO_n] [get_bd_pins BCD2SEG7_0/BI_RBO_n]
  connect_bd_net -net six_not_gate_0_Y1 [get_bd_ports Y1] [get_bd_pins six_not_gate_0/Y1]
  connect_bd_net -net six_not_gate_0_Y2 [get_bd_ports Y2] [get_bd_pins six_not_gate_0/Y2]
  connect_bd_net -net six_not_gate_0_Y3 [get_bd_ports Y3] [get_bd_pins six_not_gate_0/Y3]
  connect_bd_net -net six_not_gate_0_Y4 [get_bd_ports Y4] [get_bd_pins six_not_gate_0/Y4]
  connect_bd_net -net six_not_gate_0_Y5 [get_bd_pins BCD2SEG7_0/LT_n] [get_bd_pins BCD2SEG7_0/RBI_n] [get_bd_pins six_not_gate_0/Y5]

  # Create address segments

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port A4 -pg 1 -y 150 -defaultsOSRD
preplace port BCD_A -pg 1 -y -80 -defaultsOSRD
preplace port GND -pg 1 -y 180 -defaultsOSRD
preplace port BCD_B -pg 1 -y -100 -defaultsOSRD
preplace port BCD_C -pg 1 -y -120 -defaultsOSRD
preplace port BI_RBO_n -pg 1 -y -60 -defaultsOSRD
preplace port BCD_D -pg 1 -y -140 -defaultsOSRD
preplace port a -pg 1 -y -200 -defaultsOSRD
preplace port b -pg 1 -y -180 -defaultsOSRD
preplace port c -pg 1 -y -160 -defaultsOSRD
preplace port Y1 -pg 1 -y 90 -defaultsOSRD
preplace port d -pg 1 -y -140 -defaultsOSRD
preplace port Y2 -pg 1 -y 110 -defaultsOSRD
preplace port A1 -pg 1 -y 90 -defaultsOSRD
preplace port e -pg 1 -y -120 -defaultsOSRD
preplace port Y3 -pg 1 -y 130 -defaultsOSRD
preplace port A2 -pg 1 -y 110 -defaultsOSRD
preplace port f -pg 1 -y -100 -defaultsOSRD
preplace port Y4 -pg 1 -y 150 -defaultsOSRD
preplace port A3 -pg 1 -y 130 -defaultsOSRD
preplace port g -pg 1 -y -80 -defaultsOSRD
preplace inst six_not_gate_0 -pg 1 -lvl 1 -y 140 -defaultsOSRD
preplace inst BCD2SEG7_0 -pg 1 -lvl 1 -y -130 -defaultsOSRD
preplace netloc A4_1 1 0 1 N
preplace netloc BCD_C_1 1 0 1 N
preplace netloc BCD_D_1 1 0 1 N
preplace netloc A3_1 1 0 1 N
preplace netloc GND_1 1 0 1 10
preplace netloc BCD2SEG7_0_a 1 1 1 N
preplace netloc BCD_B_1 1 0 1 N
preplace netloc six_not_gate_0_Y1 1 1 1 N
preplace netloc BCD2SEG7_0_b 1 1 1 N
preplace netloc six_not_gate_0_Y2 1 1 1 N
preplace netloc BCD2SEG7_0_c 1 1 1 N
preplace netloc six_not_gate_0_Y3 1 1 1 N
preplace netloc A2_1 1 0 1 N
preplace netloc BCD2SEG7_0_d 1 1 1 N
preplace netloc six_not_gate_0_Y4 1 1 1 N
preplace netloc BCD2SEG7_0_e 1 1 1 N
preplace netloc six_not_gate_0_Y5 1 0 2 10 -250 320
preplace netloc A1_1 1 0 1 N
preplace netloc BCD2SEG7_0_f 1 1 1 N
preplace netloc BCD_A_1 1 0 1 N
preplace netloc BCD2SEG7_0_g 1 1 1 N
preplace netloc Net 1 1 1 N
levelinfo -pg 1 -10 240 410 -top -340 -bot 240
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


