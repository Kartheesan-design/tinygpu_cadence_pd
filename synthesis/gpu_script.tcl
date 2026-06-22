# Library
read_libs /home/cadence/install/FOUNDRY/digital/45nm/LIBS/lib/max/slow.lib

# RTL - one file per line
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/gpu.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/core.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/controller.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/decoder.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/alu.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/lsu.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/pc.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/registers.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/fetcher.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/scheduler.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/dispatch.sv
read_hdl -sv /home/userdata/22bec0039/kar/GPU/RTL/dcr.sv

# Elaborate
elaborate gpu

# Constraints
read_sdc /home/userdata/22bec0039/kar/GPU/synthesis/gpu_syn.sdc

# Synthesize
syn_generic
syn_map
syn_opt

# Outputs
write_hdl > /home/userdata/22bec0039/kar/GPU/synthesis/output/gpu_netlist.v
report_timing > /home/userdata/22bec0039/kar/GPU/synthesis/reports/timing.rpt
report_area   > /home/userdata/22bec0039/kar/GPU/synthesis/reports/area.rpt
report_power  > /home/userdata/22bec0039/kar/GPU/synthesis/reports/power.rpt
