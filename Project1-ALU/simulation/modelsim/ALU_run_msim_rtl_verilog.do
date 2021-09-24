transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/mux_2to1_1b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/bitwise_or_32b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/bitwise_and_32b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/rca_16b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/rca_4b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/full_adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/csa_32b_by_rca.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/barrel_shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/mux_4to1_32b.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/mux_2to1_32b.v}

vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project1-ALU/alu_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  alu_tb

add wave *
view structure
view signals
run -all
