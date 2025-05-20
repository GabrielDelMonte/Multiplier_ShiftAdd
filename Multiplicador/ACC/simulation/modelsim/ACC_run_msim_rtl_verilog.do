transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/gabriel/Documents/UNIFEI/Semestres/2025_1/ELTD15A/Trabalho01/Multiplier_ShiftAdd/Multiplicador/ACC {/home/gabriel/Documents/UNIFEI/Semestres/2025_1/ELTD15A/Trabalho01/Multiplier_ShiftAdd/Multiplicador/ACC/ACC.v}

vlog -vlog01compat -work work +incdir+/home/gabriel/Documents/UNIFEI/Semestres/2025_1/ELTD15A/Trabalho01/Multiplier_ShiftAdd/Multiplicador/ACC {/home/gabriel/Documents/UNIFEI/Semestres/2025_1/ELTD15A/Trabalho01/Multiplier_ShiftAdd/Multiplicador/ACC/ACC_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  ACC_TB

add wave *
view structure
view signals
run -all
