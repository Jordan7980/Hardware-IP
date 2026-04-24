// =============================================================================
// fir_ref_tb.cpp
// FIR Filter - Testbench for Floating Point Golden Reference
//
// Tests performed:
//   1. Impulse Response  - feed a single 1.0 then zeros, output = h[] itself
//   2. Passband Sine     - low-freq sine should pass through with little change
//   3. Stopband Sine     - high-freq sine should be attenuated
//
// How to build and run:
//   g++ fir_ref_tb.cpp fir_ref.cpp -o fir_ref_tb -lm
//   ./fir_ref_tb
//
// How to think about the testbench:
//   The testbench owns the delay line (x_history[]).
//   Each iteration = one sample period = one future clock cycle in hardware.
//   We shift x_history[] left each step (oldest dropped, newest enters at [0]).
// =============================================================================

#include <stdio.h>
#include <math.h>
#include <string.h>
#include "fir_ref.h"

// =============================================================================
// Low-pass FIR coefficients — 32-tap Hamming window, normalized
// Cutoff: ~0.1 * Fs (10% of sample rate)
// These are symmetric: h[k] == h[N_TAPS-1-k]
//
// How these were generated (MATLAB/Python equivalent):
//   h = fir1(31, 0.1, 'low', hamming(32))  % MATLAB
//   h = signal.firwin(32, 0.1)              % Python scipy
//
// For Phase 2: multiply each by 32767 and round to get Q1.15 integers.
// =============================================================================
// ==================================
static float h[N_TAPS] = {
    -0.000507f,  0.000606f,  0.002235f,  0.004132f,  0.004990f,  0.002776f, -0.003933f, -0.014234f,
    -0.023880f, -0.025932f, -0.013265f,  0.017938f,  0.065338f,  0.119829f,  0.167867f,  0.196041f,
     0.196041f,  0.167867f,  0.119829f,  0.065338f,  0.017938f, -0.013265f, -0.025932f, -0.023880f,
    -0.014234f, -0.003933f,  0.002776f,  0.004990f,  0.004132f,  0.002235f,  0.000606f, -0.000507f
};
// ==================================

// =============================================================================
// Helper: shift x_history[] left and insert new sample at [0]
//
// Before: x_history = [x[n-1], x[n-2], ..., x[n-31]]
// After:  x_history = [new,    x[n-1], ..., x[n-30]]
//
// This is what the hardware delay_line (shift register) does each clock cycle.
// =============================================================================
static void push_sample(float x_history[N_TAPS], float new_sample)
{
    for (int i = N_TAPS - 1; i > 0; i--)
    {
        x_history[i] = x_history[i - 1];
    }
    x_history[0] = new_sample;
}

// =============================================================================
// Test 1 — Impulse Response
//
// What we expect:
//   If we send in 1.0 followed by 0.0s, the output should reproduce h[] itself.
//   y[0]=h[0], y[1]=h[1], ..., y[31]=h[31], then 0 forever.
//   This is the definition of "impulse response" and it verifies the convolution
//   is wired up correctly.
// =============================================================================
static int test_impulse_response()
{
    printf("=== Test 1: Impulse Response ===\n");

    float x_history[N_TAPS];
    memset(x_history, 0, sizeof(x_history));

    int pass = 1;
    float tol = 1e-6f;

    for (int n = 0; n < N_TAPS * 2; n++)
    {
        // Only the very first sample is 1.0, rest are 0.0
        float x_in = (n == 0) ? 1.0f : 0.0f;
        push_sample(x_history, x_in);

        float y_out = 0.0f;
        fir_ref(x_history, h, &y_out);

        // Expected: h[n] for n < N_TAPS, 0.0 otherwise
        float expected = (n < N_TAPS) ? h[n] : 0.0f;
        float err = y_out - expected;
        if (err < 0) err = -err;

        printf("  n=%2d | y=% .6f | expected=% .6f | err=%.2e %s\n",
               n, y_out, expected, err, (err < tol) ? "PASS" : "FAIL");

        if (err >= tol) pass = 0;
    }

    printf("  Impulse Response: %s\n\n", pass ? "PASSED" : "FAILED");
    return pass;
}

