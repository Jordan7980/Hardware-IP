// =============================================================================
// fir_ref.cpp
// FIR Filter - Floating Point Golden Reference
//
// Purpose:
//   This is the software golden reference model for the 32-tap FIR filter.
//   All hardware outputs (fixed-point HLS) must match this within acceptable
//   quantization error. Do NOT add HLS pragmas or ap_fixed types here.
//
// Filter Spec:
//   - 32 taps (N_TAPS = 32)
//   - Symmetric coefficients (h[k] == h[N-1-k])
//   - Direct-form convolution: y[n] = sum(h[k] * x[n-k]) for k=0..N-1
//   - Input/output: float (will become Q1.15 in Phase 2)
// =============================================================================

#include "fir_ref.h"

// -----------------------------------------------------------------------------
// fir_ref()
//
// Computes one output sample y[n] given:
//   x_history[0]         = x[n]       (newest sample)
//   x_history[N_TAPS-1]  = x[n-(N-1)] (oldest sample)
//   h[0..N_TAPS-1]       = filter coefficients
//
// How to think about this:
//   Each call = one clock cycle in hardware.
//   The caller is responsible for maintaining and shifting x_history[].
//   This function only does the multiply-accumulate (MAC) step.
// -----------------------------------------------------------------------------
void fir_ref(float x_history[N_TAPS], float h[N_TAPS], float *y_out)
{
    float acc = 0.0f;

    for (int k = 0; k < N_TAPS; k++)
    {
        acc += h[k] * x_history[k];
    }

    *y_out = acc;
}
