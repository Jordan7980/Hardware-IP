#ifndef FIR_FILTER_HPP
#define FIR_FILTER_HPP

#include <ap_int.h>
#include <hls_stream.h>
#include <ap_axi_sdata.h>

// ------------------------------------------------------------
// FIR Filter HLS Configuration
// ------------------------------------------------------------
// This design uses:
//   - AXI4-Stream for input and output samples
//   - AXI4-Lite for control/configuration
//   - Runtime-loadable coefficients through AXI4-Lite array
//
// The filter equation is:
//   y[n] = sum_{k=0}^{num_taps-1} coeff[k] * x[n-k]
// ------------------------------------------------------------

static const int MAX_TAPS    = 32;
static const int MAX_SAMPLES = 1024;
static const int DATA_WIDTH  = 32;

// AXI stream word with 32-bit signed data.
// last is used to mark the final sample.
typedef ap_axiu<DATA_WIDTH, 0, 0, 0> axis_word_t;

typedef ap_int<16> sample_t;
typedef ap_int<16> coeff_t;
typedef ap_int<40> acc_t;

void fir_filter(
    hls::stream<axis_word_t>& in_stream,
    hls::stream<axis_word_t>& out_stream,
    coeff_t coeffs[MAX_TAPS],
    int num_taps,
    int num_samples
);

#endif
