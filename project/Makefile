# VHDL files
SRCDIR = src
FILES = $(SRCDIR)/half_adder.vhd $(SRCDIR)/full_adder.vhd \
		$(SRCDIR)/multiplier_2_by_2.vhd $(SRCDIR)/n_bit_adder.vhd \
		$(SRCDIR)/binary_to_bcd.vhd $(SRCDIR)/bcd_adder.vhd \
		$(SRCDIR)/bcd_8_by_1_multiplier.vhd \
		$(SRCDIR)/bcd_binary_multiplier.vhd

# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/multiplier_2_by_2_tb.vhd \
			$(TESTDIR)/bcd_binary_multiplier_tb.vhd \
			$(TESTDIR)/binary_to_bcd_tb.vhd $(TESTDIR)/bcd_adder_tb.vhd \
			$(TESTDIR)/bcd_8_by_1_multiplier_tb.vhd

SUFFIX = # Suffix of files created using -e option
MODULE = bcd_8_by_1_multiplier_tb# Show wave of this module
STOPTIME = 3500ns

# Run
RUN_FLAGS = --stop-time=$(STOPTIME) --vcd=$(MODULE).vcd

# GHDL command
GHDL_CMD = ghdl
GHDL_FLAGS = -fexplicit --ieee=synopsys

all: | ghdl-compile ghdl-simulate show

ghdl-compile: $(FILES) $(TESTFILES)
	$(GHDL_CMD) -a $(GHDL_FLAGS) $(FILES) $(TESTFILES)
clean:
	rm *.o work-obj93.cf *.vcd *$(SUFFIX)
ghdl-simulate:
	$(GHDL_CMD) -e -o $(MODULE)$(SUFFIX) $(MODULE)
show:
	$(GHDL_CMD) -r $(MODULE)$(SUFFIX) $(RUN_FLAGS)
	gtkwave $(MODULE).vcd
