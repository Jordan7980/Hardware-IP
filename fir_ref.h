// =============================================================================
// fir_ref.h
// FIR Filter - Floating Point Golden Reference Header
// =============================================================================

#ifndef FIR_REF_H
#define FIR_REF_H

// Number of filter taps
// Symmetric: h[k] == h[N_TAPS-1-k], so only 16 unique values
#define N_TAPS 32

// Top-level filter function
// x_history : delay line, index 0 = newest sample, index N_TAPS-1 = oldest
// h         : filter coefficients [N_TAPS]
// y_out     : pointer to output sample
void fir_ref(float x_history[N_TAPS], float h[N_TAPS], float *y_out);

#endif // FIR_REF_H