// =============================================================================
// Test 2 — Passband Sine (low frequency, should pass through)
//
// What we expect:
//   A sine wave at 5% of Fs (well below 10% cutoff) should pass with
//   amplitude close to 1.0 after the filter settles (first ~32 samples
//   are the transient startup).
// =============================================================================
static int test_passband_sine()
{
    printf("=== Test 2: Passband Sine (freq = 0.05 * Fs) ===\n");

    float x_history[N_TAPS];
    memset(x_history, 0, sizeof(x_history));

    int   n_samples = 128;
    float freq      = 0.05f;   // 5% of Fs — inside passband
    float pi        = 3.14159265358979f;
    float max_out   = 0.0f;

    for (int n = 0; n < n_samples; n++)
    {
        float x_in = sinf(2.0f * pi * freq * n);
        push_sample(x_history, x_in);

        float y_out = 0.0f;
        fir_ref(x_history, h, &y_out);

        // Track max amplitude after filter settles (skip first N_TAPS samples)
        if (n >= N_TAPS)
        {
            float abs_y = y_out < 0 ? -y_out : y_out;
            if (abs_y > max_out) max_out = abs_y;
        }

        if (n >= N_TAPS - 4)   // print just the settled region
            printf("  n=%3d | x=% .4f | y=% .4f\n", n, x_in, y_out);
    }

    // Passband gain should be close to 1.0 (within 10%)
    int pass = (max_out > 0.9f);
    printf("  Max output amplitude (settled): %.4f  => %s\n\n",
           max_out, pass ? "PASSED (gain ~1)" : "FAILED (too much attenuation)");
    return pass;
}

// =============================================================================
// Test 3 — Stopband Sine (high frequency, should be attenuated)
//
// What we expect:
//   A sine wave at 40% of Fs (well above 10% cutoff) should be heavily
//   attenuated. We expect max amplitude well below 0.1.
// =============================================================================
static int test_stopband_sine()
{
    printf("=== Test 3: Stopband Sine (freq = 0.40 * Fs) ===\n");

    float x_history[N_TAPS];
    memset(x_history, 0, sizeof(x_history));

    int   n_samples = 128;
    float freq      = 0.40f;   // 40% of Fs — deep in stopband
    float pi        = 3.14159265358979f;
    float max_out   = 0.0f;

    for (int n = 0; n < n_samples; n++)
    {
        float x_in = sinf(2.0f * pi * freq * n);
        push_sample(x_history, x_in);

        float y_out = 0.0f;
        fir_ref(x_history, h, &y_out);

        if (n >= N_TAPS)
        {
            float abs_y = y_out < 0 ? -y_out : y_out;
            if (abs_y > max_out) max_out = abs_y;
        }

        if (n >= N_TAPS - 4)
            printf("  n=%3d | x=% .4f | y=% .4f\n", n, x_in, y_out);
    }

    // Stopband should attenuate to below 10% of input amplitude
    int pass = (max_out < 0.1f);
    printf("  Max output amplitude (settled): %.4f  => %s\n\n",
           max_out, pass ? "PASSED (heavily attenuated)" : "FAILED (not enough attenuation)");
    return pass;
}

// =============================================================================
// main()
// =============================================================================
int main()
{
    printf("========================================\n");
    printf("  FIR Filter - Float Reference Testbench\n");
    printf("  %d taps, low-pass, cutoff ~0.1*Fs\n", N_TAPS);
    printf("========================================\n\n");

    int p1 = test_impulse_response();
    int p2 = test_passband_sine();
    int p3 = test_stopband_sine();

    printf("========================================\n");
    printf("  SUMMARY\n");
    printf("  Impulse Response : %s\n", p1 ? "PASS" : "FAIL");
    printf("  Passband Sine    : %s\n", p2 ? "PASS" : "FAIL");
    printf("  Stopband Sine    : %s\n", p3 ? "PASS" : "FAIL");
    printf("  Overall          : %s\n", (p1 && p2 && p3) ? "ALL PASS" : "SOME FAILED");
    printf("========================================\n");

    return (p1 && p2 && p3) ? 0 : 1;
}
