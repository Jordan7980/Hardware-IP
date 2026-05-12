# Finite Impulse Response (FIR) Filter Accelerator
## Initial Project Plan
**ECE-GY 9463: Selected Topics in Computer Devices & Systems:**
**Introduction to Applied Hardware Design**

2026-04-09
Revision: A

Submitted by:
- **Jordan Forbes:** Team Lead, Computer Engineering
- **Nashara Marrow:** System Optimization Lead, Computer Engineering
- **Jayshawn Brown:** Software Lead, Computer Engineering

---

## 1. IP Definition

### 1.1 What your IP does
The proposed IP is a Finite Impulse Response (FIR) digital filter accelerator implemented in hardware using Vitis HLS. 
Its core functionality is to process an input signal and produce a filtered output by applying a set of predefined 
coefficients (filter taps).

This IP addresses the problem of computational inefficiency in software-based filtering, where repeated multiply-accumulate (MAC) operations create bottlenecks. By moving this computation to hardware, the design achieves lower latency and higher throughput.


The IP applies to domains such as audio processing, wireless communications, and real-time sensor data filtering, where deterministic timing and fast processing are critical.

---

### 1.2 How it interacts with the PS and peripherals
The FIR IP interacts with the Processing System (PS) and peripherals using standard AXI interfaces:

**AXI4-Lite (Control Interface):**
- Used by the PS to configure the IP
- Controls include: start, reset, filter length, and status signals (done, idle)
- Coefficients can be written through registers or memory

**AXI4-Stream (Data Interface):**
- Input samples are streamed into the IP
- Output samples are streamed out after processing
- Enables continuous real-time data processing

**Data Flow:**
- PS loads filter coefficients
- PS starts the IP
- Input samples are streamed in
- Filtered outputs are streamed back

---

### 1.3 The mathematical operations involved
The FIR filter computes each output sample using:

$$y[n] = \sum_{k=0}^{N-1} h[k] \cdot x[n-k]$$

Where:
- **x[n]**: input sample
- **h[k]**: filter coefficients (taps)
- **y[n]**: output sample
- **N**: number of taps

#### 1.3.1 Software Algorithm (pseudocode)

```C++
for n in range(num_samples):
    acc = 0
       for k in range(TAPS):
        acc += h[k] * x[n-k]
    y[n] = acc
```

#### 1.3.2 Hardware-Relevant Operations
- Multiply (DSP slices)
- Accumulate (adder tree)
- Shift/register updates (delay line)

These operations are highly structured and repetitive, making them ideal for pipelining and parallel execution 
in hardware.

---

## 2. Architecture

### 2.1 The major sub-modules

#### 2.1.1 AXI4-Lite Control Module
Handles configuration, control signals, and status reporting.

#### 2.1.2 Input Stream Interface
Receives incoming samples via AXI4-Stream.

#### 2.1.3 Coefficient Memory
Stores filter coefficients in BRAM AXI4-Lite interface for runtime loading by the PS

#### 2.1.4 Delay Line (Shift Register Array)
Maintains past input samples x[n−k].

#### 2.1.5 Compute Engine (MAC + Adder Tree)
- Performs parallel multiplications
- Uses a pipelined adder tree for accumulation

#### 2.1.6 Output Stream Interface
Sends filtered samples back through AXI4-Stream.

---

### 2.2 How the sub-modules communicate

**Control Path:**
- PS → AXI4-Lite → Control Module → all submodules

**Data Path:**
- Input Stream → Delay Line → Compute Engine → Output Stream

**Internal Dataflow:**
- Delay line feeds stored samples to multipliers
- Coefficient memory provides tap values
- Multiply results flow into a pipelined adder tree
- Final sum is output as y[n]

**Timing Strategy:**
- Fully pipelined design with target Initiation Interval (II) = 1
- After pipeline fill, one output is produced per clock cycle

Optional FIFO buffers may be used to improve timing and throughput.

### 2.3 Why modularization matters
The design is decomposed into modular blocks to improve clarity, scalability, and testability:

- **Easier debugging:** each module (e.g., delay line, MAC unit) can be verified independently
- **Incremental development:**
    - First validate data movement (AXI interfaces)
    - Then implement compute engine
    - Finally integrate full pipeline
- **Scalability:** number of taps or parallel units can be increased without redesigning the entire system
- **Reusability:** modules like the MAC engine and streaming interface can be reused in other DSP IPs
- **Performance tuning:** allows targeted optimization (e.g., pipelining only the compute engine)

This structured approach supports efficient development and aligns with best practices in hardware system design.