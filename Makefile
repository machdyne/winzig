blinky:
	mkdir -p output
	yosys -q -p "synth_ice40 -top blinky -json output/blinky.json" rtl/blinky.v
	nextpnr-ice40 --lp384 --package qn32 --pcf winzig_v0.pcf \
		--asc output/blinky.txt --json output/blinky.json \
		--pcf-allow-unconstrained --opt-timing
	icepack output/blinky.txt output/blinky.bin

clean:
	rm -f output/*

.PHONY: blinky clean
