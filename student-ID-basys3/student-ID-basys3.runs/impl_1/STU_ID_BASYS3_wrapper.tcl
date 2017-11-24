proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.cache/wt [current_project]
  set_property parent.project_path D:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.xpr [current_project]
  set_property ip_repo_paths {
  d:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.cache/ip
  D:/digital/Digital-Experiment/source_lib/74IP
} [current_project]
  set_property ip_output_repo d:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.cache/ip [current_project]
  add_files -quiet D:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.runs/synth_1/STU_ID_BASYS3_wrapper.dcp
  read_xdc D:/digital/Digital-Experiment/student-ID-basys3/student-ID-basys3.srcs/constrs_1/new/STU_ID_BASYS3_wrapper.xdc
  link_design -top STU_ID_BASYS3_wrapper -part xc7a35tcpg236-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force STU_ID_BASYS3_wrapper_opt.dcp
  report_drc -file STU_ID_BASYS3_wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file STU_ID_BASYS3_wrapper.hwdef}
  place_design 
  write_checkpoint -force STU_ID_BASYS3_wrapper_placed.dcp
  report_io -file STU_ID_BASYS3_wrapper_io_placed.rpt
  report_utilization -file STU_ID_BASYS3_wrapper_utilization_placed.rpt -pb STU_ID_BASYS3_wrapper_utilization_placed.pb
  report_control_sets -verbose -file STU_ID_BASYS3_wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force STU_ID_BASYS3_wrapper_routed.dcp
  report_drc -file STU_ID_BASYS3_wrapper_drc_routed.rpt -pb STU_ID_BASYS3_wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file STU_ID_BASYS3_wrapper_timing_summary_routed.rpt -rpx STU_ID_BASYS3_wrapper_timing_summary_routed.rpx
  report_power -file STU_ID_BASYS3_wrapper_power_routed.rpt -pb STU_ID_BASYS3_wrapper_power_summary_routed.pb
  report_route_status -file STU_ID_BASYS3_wrapper_route_status.rpt -pb STU_ID_BASYS3_wrapper_route_status.pb
  report_clock_utilization -file STU_ID_BASYS3_wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force STU_ID_BASYS3_wrapper.mmi }
  write_bitstream -force STU_ID_BASYS3_wrapper.bit -bin_file
  catch { write_sysdef -hwdef STU_ID_BASYS3_wrapper.hwdef -bitfile STU_ID_BASYS3_wrapper.bit -meminfo STU_ID_BASYS3_wrapper.mmi -file STU_ID_BASYS3_wrapper.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

