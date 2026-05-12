#include "fir_filter.hpp"

void fir_filter(
    hls::stream<axis_word_t>& in_stream,
    hls::stream<axis_word_t>& out_stream,
    coeff_t coeffs[MAX_TAPS],
    int num_taps,
    int num_samples
) {
#pragma HLS INTERFACE axis port=in_stream
#pragma HLS INTERFACE axis port=out_stream

#pragma HLS INTERFACE s_axilite port=coeffs     bundle=CTRL
#pragma HLS INTERFACE s_axilite port=num_taps   bundle=CTRL
#pragma HLS INTERFACE s_axilite port=num_samples bundle=CTRL
#pragma HLS INTERFACE s_axilite port=return     bundle=CTRL

    sample_t delay_line[MAX_TAPS];
#pragma HLS ARRAY_PARTITION variable=delay_line complete dim=1
#pragma HLS ARRAY_PARTITION variable=coeffs complete dim=1

    // Initialize delay line
    init_delay_line:
    for (int i = 0; i < MAX_TAPS; i++) {
#pragma HLS UNROLL
        delay_line[i] = 0;
    }

    // Clamp inputs to safe bounds
    if (num_taps < 1) {
        num_taps = 1;
    }
    if (num_taps > MAX_TAPS) {
        num_taps = MAX_TAPS;
    }
    if (num_samples < 0) {
        num_samples = 0;
    }
    if (num_samples > MAX_SAMPLES) {
        num_samples = MAX_SAMPLES;
    }

    sample_loop:
    for (int n = 0; n < num_samples; n++) {
#pragma HLS PIPELINE II=1
        axis_word_t in_word = in_stream.read();
        sample_t x = (sample_t)in_word.data;

        // Shift delay line: newest sample goes into delay_line[0]
        shift_loop:
        for (int i = MAX_TAPS - 1; i > 0; i--) {
#pragma HLS UNROLL
            delay_line[i] = delay_line[i - 1];
        }
        delay_line[0] = x;

        // Multiply-accumulate
        acc_t acc = 0;
        mac_loop:
        for (int k = 0; k < MAX_TAPS; k++) {
#pragma HLS UNROLL
            if (k < num_taps) {
                acc += (acc_t)delay_line[k] * (acc_t)coeffs[k];
            }
        }

        axis_word_t out_word;
        out_word.data = (ap_int<DATA_WIDTH>)acc;
        out_word.keep = -1;
        out_word.strb = -1;
        out_word.last = (n == num_samples - 1) ? 1 : 0;

        out_stream.write(out_word);
    }
}
