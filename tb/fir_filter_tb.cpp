#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include "fir_filter.hpp"

static acc_t golden_fir(
    const std::vector<sample_t>& x,
    const coeff_t coeffs[MAX_TAPS],
    int num_taps,
    int n
) {
    acc_t acc = 0;
    for (int k = 0; k < num_taps; k++) {
        int idx = n - k;
        sample_t sample = (idx >= 0) ? x[idx] : sample_t(0);
        acc += (acc_t)sample * (acc_t)coeffs[k];
    }
    return acc;
}

int main() {
    const int num_taps = 8;
    const int num_samples = 32;

    coeff_t coeffs[MAX_TAPS] = {0};
    coeffs[0] = 1;
    coeffs[1] = 2;
    coeffs[2] = 3;
    coeffs[3] = 4;
    coeffs[4] = 4;
    coeffs[5] = 3;
    coeffs[6] = 2;
    coeffs[7] = 1;

    std::vector<sample_t> input(num_samples);
    for (int i = 0; i < num_samples; i++) {
        input[i] = i + 1;
    }

    hls::stream<axis_word_t> in_stream;
    hls::stream<axis_word_t> out_stream;

    for (int i = 0; i < num_samples; i++) {
        axis_word_t word;
        word.data = input[i];
        word.keep = -1;
        word.strb = -1;
        word.last = (i == num_samples - 1) ? 1 : 0;
        in_stream.write(word);
    }

    fir_filter(in_stream, out_stream, coeffs, num_taps, num_samples);

    bool pass = true;

    std::ofstream results("fir_results.txt");
    results << "n,input,output,golden\n";

    for (int n = 0; n < num_samples; n++) {
        axis_word_t out_word = out_stream.read();
        acc_t expected = golden_fir(input, coeffs, num_taps, n);
        acc_t actual = (acc_t)(ap_int<DATA_WIDTH>)out_word.data;

        results << n << "," << input[n] << "," << actual << "," << expected << "\n";

        if (actual != expected) {
            std::cout << "Mismatch at n=" << n
                      << ": actual=" << actual
                      << ", expected=" << expected << std::endl;
            pass = false;
        }

        if (n == num_samples - 1 && out_word.last != 1) {
            std::cout << "Missing TLAST on final output sample" << std::endl;
            pass = false;
        }
    }

    results.close();

    if (pass) {
        std::cout << "PASS: FIR filter output matches golden model." << std::endl;
        return 0;
    } else {
        std::cout << "FAIL: FIR filter output mismatch." << std::endl;
        return 1;
    }
}
