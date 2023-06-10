TOPLEVEL_LANG ?= verilog

PWD=$(shell pwd)

VERILOG_SOURCES =  $(PWD)/../vend.v

TOPLEVEL := vend
MODULE   := vend_tb

COMPILE_ARGS += -D SIMULATION

include $(shell cocotb-config --makefiles)/Makefile.sim