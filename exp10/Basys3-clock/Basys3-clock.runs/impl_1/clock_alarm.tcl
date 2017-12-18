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
  set_property webtalk.parent_dir D:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.cache/wt [current_project]
  set_property parent.project_path D:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.xpr [current_project]
  set_property ip_repo_paths d:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.cache/ip [current_project]
  set_property ip_output_repo d:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.cache/ip [current_project]
  add_files -quiet D:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.runs/synth_1/clock_alarm.dcp
  read_xdc D:/digital/Digital-Experiment/exp10/Basys3-clock/Basys3-clock.srcs/constrs_1/new/test.xdc
  link_design -top clock_alarm -part xc7a35tcpg236-1
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
  write_checkpoint -force clock_alarm_opt.dcp
  report_drc -file clock_alarm_drc_opted.rpt
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
  catch {write_hwdef -file clock_alarm.hwdef}
  place_design 
  write_checkpoint -force clock_alarm_placed.dcp
  report_io -file clock_alarm_io_placed.rpt
  report_utilization -file clock_alarm_utilization_placed.rpt -pb clock_alarm_utilization_placed.pb
  report_control_sets -verbose -file clock_alarm_control_sets_placed.rpt
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
  write_checkpoint -force clock_alarm_routed.dcp
  report_drc -file clock_alarm_drc_routed.rpt -pb clock_alarm_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file clock_alarm_timing_summary_routed.rpt -rpx clock_alarm_timing_summary_routed.rpx
  report_power -file clock_alarm_power_routed.rpt -pb clock_alarm_power_summary_routed.pb
  report_route_status -file clock_alarm_route_status.rpt -pb clock_alarm_route_status.pb
  report_clock_utilization -file clock_alarm_clock_utilization_routed.rpt
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
  catch { write_mem_info -force clock_alarm.mmi }
  write_bitstream -force clock_alarm.bit -bin_file
  catch { write_sysdef -hwdef clock_alarm.hwdef -bitfile clock_alarm.bit -meminfo clock_alarm.mmi -file clock_alarm.sysdef }
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}

