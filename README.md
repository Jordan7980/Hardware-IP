# FIR Filter Hardware Accelerator 

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

## Testbench Definition

The testbench verifies the FIR filter by comparing the HLS output against a C++ golden model.

The test scenarios include:

1. Impulse response  
   This checks whether the filter output matches the coefficient values when the input is a single impulse.

2. Passband sine wave  
   This checks that low-frequency/passband signals are allowed through the filter.

3. Stopband sine wave  
   This checks that high-frequency/stopband signals are attenuated.

Functional correctness is tested by comparing each HLS output sample against the golden-model output. If the difference
is within the expected tolerance, the test passes.

Performance is evaluated using the Vitis HLS synthesis and co-simulation reports. The main metrics are clock period,
initiation interval, latency, and resource usage.

## Development Steps

1. Define the FIR filter interface  
   Create the top-level `fir_filter` function with AXI4-Stream input/output ports and AXI4-Lite control arguments.

2. Implement the golden model  
   Write a software FIR model that computes the expected output using the same coefficients and input samples.

3. Implement the delay line  
   Store recent input samples and shift the delay line every time a new sample is received.

4. Implement the multiply-accumulate logic  
   Multiply each delayed sample by its corresponding coefficient and accumulate the result.

5. Add AXI4-Stream output packing  
   Pack the FIR result into the output stream and assert `last` on the final output sample.

6. Create directed test cases  
   Test impulse response, passband sine wave, and stopband sine wave inputs.

7. Run C simulation  
   Confirm that the HLS C++ implementation matches the golden model.

8. Run synthesis  
   Check timing, latency, initiation interval, and resource usage.

## Performance and Resource Verification

The FIR accelerator was evaluated using the Vitis HLS synthesis report located under:

```text
fir_filter_hls/solution1/syn/report/
```

| Metric                 |        Result | Meaning                                                               |
| ---------------------- | ------------: | --------------------------------------------------------------------- |
| Target clock period    |      10.00 ns | The design goal was to run at a 100 MHz clock frequency               |
| Estimated clock period |      6.808 ns | The design is faster than the required 10 ns target                   |
| Latency                | 3-1061 cycles | The total number of cycles depends on the number of samples processed |
| BRAM                   |             0 | The design does not require block RAM                                 |
| DSP                    |            32 | DSP blocks are used for parallel multiplications                      |
| Flip-Flops             |          4748 | Registers used for pipelining, control, and data storage              |
| LUTs                   |          3572 | Logic used for control, arithmetic support, and stream handling       |

The estimated clock period of 6.808 ns is below the 10.00 ns target, so the design meets timing. Since a 10 ns clock
corresponds to 100 MHz, this means the accelerator should be able to operate at the required clock speed.

The latency range of 3-1061 cycles depends on the value of num_samples. For small inputs, the fixed pipeline and control
overhead dominate. For larger inputs, the latency increases as more samples are streamed through the FIR filter.

The design uses 32 DSP blocks because the FIR filter supports up to 32 taps. Each tap requires a multiplication between 
a delayed input sample and a coefficient. Using many DSPs allows these multiplications to happen in parallel, 
which improves throughput.

This design therefore prioritizes speed and throughput over minimum resource usage. A lower-resource design could use
fewer DSPs by reusing one multiplier across multiple taps, but that would increase latency and reduce throughput. Since 
this project is focused on building a streaming FIR accelerator, the higher DSP usage is acceptable because it allows 
the filter to process samples efficiently.

## Current Defaults

- `MAX_TAPS = 32`
- `MAX_SAMPLES = 1024`
- 16-bit input samples
- 16-bit coefficients
- 40-bit accumulator
- 32-bit AXI stream data words

## Architecture Description

The FIR accelerator is implemented as one HLS top-level function, but internally it behaves like several hardware blocks:

1. AXI4-Lite Control Interface  
   The PS uses AXI4-Lite registers to configure the accelerator. The control inputs are `coeffs`, `num_taps`, and `num_samples`. The return port provides the standard HLS control signals such as start, done, idle, and ready.

2. AXI4-Stream Input Interface  
   Input samples are sent into the accelerator through `in_stream`. Each AXI stream word contains one sample in the `data` field.

3. Delay Line  
   The delay line stores the most recent input samples. Every new input sample shifts the previous samples down the array so that the FIR equation can access `x[n]`, `x[n-1]`, `x[n-2]`, and so on.

4. Multiply-Accumulate Engine  
   The MAC engine multiplies each delayed sample by its corresponding coefficient and accumulates the products to compute:

   `y[n] = sum(h[k] * x[n-k])`

5. AXI4-Stream Output Interface  
   The computed filtered sample is written to `out_stream`. The final output sample has `TLAST` asserted.

## Functional Verification Summary

The testbench verifies the FIR accelerator against a floating-point golden model using three tests:

| Test | Purpose | Expected Behavior |
|---|---|---|
| Impulse response | Confirms the FIR coefficients appear at the output | Output should match the filter taps |
| Passband sine | Confirms low-frequency signals pass through the filter | Output amplitude should remain high |
| Stopband sine | Confirms high-frequency signals are attenuated | Output amplitude should be small |

The testbench writes detailed result files:

```text
fir_results_impulse.txt
fir_results_passband.txt
fir_results_stopband.txt
```

The result files will be created in
```text
fir_filter_hls\solution1\csim\build
```
## How to Reproduce the Results

### Requirements

- Vitis HLS 2024.1 or compatible version
  - This is to activate the virtual environment
  ```text
    \env\Scripts\activate.bat  [Windows command prompt]
  ```
  - Enter this to Start Vitis
  ```text
  C:\Xilinx\Vitis_HLS\2024.1\settings64.bat
  ```
  - Then run the HLS flow from the main project directory


### Running the HLS Flow

From the main project directory, run:

```bash
vitis_hls -f run_hls.tcl
```

