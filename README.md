# Winzig Logic Module

Winzig is a programmable logic module designed to be plugged into a solderless breadboard.

This repo contains schematics, pinouts and example gateware.

Find more information on the [Winzig product page](https://machdyne.com/product/winzig-logic-module/).

## Programming

There are currently two ways to program Winzig:

1. Remove the MMOD flash module, connect the Winzig MMOD socket to a device supported by [ldprog](https://github.com/machdyne/ldprog) and program the configuration SRAM. This is useful for development. 
2. Remove the MMOD flash module and program it with a GPIO or SPI-capable device. This is useful when you want the gateware to persist without power.

## Blinky 

Building the blinky example requires [Yosys](https://github.com/YosysHQ/yosys), [nextpnr-ice40](https://github.com/YosysHQ/nextpnr) and [IceStorm](https://github.com/YosysHQ/icestorm).

Assuming they are installed, you can simply type `make` to build the gateware, which will be written to output/blinky.bin. You can then use [ldprog](https://github.com/machdyne/ldprog) to write the gateware to the device.

### Writing blinky to SRAM

Connect the MMOD socket to the approprate pins of an ldprog-supported device.

You will need to use the manual reset option (-m) with ldprog and press the Winzig reset button when prompted to do so. Alternatively, you can solder a wire to the CRESET pad on the back of Winzig to automate this step.

```
$ ldprog -m -s output/blinky.bin
```

### Writing blinky to the flash MMOD

It should be possible to connect and program the MMOD using any device capable of GPIO. If using a [Müsli](https://github.com/machdyne/musli) or Raspberry Pi [Pico] you can use the ldprog tool:

```
$ ldprog -f output/blinky.bin
```

## GPIO Header

| Pin | Signal |
| --- | ------ |
| 1 | GPIO0 |
| 2 | GPIO1 |
| 3 | GPIO2 |
| 4 | GPIO3 |
| 5 | GPIO4 |
| 6 | GPIO5 |
| 7 | GND |
| 8 | PWR3V3 (out) |

## MMOD Socket

The MMOD socket can be used to program the FPGA SRAM or can be populated with
an MMOD containing a bitstream.

| Pin | Signal |
| --- | ------ |
| 6 | PWR3V3 |
| 5 | GND |
| 4 | CSPI\_SCK |
| 3 | CSPI\_SI (MISO) |
| 2 | CSPI\_SO (MOSI) |
| 1 | CSPI\_SS |
