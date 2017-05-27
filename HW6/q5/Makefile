# VHDL files
SRCDIR = src
FILES = $(SRCDIR)/elevator.vhd

# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/elevator_tb.vhd

MODULE = elevator_tb# Show wave of this module
STOPTIME = 3500ns

# Run
RUN_FLAGS = --stop-time=$(STOPTIME) --vcd=$(MODULE).vcd

# GHDL command
GHDL_CMD = ghdl
GHDL_FLAGS = #-fexplicit --ieee=standard

all: | ghdl-compile ghdl-simulate show

ghdl-compile: $(FILES) $(TESTFILES)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(TESTFILES)
clean:
	rm work-obj93.cf *.vcd
ghdl-simulate:
	$(GHDL_CMD) -e -o $(MODULE) $(MODULE)
show:
	$(GHDL_CMD) -r $(MODULE) $(RUN_FLAGS)
	gtkwave $(MODULE).vcd
