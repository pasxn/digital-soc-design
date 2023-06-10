.PHONY: all
all: 
	$(MAKE) -C sim SIM=icarus

clean:
	rm -rf sim/*.so
	rm -rf sim/__pycache__
	rm -rf sim/build
	rm -rf sim/*.cpp
	rm -rf sim/common/
	rm -rf sim/*.vcd
	rm -rf sim/results.xml
	rm -rf sim/sim_build
	rm -rf ../common/*.cpp