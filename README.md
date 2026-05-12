# FIR Filter Accelerator - Vitis HLS Starter Project

This project implements a Finite Impulse Response (FIR) filter accelerator using Vitis HLS.

The intended architecture is:

```text
PS software
  -> AXI4-Lite control/configuration
  -> AXI4-Stream input samples
FIR HLS IP
  -> AXI4-Stream output samples
```

## Files

```text
src/fir_filter.hpp      Header file with constants, types, and function prototype
src/fir_filter.cpp      HLS FIR filter kernel
tb/fir_filter_tb.cpp    C++ testbench with golden-model comparison
run_hls.tcl             Vitis HLS script for csim, synthesis, cosim, and IP export
```

## Main HLS Function

```cpp
void fir_filter(
    hls::stream<axis_word_t>& in_stream,
    hls::stream<axis_word_t>& out_stream,
    coeff_t coeffs[MAX_TAPS],
    int num_taps,
    int num_samples
);
```

## Interfaces

- `in_stream`: AXI4-Stream input samples
- `out_stream`: AXI4-Stream output samples
- `coeffs`: AXI4-Lite coefficient array
- `num_taps`: AXI4-Lite runtime filter length
- `num_samples`: AXI4-Lite number of samples to process
- `return`: AXI4-Lite control/status register bundle

## Run in Vitis HLS

From this project folder:

```bash
vitis_hls -f run_hls.tcl
```

This runs:

1. C simulation
2. C synthesis
3. C/RTL co-simulation
4. IP export

## Important Notes

- You do not manually write the FIR in SystemVerilog for this HLS flow.
- Vitis HLS converts `fir_filter.cpp` into RTL.
- The generated IP can then be imported into Vivado and connected to the PS through AXI interfaces.
- Update `set_part` in `run_hls.tcl` to match your actual FPGA board.

## Current Defaults

- `MAX_TAPS = 32`
- `MAX_SAMPLES = 1024`
- 16-bit input samples
- 16-bit coefficients
- 40-bit accumulator
- 32-bit AXI stream data words
