# Vitis HLS script for FIR Filter Accelerator
# Usage from this folder:
#   vitis_hls -f run_hls.tcl

open_project fir_filter_hls
set_top fir_filter

add_files src/fir_filter.cpp -cflags "-Isrc"
add_files src/fir_filter.hpp
add_files -tb tb/fir_filter_tb.cpp -cflags "-Isrc"

open_solution "solution1" -flow_target vivado

# Change this part to match your board/project if needed.
# This generic Zynq-7000 part works for many class examples, but your board may differ.
set_part {xc7z020clg400-1}

create_clock -period 10 -name default

csim_design
csynth_design
cosim_design
export_design -format ip_catalog

exit
