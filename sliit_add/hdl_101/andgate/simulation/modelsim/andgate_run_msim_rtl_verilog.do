transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/My\ Drive/Year\ 3/Semester\ 2/ADD/rtl-design-and-verification/05_EC3102_Advanced_Digital_Design/HDL\ 101/andgate {G:/My Drive/Year 3/Semester 2/ADD/rtl-design-and-verification/05_EC3102_Advanced_Digital_Design/HDL 101/andgate/andgate.v}

