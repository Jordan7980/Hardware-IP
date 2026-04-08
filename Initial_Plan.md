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