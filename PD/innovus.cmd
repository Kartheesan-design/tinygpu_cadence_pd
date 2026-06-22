#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Thu Apr 16 18:57:59 2026                
#                                                     
#######################################################

#@(#)CDS: Innovus v21.15-s110_1 (64bit) 09/23/2022 13:08 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 21.15-s110_1 NR220912-2004/21_15-UB (database version 18.20.592) {superthreading v2.17}
#@(#)CDS: AAE 21.15-s039 (64bit) 09/23/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 21.15-s038_1 () Sep 20 2022 11:42:13 ( )
#@(#)CDS: SYNTECH 21.15-s012_1 () Sep  5 2022 10:25:51 ( )
#@(#)CDS: CPE v21.15-s076
#@(#)CDS: IQuantus/TQuantus 21.1.1-s867 (64bit) Sun Jun 26 22:12:54 PDT 2022 (Linux 3.10.0-693.el7.x86_64)

set_db init_power_nets VDD
set_db init_ground_nets VSS
read_physical -lef {../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_macro.lef ../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_tech.lef ../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_translated.lef ../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_translated_ref.lef}
read_netlist ../synthesis/output/gpu_netlist.v -top gpu
init_design
set_db init_power_nets VDD
set_db init_ground_nets VSS
read_physical -lef {../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_translated.lef ../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_translated_ref.lef}
read_netlist ../synthesis/output/gpu_netlist.v -top gpu
init_design
set_db init_power_nets VDD
set_db init_ground_nets VSS
read_physical -lef ../../../../../cadence/install/FOUNDRY/digital/90nm/dig/lef/gsclib090_tech.lef
read_netlist ../synthesis/output/gpu_netlist.v -top gpu
init_design
