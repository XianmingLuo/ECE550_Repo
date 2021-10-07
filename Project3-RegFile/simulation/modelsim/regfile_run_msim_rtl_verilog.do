transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile/decoder_5to32.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile/regfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile/dffe_ref.v}
vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile/register_32b.v}

vlog -vlog01compat -work work +incdir+C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile {C:/Users/22922/Desktop/FallSemester/ECE550/ECE550_Repo/Project3-RegFile/regfile_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  regfile_tb

add wave *
view structure
view signals
run -all
