#include <iostream>
#include <fstream>
#include <cmath>
#include <cstring>
#include "fir_filter.hpp"

// Match your standalone golden model setup
static const int N_TAPS_TB = 32;
static const float SCALE = 32767.0f;

// Same 32-tap floating-point coefficients from your golden model.
// These are the low-pass FIR coefficients.
static float h_float[N_TAPS_TB] = {
    -0.000507f,  0.000606f,  0.002235f,  0.004132f,
     0.004990f,  0.002776f, -0.003933f, -0.014234f,
    -0.023880f, -0.025932f, -0.013265f,  0.017938f,
     0.065338f,  0.119829f,  0.167867f,  0.196041f,
     0.196041f,  0.167867f,  0.119829f,  0.065338f,
     0.017938f, -0.013265f, -0.025932f, -0.023880f,
    -0.014234f, -0.003933f,  0.002776f,  0.004990f,
     0.004132f,  0.002235f,  0.000606f, -0.000507f
};

// Convert float coefficient/sample to Q1.15 fixed-point
static coeff_t float_to_coeff(float x)
{
    return (coeff_t)std::round(x * SCALE);
}

static sample_t float_to_sample(float x)
{
    return (sample_t)std::round(x * SCALE);
}

// Convert HLS raw accumulator output back to float.
// sample is Q1.15 and coeff is Q1.15, so product is Q2.30.
static float acc_to_float(acc_t y)
{
    return ((float)y) / (SCALE * SCALE);
}

// Same golden reference equation as your standalone fir_ref.cpp
static float golden_fir_float(float x_history[N_TAPS_TB], float h[N_TAPS_TB])
{
    float acc = 0.0f;

    for (int k = 0; k < N_TAPS_TB; k++)
    {
        acc += h[k] * x_history[k];
    }

    return acc;
}

// Same delay-line behavior as your standalone golden testbench
static void push_sample_float(float x_history[N_TAPS_TB], float new_sample)
{
    for (int i = N_TAPS_TB - 1; i > 0; i--)
    {
        x_history[i] = x_history[i - 1];
    }

    x_history[0] = new_sample;
}

// Runs the HLS FIR for one full input vector
static void run_hls_filter(
    const float input_float[],
    float output_float[],
    int num_samples
)
{
    coeff_t coeffs[MAX_TAPS] = {0};

    for (int i = 0; i < N_TAPS_TB; i++)
    {
        coeffs[i] = float_to_coeff(h_float[i]);
    }

    hls::stream<axis_word_t> in_stream;
    hls::stream<axis_word_t> out_stream;

    for (int i = 0; i < num_samples; i++)
    {
        axis_word_t word;
        word.data = float_to_sample(input_float[i]);
        word.keep = -1;
        word.strb = -1;
        word.last = (i == num_samples - 1) ? 1 : 0;
        in_stream.write(word);
    }

    fir_filter(in_stream, out_stream, coeffs, N_TAPS_TB, num_samples);

    for (int i = 0; i < num_samples; i++)
    {
        axis_word_t out_word = out_stream.read();
        acc_t raw_output = (acc_t)(ap_int<DATA_WIDTH>)out_word.data;
        output_float[i] = acc_to_float(raw_output);

        if (i == num_samples - 1 && out_word.last != 1)
        {
            std::cout << "Missing TLAST on final output sample" << std::endl;
        }
    }
}


static int test_impulse_response()
{
    std::cout << "=== Test 1: Impulse Response ===" << std::endl;

    const int num_samples = N_TAPS_TB * 2;
    float input[num_samples] = {0.0f};
    float hls_output[num_samples] = {0.0f};

    input[0] = 1.0f;

    run_hls_filter(input, hls_output, num_samples);

    int pass = 1;
    float tol = 0.002f;

    std::ofstream results("fir_results_impulse.txt");
    results << "n,input,hls_output,golden,err\n";

    for (int n = 0; n < num_samples; n++)
    {
        float expected = (n < N_TAPS_TB) ? h_float[n] : 0.0f;
        float err = std::fabs(hls_output[n] - expected);

        results << n << ","
                << input[n] << ","
                << hls_output[n] << ","
                << expected << ","
                << err << "\n";

        std::cout << "  n=" << n
                  << " | hls=" << hls_output[n]
                  << " | golden=" << expected
                  << " | err=" << err
                  << ((err < tol) ? " PASS" : " FAIL")
                  << std::endl;

        if (err >= tol)
        {
            pass = 0;
        }
    }

    results.close();

    std::cout << "  Impulse Response: "
              << (pass ? "PASSED" : "FAILED")
              << "\n" << std::endl;

    return pass;
}

