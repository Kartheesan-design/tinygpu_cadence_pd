# ============================================================
# tiny-gpu Synthesis SDC
# ============================================================

# ----------------------------------------------------------
# 1. Clock
# ----------------------------------------------------------
create_clock -name clk -period 10.000 [get_ports clk]

# ----------------------------------------------------------
# 2. Input Delays (30% of clock period)
# ----------------------------------------------------------
set_input_delay 3.0 -clock clk [get_ports reset]
set_input_delay 3.0 -clock clk [get_ports start]
set_input_delay 3.0 -clock clk [get_ports device_control_write_enable]
set_input_delay 3.0 -clock clk [get_ports device_control_data[*]]

set_input_delay 3.0 -clock clk [get_ports program_mem_read_ready[*]]
set_input_delay 3.0 -clock clk [get_ports program_mem_read_data[*]]

set_input_delay 3.0 -clock clk [get_ports data_mem_read_ready[*]]
set_input_delay 3.0 -clock clk [get_ports data_mem_read_data[*]]
set_input_delay 3.0 -clock clk [get_ports data_mem_write_ready[*]]

# ----------------------------------------------------------
# 3. Output Delays (30% of clock period)
# ----------------------------------------------------------
set_output_delay 3.0 -clock clk [get_ports done]

set_output_delay 3.0 -clock clk [get_ports program_mem_read_valid[*]]
set_output_delay 3.0 -clock clk [get_ports program_mem_read_address[*]]

set_output_delay 3.0 -clock clk [get_ports data_mem_read_valid[*]]
set_output_delay 3.0 -clock clk [get_ports data_mem_read_address[*]]
set_output_delay 3.0 -clock clk [get_ports data_mem_write_valid[*]]
set_output_delay 3.0 -clock clk [get_ports data_mem_write_address[*]]
set_output_delay 3.0 -clock clk [get_ports data_mem_write_data[*]]

# ----------------------------------------------------------
# 4. False Paths for async control signals
# ----------------------------------------------------------
set_false_path -from [get_ports reset]
set_false_path -from [get_ports start]
set_false_path -from [get_ports device_control_write_enable]
