transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/bz82/Documents/ECE\ 550/ECE550_Repo/Project1-ALU {C:/Users/bz82/Documents/ECE 550/ECE550_Repo/Project1-ALU/mux_2b.v}
vlog -vlog01compat -work work +incdir+C:/Users/bz82/Documents/ECE\ 550/ECE550_Repo/Project1-ALU {C:/Users/bz82/Documents/ECE 550/ECE550_Repo/Project1-ALU/barrel_shifter.v}

vlog -vlog01compat -work work +incdir+C:/Users/bz82/Documents/ECE\ 550/ECE550_Repo/Project1-ALU {C:/Users/bz82/Documents/ECE 550/ECE550_Repo/Project1-ALU/barrel_shifter_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  barrel_shifter_tb

add wave *
view structure
view signals
run -all