static int test_passband_sine()
{
    std::cout << "=== Test 2: Passband Sine (freq = 0.05 * Fs) ===" << std::endl;

    const int num_samples = 128;
    float input[num_samples] = {0.0f};
    float hls_output[num_samples] = {0.0f};

    float x_history[N_TAPS_TB];
    std::memset(x_history, 0, sizeof(x_history));

    float golden_output[num_samples] = {0.0f};

    float freq = 0.05f;
    float pi = 3.14159265358979f;

    for (int n = 0; n < num_samples; n++)
    {
        input[n] = std::sin(2.0f * pi * freq * n);

        push_sample_float(x_history, input[n]);
        golden_output[n] = golden_fir_float(x_history, h_float);
    }

    run_hls_filter(input, hls_output, num_samples);

    float max_out = 0.0f;
    float max_err = 0.0f;

    std::ofstream results("fir_results_passband.txt");
    results << "n,input,hls_output,golden,err\n";

    for (int n = 0; n < num_samples; n++)
    {
        float err = std::fabs(hls_output[n] - golden_output[n]);

        results << n << ","
                << input[n] << ","
                << hls_output[n] << ","
                << golden_output[n] << ","
                << err << "\n";

        if (n >= N_TAPS_TB)
        {
            float abs_y = std::fabs(hls_output[n]);

            if (abs_y > max_out)
            {
                max_out = abs_y;
            }

            if (err > max_err)
            {
                max_err = err;
            }
        }

        if (n >= N_TAPS_TB - 4)
        {
            std::cout << "  n=" << n
                      << " | x=" << input[n]
                      << " | hls=" << hls_output[n]
                      << " | golden=" << golden_output[n]
                      << " | err=" << err
                      << std::endl;
        }
    }

    results.close();

    int pass = (max_out > 0.9f) && (max_err < 0.01f);

    std::cout << "  Max output amplitude (settled): " << max_out << std::endl;
    std::cout << "  Max HLS vs golden error: " << max_err << std::endl;
    std::cout << "  Passband Sine: "
              << (pass ? "PASSED" : "FAILED")
              << "\n" << std::endl;

    return pass;
}

static int test_stopband_sine()
{
    std::cout << "=== Test 3: Stopband Sine (freq = 0.40 * Fs) ===" << std::endl;

    const int num_samples = 128;
    float input[num_samples] = {0.0f};
    float hls_output[num_samples] = {0.0f};

    float x_history[N_TAPS_TB];
    std::memset(x_history, 0, sizeof(x_history));

    float golden_output[num_samples] = {0.0f};

    float freq = 0.40f;
    float pi = 3.14159265358979f;

    for (int n = 0; n < num_samples; n++)
    {
        input[n] = std::sin(2.0f * pi * freq * n);

        push_sample_float(x_history, input[n]);
        golden_output[n] = golden_fir_float(x_history, h_float);
    }

    run_hls_filter(input, hls_output, num_samples);

    float max_out = 0.0f;
    float max_err = 0.0f;

    std::ofstream results("fir_results_stopband.txt");
    results << "n,input,hls_output,golden,err\n";

    for (int n = 0; n < num_samples; n++)
    {
        float err = std::fabs(hls_output[n] - golden_output[n]);

        results << n << ","
                << input[n] << ","
                << hls_output[n] << ","
                << golden_output[n] << ","
                << err << "\n";

        if (n >= N_TAPS_TB)
        {
            float abs_y = std::fabs(hls_output[n]);

            if (abs_y > max_out)
            {
                max_out = abs_y;
            }

            if (err > max_err)
            {
                max_err = err;
            }
        }

        if (n >= N_TAPS_TB - 4)
        {
            std::cout << "  n=" << n
                      << " | x=" << input[n]
                      << " | hls=" << hls_output[n]
                      << " | golden=" << golden_output[n]
                      << " | err=" << err
                      << std::endl;
        }
    }

    results.close();

    int pass = (max_out < 0.1f) && (max_err < 0.01f);

    std::cout << "  Max output amplitude (settled): " << max_out << std::endl;
    std::cout << "  Max HLS vs golden error: " << max_err << std::endl;
    std::cout << "  Stopband Sine: "
              << (pass ? "PASSED" : "FAILED")
              << "\n" << std::endl;

    return pass;
}

int main()
{
    std::cout << "========================================" << std::endl;
    std::cout << "  FIR Filter - HLS vs Golden Behavior" << std::endl;
    std::cout << "  32 taps, low-pass, cutoff ~0.1*Fs" << std::endl;
    std::cout << "========================================\n" << std::endl;

    int p1 = test_impulse_response();
    int p2 = test_passband_sine();
    int p3 = test_stopband_sine();

    std::cout << "========================================" << std::endl;
    std::cout << "  SUMMARY" << std::endl;
    std::cout << "  Impulse Response : " << (p1 ? "PASS" : "FAIL") << std::endl;
    std::cout << "  Passband Sine    : " << (p2 ? "PASS" : "FAIL") << std::endl;
    std::cout << "  Stopband Sine    : " << (p3 ? "PASS" : "FAIL") << std::endl;
    std::cout << "  Overall          : " << ((p1 && p2 && p3) ? "ALL PASS" : "SOME FAILED") << std::endl;
    std::cout << "========================================" << std::endl;

    return (p1 && p2 && p3) ? 0 : 1;
}
