<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project implements an 8-bit Pulse Width Modulation (PWM) generator in Verilog. 

The internal 8-bit counter increments on every clock cycle. The input `ui_in` sets the duty cycle value (0 to 255). When the counter value is less than the input duty cycle, the PWM output signal on `uo_out[0]` stays High (1). When the counter exceeds the duty cycle, the output goes Low (0).

## How to test

1. Apply a clock signal to `clk` and release reset by setting `rst_n` to 1.
2. Set the input switches `ui_in[7:0]` to the desired duty cycle (e.g., `10000000` for 50% duty cycle).
3. Observe the PWM signal output on pin `uo_out[0]`.

## External hardware

No special external hardware is required. An oscilloscope or Logic Analyzer can be connected to `uo_out[0]` to observe the output waveform.
