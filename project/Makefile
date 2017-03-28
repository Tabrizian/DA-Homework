# VHDL files
SRCDIR = src
FILES = $(SRCDIR)/half_adder.vhd $(SRCDIR)/full_adder.vhd \
		$(SRCDIR)/multiplier_2_by_2.vhd $(SRCDIR)/n_bit_adder.vhd \
		$(SRCDIR)/binary_to_bcd.vhd $(SRCDIR)/bcd_adder.vhd \
		$(SRCDIR)/bcd_8_by_1_multiplier.vhd \
		$(SRCDIR)/bcd_binary_multiplier.vhd \
		$(SRCDIR)/bcd_64_bit_adder.vhd \
		$(SRCDIR)/bcd_adder_simple.vhd \
		$(SRCDIR)/bcd_multiplier.vhd \
		$(SRCDIR)/bcd_multiplier_seq.vhd

# Testbench
TESTDIR = test
TESTFILES = $(TESTDIR)/multiplier_2_by_2_tb.vhd \
			$(TESTDIR)/bcd_binary_multiplier_tb.vhd \
			$(TESTDIR)/binary_to_bcd_tb.vhd $(TESTDIR)/bcd_adder_tb.vhd \
			$(TESTDIR)/bcd_8_by_1_multiplier_tb.vhd \
			$(TESTDIR)/bcd_64_bit_adder_tb.vhd \
			$(TESTDIR)/bcd_multiplier_tb.vhd \
			$(TESTDIR)/bcd_multiplier_seq_tb.vhd

MODULE = bcd_multiplier_seq_tb# Show wave of this module
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
