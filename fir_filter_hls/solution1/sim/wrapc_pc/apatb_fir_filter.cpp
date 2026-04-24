#include "hls_signal_handler.h"
#include <algorithm>
#include <complex>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <exception>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include "ap_fixed.h"
#include "ap_int.h"
#include "autopilot_cbe.h"
#include "hls_half.h"
#include "hls_directio.h"
#include "hls_stream.h"

using namespace std;

// wrapc file define:
#define AUTOTB_TVIN_in_stream_V_data_V "../tv/cdatafile/c.fir_filter.autotvin_in_stream_V_data_V.dat"
#define AUTOTB_TVOUT_in_stream_V_data_V "../tv/cdatafile/c.fir_filter.autotvout_in_stream_V_data_V.dat"
#define AUTOTB_TVIN_in_stream_V_keep_V "../tv/cdatafile/c.fir_filter.autotvin_in_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_in_stream_V_keep_V "../tv/cdatafile/c.fir_filter.autotvout_in_stream_V_keep_V.dat"
#define AUTOTB_TVIN_in_stream_V_strb_V "../tv/cdatafile/c.fir_filter.autotvin_in_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_in_stream_V_strb_V "../tv/cdatafile/c.fir_filter.autotvout_in_stream_V_strb_V.dat"
#define AUTOTB_TVIN_in_stream_V_last_V "../tv/cdatafile/c.fir_filter.autotvin_in_stream_V_last_V.dat"
#define AUTOTB_TVOUT_in_stream_V_last_V "../tv/cdatafile/c.fir_filter.autotvout_in_stream_V_last_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_stream_V_data_V "../tv/stream_size/stream_size_in_in_stream_V_data_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_stream_V_data_V "../tv/stream_size/stream_ingress_status_in_stream_V_data_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_stream_V_keep_V "../tv/stream_size/stream_size_in_in_stream_V_keep_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_stream_V_keep_V "../tv/stream_size/stream_ingress_status_in_stream_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_stream_V_strb_V "../tv/stream_size/stream_size_in_in_stream_V_strb_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_stream_V_strb_V "../tv/stream_size/stream_ingress_status_in_stream_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_IN_in_stream_V_last_V "../tv/stream_size/stream_size_in_in_stream_V_last_V.dat"
#define WRAPC_STREAM_INGRESS_STATUS_in_stream_V_last_V "../tv/stream_size/stream_ingress_status_in_stream_V_last_V.dat"
#define AUTOTB_TVIN_out_stream_V_data_V "../tv/cdatafile/c.fir_filter.autotvin_out_stream_V_data_V.dat"
#define AUTOTB_TVOUT_out_stream_V_data_V "../tv/cdatafile/c.fir_filter.autotvout_out_stream_V_data_V.dat"
#define AUTOTB_TVIN_out_stream_V_keep_V "../tv/cdatafile/c.fir_filter.autotvin_out_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_out_stream_V_keep_V "../tv/cdatafile/c.fir_filter.autotvout_out_stream_V_keep_V.dat"
#define AUTOTB_TVIN_out_stream_V_strb_V "../tv/cdatafile/c.fir_filter.autotvin_out_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_out_stream_V_strb_V "../tv/cdatafile/c.fir_filter.autotvout_out_stream_V_strb_V.dat"
#define AUTOTB_TVIN_out_stream_V_last_V "../tv/cdatafile/c.fir_filter.autotvin_out_stream_V_last_V.dat"
#define AUTOTB_TVOUT_out_stream_V_last_V "../tv/cdatafile/c.fir_filter.autotvout_out_stream_V_last_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V "../tv/stream_size/stream_size_out_out_stream_V_data_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_data_V "../tv/stream_size/stream_egress_status_out_stream_V_data_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V "../tv/stream_size/stream_size_out_out_stream_V_keep_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_keep_V "../tv/stream_size/stream_egress_status_out_stream_V_keep_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V "../tv/stream_size/stream_size_out_out_stream_V_strb_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_strb_V "../tv/stream_size/stream_egress_status_out_stream_V_strb_V.dat"
#define WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V "../tv/stream_size/stream_size_out_out_stream_V_last_V.dat"
#define WRAPC_STREAM_EGRESS_STATUS_out_stream_V_last_V "../tv/stream_size/stream_egress_status_out_stream_V_last_V.dat"
#define AUTOTB_TVIN_coeffs_0 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_0.dat"
#define AUTOTB_TVOUT_coeffs_0 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_0.dat"
#define AUTOTB_TVIN_coeffs_1 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_1.dat"
#define AUTOTB_TVOUT_coeffs_1 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_1.dat"
#define AUTOTB_TVIN_coeffs_2 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_2.dat"
#define AUTOTB_TVOUT_coeffs_2 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_2.dat"
#define AUTOTB_TVIN_coeffs_3 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_3.dat"
#define AUTOTB_TVOUT_coeffs_3 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_3.dat"
#define AUTOTB_TVIN_coeffs_4 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_4.dat"
#define AUTOTB_TVOUT_coeffs_4 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_4.dat"
#define AUTOTB_TVIN_coeffs_5 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_5.dat"
#define AUTOTB_TVOUT_coeffs_5 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_5.dat"
#define AUTOTB_TVIN_coeffs_6 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_6.dat"
#define AUTOTB_TVOUT_coeffs_6 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_6.dat"
#define AUTOTB_TVIN_coeffs_7 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_7.dat"
#define AUTOTB_TVOUT_coeffs_7 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_7.dat"
#define AUTOTB_TVIN_coeffs_8 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_8.dat"
#define AUTOTB_TVOUT_coeffs_8 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_8.dat"
#define AUTOTB_TVIN_coeffs_9 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_9.dat"
#define AUTOTB_TVOUT_coeffs_9 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_9.dat"
#define AUTOTB_TVIN_coeffs_10 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_10.dat"
#define AUTOTB_TVOUT_coeffs_10 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_10.dat"
#define AUTOTB_TVIN_coeffs_11 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_11.dat"
#define AUTOTB_TVOUT_coeffs_11 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_11.dat"
#define AUTOTB_TVIN_coeffs_12 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_12.dat"
#define AUTOTB_TVOUT_coeffs_12 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_12.dat"
#define AUTOTB_TVIN_coeffs_13 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_13.dat"
#define AUTOTB_TVOUT_coeffs_13 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_13.dat"
#define AUTOTB_TVIN_coeffs_14 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_14.dat"
#define AUTOTB_TVOUT_coeffs_14 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_14.dat"
#define AUTOTB_TVIN_coeffs_15 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_15.dat"
#define AUTOTB_TVOUT_coeffs_15 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_15.dat"
#define AUTOTB_TVIN_coeffs_16 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_16.dat"
#define AUTOTB_TVOUT_coeffs_16 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_16.dat"
#define AUTOTB_TVIN_coeffs_17 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_17.dat"
#define AUTOTB_TVOUT_coeffs_17 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_17.dat"
#define AUTOTB_TVIN_coeffs_18 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_18.dat"
#define AUTOTB_TVOUT_coeffs_18 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_18.dat"
#define AUTOTB_TVIN_coeffs_19 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_19.dat"
#define AUTOTB_TVOUT_coeffs_19 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_19.dat"
#define AUTOTB_TVIN_coeffs_20 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_20.dat"
#define AUTOTB_TVOUT_coeffs_20 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_20.dat"
#define AUTOTB_TVIN_coeffs_21 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_21.dat"
#define AUTOTB_TVOUT_coeffs_21 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_21.dat"
#define AUTOTB_TVIN_coeffs_22 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_22.dat"
#define AUTOTB_TVOUT_coeffs_22 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_22.dat"
#define AUTOTB_TVIN_coeffs_23 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_23.dat"
#define AUTOTB_TVOUT_coeffs_23 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_23.dat"
#define AUTOTB_TVIN_coeffs_24 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_24.dat"
#define AUTOTB_TVOUT_coeffs_24 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_24.dat"
#define AUTOTB_TVIN_coeffs_25 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_25.dat"
#define AUTOTB_TVOUT_coeffs_25 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_25.dat"
#define AUTOTB_TVIN_coeffs_26 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_26.dat"
#define AUTOTB_TVOUT_coeffs_26 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_26.dat"
#define AUTOTB_TVIN_coeffs_27 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_27.dat"
#define AUTOTB_TVOUT_coeffs_27 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_27.dat"
#define AUTOTB_TVIN_coeffs_28 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_28.dat"
#define AUTOTB_TVOUT_coeffs_28 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_28.dat"
#define AUTOTB_TVIN_coeffs_29 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_29.dat"
#define AUTOTB_TVOUT_coeffs_29 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_29.dat"
#define AUTOTB_TVIN_coeffs_30 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_30.dat"
#define AUTOTB_TVOUT_coeffs_30 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_30.dat"
#define AUTOTB_TVIN_coeffs_31 "../tv/cdatafile/c.fir_filter.autotvin_coeffs_31.dat"
#define AUTOTB_TVOUT_coeffs_31 "../tv/cdatafile/c.fir_filter.autotvout_coeffs_31.dat"
#define AUTOTB_TVIN_num_taps "../tv/cdatafile/c.fir_filter.autotvin_num_taps.dat"
#define AUTOTB_TVOUT_num_taps "../tv/cdatafile/c.fir_filter.autotvout_num_taps.dat"
#define AUTOTB_TVIN_num_samples "../tv/cdatafile/c.fir_filter.autotvin_num_samples.dat"
#define AUTOTB_TVOUT_num_samples "../tv/cdatafile/c.fir_filter.autotvout_num_samples.dat"


// tvout file define:
#define AUTOTB_TVOUT_PC_in_stream_V_data_V "../tv/rtldatafile/rtl.fir_filter.autotvout_in_stream_V_data_V.dat"
#define AUTOTB_TVOUT_PC_in_stream_V_keep_V "../tv/rtldatafile/rtl.fir_filter.autotvout_in_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_in_stream_V_strb_V "../tv/rtldatafile/rtl.fir_filter.autotvout_in_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_in_stream_V_last_V "../tv/rtldatafile/rtl.fir_filter.autotvout_in_stream_V_last_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_data_V "../tv/rtldatafile/rtl.fir_filter.autotvout_out_stream_V_data_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_keep_V "../tv/rtldatafile/rtl.fir_filter.autotvout_out_stream_V_keep_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_strb_V "../tv/rtldatafile/rtl.fir_filter.autotvout_out_stream_V_strb_V.dat"
#define AUTOTB_TVOUT_PC_out_stream_V_last_V "../tv/rtldatafile/rtl.fir_filter.autotvout_out_stream_V_last_V.dat"


namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}

namespace hls::sim
{
  size_t divide_ceil(size_t a, size_t b)
  {
    return (a + b - 1) / b;
  }

  const bool little_endian()
  {
    int a = 1;
    return *(char*)&a == 1;
  }

  inline void rev_endian(unsigned char *p, size_t nbytes)
  {
    std::reverse(p, p+nbytes);
  }

  const bool LE = little_endian();

  inline size_t least_nbyte(size_t width)
  {
    return (width+7)>>3;
  }

  std::string formatData(unsigned char *pos, size_t wbits)
  {
    size_t wbytes = least_nbyte(wbits);
    size_t i = LE ? wbytes-1 : 0;
    auto next = [&] () {
      auto c = pos[i];
      LE ? --i : ++i;
      return c;
    };
    std::ostringstream ss;
    ss << "0x";
    if (int t = (wbits & 0x7)) {
      if (t <= 4) {
        unsigned char mask = (1<<t)-1;
        ss << std::hex << std::setfill('0') << std::setw(1)
           << (int) (next() & mask);
        wbytes -= 1;
      }
    }
    for (size_t i = 0; i < wbytes; ++i) {
      ss << std::hex << std::setfill('0') << std::setw(2) << (int)next();
    }
    return ss.str();
  }

  char ord(char c)
  {
    if (c >= 'a' && c <= 'f') {
      return c-'a'+10;
    } else if (c >= 'A' && c <= 'F') {
      return c-'A'+10;
    } else if (c >= '0' && c <= '9') {
      return c-'0';
    } else {
      throw SimException("Not Hexdecimal Digit", __LINE__);
    }
  }

  void unformatData(const char *data, unsigned char *put, size_t pbytes = 0)
  {
    size_t nchars = strlen(data+2);
    size_t nbytes = (nchars+1)>>1;
    if (pbytes == 0) {
      pbytes = nbytes;
    } else if (pbytes > nbytes) {
      throw SimException("Wrong size specified", __LINE__);
    }
    put = LE ? put : put+pbytes-1;
    auto nextp = [&] () {
      return LE ? put++ : put--;
    };
    const char *c = data + (nchars + 2) - 1;
    auto next = [&] () {
      char res { *c == 'x' ? (char)0 : ord(*c) };
      --c;
      return res;
    };
    for (size_t i = 0; i < pbytes; ++i) {
      char l = next();
      char h = next();
      *nextp() = (h<<4)+l;
    }
  }

  char* strip(char *s)
  {
    while (isspace(*s)) {
      ++s;
    }
    for (char *p = s+strlen(s)-1; p >= s; --p) {
      if (isspace(*p)) {
        *p = 0;
      } else {
        return s;
      }
    }
    return s;
  }

  size_t sum(const std::vector<size_t> &v)
  {
    size_t res = 0;
    for (const auto &e : v) {
      res += e;
    }
    return res;
  }

  const char* bad = "Bad TV file";
  const char* err = "Error on TV file";

  const unsigned char bmark[] = {
    0x5a, 0x5a, 0xa5, 0xa5, 0x0f, 0x0f, 0xf0, 0xf0
  };

#ifdef USE_BINARY_TV_FILE
  class Input {
    FILE *fp;
    long pos;

    void read(unsigned char *buf, size_t size)
    {
      if (fread(buf, size, 1, fp) != 1) {
        throw SimException(bad, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    void advance(size_t nbytes)
    {
      if (fseek(fp, nbytes, SEEK_CUR) == -1) {
        throw SimException(bad, __LINE__);
      }
    }

    Input(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "rb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void begin()
    {
      advance(8);
      pos = ftell(fp);
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void into(unsigned char *param, size_t wbytes, size_t asize, size_t nbytes)
    {
      size_t n = nbytes / asize;
      size_t r = nbytes % asize;
      for (size_t i = 0; i < n; ++i) {
        read(param, wbytes);
        param += asize;
      }
      if (r > 0) {
        advance(asize-r);
        read(param, r);
      }
    }

    ~Input()
    {
      unsigned char buf[8];
      size_t res = fread(buf, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, bad);
      }
      if (std::memcmp(buf, bmark, 8) != 0) {
        errExit(__LINE__, bad);
      }
    }
  };

  class Output {
    FILE *fp;

    void write(unsigned char *buf, size_t size)
    {
      if (LE) {
        rev_endian(buf, size);
      }
      if (fwrite(buf, size, 1, fp) != 1) {
        throw SimException(err, __LINE__);
      }
      if (LE) {
        rev_endian(buf, size);
      }
    }

  public:
    Output(const char *path) : fp(nullptr)
    {
      fp = fopen(path, "wb");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void begin(size_t total)
    {
      unsigned char buf[8] = {0};
      std::memcpy(buf, &total, sizeof(buf));
      write(buf, sizeof(buf));
    }

    void from(unsigned char *param, size_t wbytes, size_t asize, size_t nbytes, size_t skip)
    {
      param -= asize*skip;
      size_t n = divide_ceil(nbytes, asize);
      for (size_t i = 0; i < n; ++i) {
        write(param, wbytes);
        param += asize;
      }
    }

    ~Output()
    {
      size_t res = fwrite(bmark, 8, 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }
  };
#endif

  class Reader {
    FILE *fp;
    long pos;
    int size;
    char *s;

    void readline()
    {
      s = fgets(s, size, fp);
      if (s == nullptr) {
        throw SimException(bad, __LINE__);
      }
    }

  public:
    Reader(const char *path) : fp(nullptr), size(1<<12), s(new char[size])
    {
      try {
        fp = fopen(path, "r");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          readline();
          static const char mark[] = "[[[runtime]]]\n";
          if (strcmp(s, mark) != 0) {
            throw SimException(bad, __LINE__);
          }
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    ~Reader()
    {
      fclose(fp);
      delete[] s;
    }

    void begin()
    {
      readline();
      static const char mark[] = "[[transaction]]";
      if (strncmp(s, mark, strlen(mark)) != 0) {
        throw SimException(bad, __LINE__);
      }
      pos = ftell(fp);
    }

    void reset()
    {
      fseek(fp, pos, SEEK_SET);
    }

    void skip(size_t n)
    {
      for (size_t i = 0; i < n; ++i) {
        readline();
      }
    }

    char* next()
    {
      long pos = ftell(fp);
      readline();
      if (*s == '[') {
        fseek(fp, pos, SEEK_SET);
        return nullptr;
      }
      return strip(s);
    }

    void end()
    {
      do {
        readline();
      } while (strcmp(s, "[[/transaction]]\n") != 0);
    }
  };

  class Writer {
    FILE *fp;

    void write(const char *s)
    {
      if (fputs(s, fp) == EOF) {
        throw SimException(err, __LINE__);
      }
    }

  public:
    Writer(const char *path) : fp(nullptr)
    {
      try {
        fp = fopen(path, "w");
        if (fp == nullptr) {
          throw SimException(err, __LINE__);
        } else {
          static const char mark[] = "[[[runtime]]]\n";
          write(mark);
        }
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
    }

    virtual ~Writer()
    {
      try {
        static const char mark[] = "[[[/runtime]]]\n";
        write(mark);
      } catch (const hls::sim::SimException &e) {
        errExit(e.line, e.msg);
      }
      fclose(fp);
    }

    void begin(size_t AESL_transaction)
    {
      static const char mark[] = "[[transaction]]           ";
      write(mark);
      auto buf = std::to_string(AESL_transaction);
      buf.push_back('\n');
      buf.push_back('\0');
      write(buf.data());
    }

    void next(const char *s)
    {
      write(s);
      write("\n");
    }

    void end()
    {
      static const char mark[] = "[[/transaction]]\n";
      write(mark);
    }
  };

  bool RTLOutputCheckAndReplacement(char *data)
  {
    bool changed = false;
    for (size_t i = 2; i < strlen(data); ++i) {
      if (data[i] == 'X' || data[i] == 'x') {
        data[i] = '0';
        changed = true;
      }
    }
    return changed;
  }

  void warnOnX()
  {
    static const char msg[] =
      "WARNING: [SIM 212-201] RTL produces unknown value "
      "'x' or 'X' on some port, possible cause: "
      "There are uninitialized variables in the design.\n";
    fprintf(stderr, msg);
  }

#ifndef POST_CHECK
  class RefTCL {
    FILE *fp;
    std::ostringstream ss;

    void formatDepth()
    {
      ss << "set depth_list {\n";
      for (auto &p : depth) {
        ss << "  {" << p.first << " " << p.second << "}\n";
      }
      if (nameHBM != "") {
        ss << "  {" << nameHBM << " " << depthHBM << "}\n";
      }
      ss << "}\n";
    }

    void formatTransNum()
    {
      ss << "set trans_num " << AESL_transaction << "\n";
    }

    void formatHBM()
    {
      ss << "set HBM_ArgDict {\n"
         << "  Name " << nameHBM << "\n"
         << "  Port " << portHBM << "\n"
         << "  BitWidth " << widthHBM << "\n"
         << "}\n";
    }

    void close()
    {
      formatDepth();
      formatTransNum();
      if (nameHBM != "") {
        formatHBM();
      }
      std::string &&s { ss.str() };
      size_t res = fwrite(s.data(), s.size(), 1, fp);
      fclose(fp);
      if (res != 1) {
        errExit(__LINE__, err);
      }
    }

  public:
    std::map<const std::string, size_t> depth;
    std::string nameHBM;
    size_t depthHBM;
    std::string portHBM;
    unsigned widthHBM;
    size_t AESL_transaction;
    std::mutex mut;

    RefTCL(const char *path)
    {
      fp = fopen(path, "w");
      if (fp == nullptr) {
        errExit(__LINE__, err);
      }
    }

    void set(const char* name, size_t dep)
    {
      std::lock_guard<std::mutex> guard(mut);
      if (depth[name] < dep) {
        depth[name] = dep;
      }
    }

    ~RefTCL()
    {
      close();
    }
  };

#endif

  struct Register {
    const char* name;
    unsigned width;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (strcmp(name, "return") == 0) {
        tcl.set("ap_return", 1);
      } else {
        tcl.set(name, 1);
      }
    }
#endif
    ~Register()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename E>
  struct DirectIO {
    unsigned width;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* writer;
    Writer* swriter;
    Writer* gwriter;
#endif
    hls::directio<E>* param;
    std::vector<E> buf;
    size_t initSize;
    size_t depth;
    bool hasWrite;

    void markSize()
    {
      initSize = param->size();
    }

    void buffer()
    {
      buf.clear();
      while (param->valid()) {
        buf.push_back(param->read());
      }
      for (auto &e : buf) {
        param->write(e);
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~DirectIO()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete writer;
      delete swriter;
      delete gwriter;
#endif
    }
  };

  template<typename Reader, typename Writer>
  struct Memory {
    unsigned width;
    unsigned asize;
    bool hbm;
    std::vector<const char*> name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    std::vector<void*> param;
    std::vector<size_t> nbytes;
    std::vector<size_t> offset;
    std::vector<bool> hasWrite;

    size_t depth()
    {
      size_t depth = 0;
      for (size_t n : nbytes) {
        depth += divide_ceil(n, asize);
      }
      return depth;
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      if (hbm) {
        tcl.nameHBM.append(name[0]);
        tcl.portHBM.append("{").append(name[0]);
        for (size_t i = 1; i < name.size(); ++i) {
          tcl.nameHBM.append("_").append(name[i]);
          tcl.portHBM.append(" ").append(name[i]);
        }
        tcl.nameHBM.append("_HBM");
        tcl.portHBM.append("}");
        tcl.widthHBM = width;
        tcl.depthHBM = divide_ceil(nbytes[0], asize);
      } else {
        tcl.set(name[0], depth());
      }
    }
#endif

    ~Memory()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  struct A2Stream {
    unsigned width;
    unsigned asize;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* owriter;
    Writer* iwriter;
#endif
    void* param;
    size_t nbytes;
    bool hasWrite;

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, divide_ceil(nbytes, asize));
    }
#endif

    ~A2Stream()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete owriter;
      delete iwriter;
#endif
    }
  };

  template<typename E>
  struct Stream {
    unsigned width;
    const char* name;
#ifdef POST_CHECK
    Reader* reader;
#else
    Writer* writer;
    Writer* swriter;
    Writer* gwriter;
#endif
    hls::stream<E>* param;
    std::vector<E> buf;
    size_t initSize;
    size_t depth;
    bool hasWrite;

    void markSize()
    {
      initSize = param->size();
    }

    void buffer()
    {
      buf.clear();
      while (!param->empty()) {
        buf.push_back(param->read());
      }
      for (auto &e : buf) {
        param->write(e);
      }
    }

#ifndef POST_CHECK
    void doTCL(RefTCL &tcl)
    {
      tcl.set(name, depth);
    }
#endif

    ~Stream()
    {
#ifdef POST_CHECK
      delete reader;
#else
      delete writer;
      delete swriter;
      delete gwriter;
#endif
    }
  };

#ifdef POST_CHECK
  void check(Register &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (char *s = port.reader->next()) {
      foundX |= RTLOutputCheckAndReplacement(s);
      unformatData(s, (unsigned char*)port.param);
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  template<typename E>
  void check(DirectIO<E> &port)
  {
    if (port.hasWrite) {
      port.reader->begin();
      bool foundX = false;
      E *p = new E;
      while (char *s = port.reader->next()) {
        foundX |= RTLOutputCheckAndReplacement(s);
        unformatData(s, (unsigned char*)p);
        port.param->write(*p);
      }
      delete p;
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    } else {
      port.reader->begin();
      size_t n = 0;
      if (char *s = port.reader->next()) {
        std::istringstream ss(s);
        ss >> n;
      } else {
        throw SimException(bad, __LINE__);
      }
      port.reader->end();
      for (size_t j = 0; j < n; ++j) {
        port.param->read();
      }
    }
  }

#ifdef USE_BINARY_TV_FILE
  void checkHBM(Memory<Input, Output> &port)
  {
    port.reader->begin();
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.hasWrite[i]) {
        port.reader->reset();
        size_t skip = wbytes * port.offset[i];
        port.reader->advance(skip);
        port.reader->into((unsigned char*)port.param[i], wbytes,
                           port.asize, port.nbytes[i] - skip);
      }
    }
  }

  void check(Memory<Input, Output> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      size_t wbytes = least_nbyte(port.width);
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          port.reader->into((unsigned char*)port.param[i], wbytes,
                             port.asize, port.nbytes[i]);
        } else {
          size_t n = divide_ceil(port.nbytes[i], port.asize);
          port.reader->advance(port.asize*n);
        }
      }
    }
  }
#endif
  void transfer(Reader *reader, size_t nbytes, unsigned char *put, bool &foundX)
  {
    if (char *s = reader->next()) {
      foundX |= RTLOutputCheckAndReplacement(s);
      unformatData(s, put, nbytes);
    } else {
      throw SimException("No more data", __LINE__);
    }
  }

  void checkHBM(Memory<Reader, Writer> &port)
  {
    port.reader->begin();
    bool foundX = false;
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0, last = port.param.size()-1; i <= last; ++i) {
      if (port.hasWrite[i]) {
        port.reader->skip(port.offset[i]);
        size_t n = port.nbytes[i] / port.asize - port.offset[i];
        unsigned char *put = (unsigned char*)port.param[i];
        for (size_t j = 0; j < n; ++j) {
          transfer(port.reader, wbytes, put, foundX);
          put += port.asize;
        }
        if (i < last) {
          port.reader->reset();
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  void check(Memory<Reader, Writer> &port)
  {
    if (port.hbm) {
      return checkHBM(port);
    } else {
      port.reader->begin();
      bool foundX = false;
      size_t wbytes = least_nbyte(port.width);
      for (size_t i = 0; i < port.param.size(); ++i) {
        if (port.hasWrite[i]) {
          size_t n = port.nbytes[i] / port.asize;
          size_t r = port.nbytes[i] % port.asize;
          unsigned char *put = (unsigned char*)port.param[i];
          for (size_t j = 0; j < n; ++j) {
            transfer(port.reader, wbytes, put, foundX);
            put += port.asize;
          }
          if (r > 0) {
            transfer(port.reader, r, put, foundX);
          }
        } else {
          size_t n = divide_ceil(port.nbytes[i], port.asize);
          port.reader->skip(n);
        }
      }
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    }
  }

  void check(A2Stream &port)
  {
    port.reader->begin();
    bool foundX = false;
    if (port.hasWrite) {
      size_t wbytes = least_nbyte(port.width);
      size_t n = port.nbytes / port.asize;
      size_t r = port.nbytes % port.asize;
      unsigned char *put = (unsigned char*)port.param;
      for (size_t j = 0; j < n; ++j) {
        if (char *s = port.reader->next()) {
          foundX |= RTLOutputCheckAndReplacement(s);
          unformatData(s, put, wbytes);
        }
        put += port.asize;
      }
      if (r > 0) {
        if (char *s = port.reader->next()) {
          foundX |= RTLOutputCheckAndReplacement(s);
          unformatData(s, put, r);
        }
      }
    }
    port.reader->end();
    if (foundX) {
      warnOnX();
    }
  }

  template<typename E>
  void check(Stream<E> &port)
  {
    if (port.hasWrite) {
      port.reader->begin();
      bool foundX = false;
      E *p = new E;
      while (char *s = port.reader->next()) {
        foundX |= RTLOutputCheckAndReplacement(s);
        unformatData(s, (unsigned char*)p);
        port.param->write(*p);
      }
      delete p;
      port.reader->end();
      if (foundX) {
        warnOnX();
      }
    } else {
      port.reader->begin();
      size_t n = 0;
      if (char *s = port.reader->next()) {
        std::istringstream ss(s);
        ss >> n;
      } else {
        throw SimException(bad, __LINE__);
      }
      port.reader->end();
      for (size_t j = 0; j < n; ++j) {
        port.param->read();
      }
    }
  }
#else
  void dump(Register &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    std::string &&s { formatData((unsigned char*)port.param, port.width) };
    writer->next(s.data());
    writer->end();
  }

  template<typename E>
  void dump(DirectIO<E> &port, size_t AESL_transaction)
  {
    if (port.hasWrite) {
      port.writer->begin(AESL_transaction);
      port.depth = port.param->size()-port.initSize;
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[port.initSize+j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();
    } else {
      port.writer->begin(AESL_transaction);
      port.depth = port.initSize-port.param->size();
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();

      port.gwriter->begin(AESL_transaction);
      size_t n = (port.depth ? port.initSize : port.depth);
      size_t d = port.depth;
      do {
        port.gwriter->next(std::to_string(n--).c_str());
      } while (d--);
      port.gwriter->end();
    }
  }

  void error_on_depth_unspecified(const char *portName)
  {
    std::string msg {"A depth specification is required for interface port "};
    msg.append("'");
    msg.append(portName);
    msg.append("'");
    msg.append(" for cosimulation.");
    throw SimException(msg, __LINE__);
  }

#ifdef USE_BINARY_TV_FILE
  void dump(Memory<Input, Output> &port, Output *writer, size_t AESL_transaction)
  {
    writer->begin(port.depth());
    size_t wbytes = least_nbyte(port.width);
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.nbytes[i] == 0) {
        error_on_depth_unspecified(port.hbm ? port.name[i] : port.name[0]);
      }
      writer->from((unsigned char*)port.param[i], wbytes, port.asize,
                   port.nbytes[i], 0);
    }
  }

#endif
  void dump(Memory<Reader, Writer> &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    for (size_t i = 0; i < port.param.size(); ++i) {
      if (port.nbytes[i] == 0) {
        error_on_depth_unspecified(port.hbm ? port.name[i] : port.name[0]);
      }
      size_t n = divide_ceil(port.nbytes[i], port.asize);
      unsigned char *put = (unsigned char*)port.param[i];
      for (size_t j = 0; j < n; ++j) {
        std::string &&s {
          formatData(put, port.width)
        };
        writer->next(s.data());
        put += port.asize;
      }
      if (port.hbm) {
        break;
      }
    }
    writer->end();
  }

  void dump(A2Stream &port, Writer *writer, size_t AESL_transaction)
  {
    writer->begin(AESL_transaction);
    if (port.nbytes == 0) {
      error_on_depth_unspecified(port.name);
    }
    size_t n = divide_ceil(port.nbytes, port.asize);
    unsigned char *put = (unsigned char*)port.param;
    for (size_t j = 0; j < n; ++j) {
      std::string &&s { formatData(put, port.width) };
      writer->next(s.data());
      put += port.asize;
    }
    writer->end();
  }

  template<typename E>
  void dump(Stream<E> &port, size_t AESL_transaction)
  {
    if (port.hasWrite) {
      port.writer->begin(AESL_transaction);
      port.depth = port.param->size()-port.initSize;
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[port.initSize+j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();
    } else {
      port.writer->begin(AESL_transaction);
      port.depth = port.initSize-port.param->size();
      for (size_t j = 0; j < port.depth; ++j) {
        std::string &&s {
          formatData((unsigned char*)&port.buf[j], port.width)
        };
        port.writer->next(s.c_str());
      }
      port.writer->end();

      port.swriter->begin(AESL_transaction);
      port.swriter->next(std::to_string(port.depth).c_str());
      port.swriter->end();

      port.gwriter->begin(AESL_transaction);
      size_t n = (port.depth ? port.initSize : port.depth);
      size_t d = port.depth;
      do {
        port.gwriter->next(std::to_string(n--).c_str());
      } while (d--);
      port.gwriter->end();
    }
  }
#endif
}



extern "C"
void fir_filter_hw_stub_wrapper(void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, void*, hls::sim::Byte<4>, hls::sim::Byte<4>);

extern "C"
void apatb_fir_filter_hw(void* __xlx_apatb_param_in_stream_V_data_V, void* __xlx_apatb_param_in_stream_V_keep_V, void* __xlx_apatb_param_in_stream_V_strb_V, void* __xlx_apatb_param_in_stream_V_last_V, void* __xlx_apatb_param_out_stream_V_data_V, void* __xlx_apatb_param_out_stream_V_keep_V, void* __xlx_apatb_param_out_stream_V_strb_V, void* __xlx_apatb_param_out_stream_V_last_V, void* __xlx_apatb_param_coeffs_0, void* __xlx_apatb_param_coeffs_1, void* __xlx_apatb_param_coeffs_2, void* __xlx_apatb_param_coeffs_3, void* __xlx_apatb_param_coeffs_4, void* __xlx_apatb_param_coeffs_5, void* __xlx_apatb_param_coeffs_6, void* __xlx_apatb_param_coeffs_7, void* __xlx_apatb_param_coeffs_8, void* __xlx_apatb_param_coeffs_9, void* __xlx_apatb_param_coeffs_10, void* __xlx_apatb_param_coeffs_11, void* __xlx_apatb_param_coeffs_12, void* __xlx_apatb_param_coeffs_13, void* __xlx_apatb_param_coeffs_14, void* __xlx_apatb_param_coeffs_15, void* __xlx_apatb_param_coeffs_16, void* __xlx_apatb_param_coeffs_17, void* __xlx_apatb_param_coeffs_18, void* __xlx_apatb_param_coeffs_19, void* __xlx_apatb_param_coeffs_20, void* __xlx_apatb_param_coeffs_21, void* __xlx_apatb_param_coeffs_22, void* __xlx_apatb_param_coeffs_23, void* __xlx_apatb_param_coeffs_24, void* __xlx_apatb_param_coeffs_25, void* __xlx_apatb_param_coeffs_26, void* __xlx_apatb_param_coeffs_27, void* __xlx_apatb_param_coeffs_28, void* __xlx_apatb_param_coeffs_29, void* __xlx_apatb_param_coeffs_30, void* __xlx_apatb_param_coeffs_31, hls::sim::Byte<4> __xlx_apatb_param_num_taps, hls::sim::Byte<4> __xlx_apatb_param_num_samples)
{
  static hls::sim::Stream<hls::sim::Byte<4>> port0 {
    .width = 32,
    .name = "in_stream_V_data_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(WRAPC_STREAM_SIZE_IN_in_stream_V_data_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVIN_in_stream_V_data_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_IN_in_stream_V_data_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_INGRESS_STATUS_in_stream_V_data_V),
#endif
  };
  port0.param = (hls::stream<hls::sim::Byte<4>>*)__xlx_apatb_param_in_stream_V_data_V;
  port0.hasWrite = false;

  static hls::sim::Stream<hls::sim::Byte<1>> port1 {
    .width = 4,
    .name = "in_stream_V_keep_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(WRAPC_STREAM_SIZE_IN_in_stream_V_keep_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVIN_in_stream_V_keep_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_IN_in_stream_V_keep_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_INGRESS_STATUS_in_stream_V_keep_V),
#endif
  };
  port1.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_in_stream_V_keep_V;
  port1.hasWrite = false;

  static hls::sim::Stream<hls::sim::Byte<1>> port2 {
    .width = 4,
    .name = "in_stream_V_strb_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(WRAPC_STREAM_SIZE_IN_in_stream_V_strb_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVIN_in_stream_V_strb_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_IN_in_stream_V_strb_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_INGRESS_STATUS_in_stream_V_strb_V),
#endif
  };
  port2.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_in_stream_V_strb_V;
  port2.hasWrite = false;

  static hls::sim::Stream<hls::sim::Byte<1>> port3 {
    .width = 1,
    .name = "in_stream_V_last_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(WRAPC_STREAM_SIZE_IN_in_stream_V_last_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVIN_in_stream_V_last_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_IN_in_stream_V_last_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_INGRESS_STATUS_in_stream_V_last_V),
#endif
  };
  port3.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_in_stream_V_last_V;
  port3.hasWrite = false;

  static hls::sim::Stream<hls::sim::Byte<4>> port4 {
    .width = 32,
    .name = "out_stream_V_data_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_out_stream_V_data_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVOUT_out_stream_V_data_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_OUT_out_stream_V_data_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_data_V),
#endif
  };
  port4.param = (hls::stream<hls::sim::Byte<4>>*)__xlx_apatb_param_out_stream_V_data_V;
  port4.hasWrite = true;

  static hls::sim::Stream<hls::sim::Byte<1>> port5 {
    .width = 4,
    .name = "out_stream_V_keep_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_out_stream_V_keep_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVOUT_out_stream_V_keep_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_OUT_out_stream_V_keep_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_keep_V),
#endif
  };
  port5.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_out_stream_V_keep_V;
  port5.hasWrite = true;

  static hls::sim::Stream<hls::sim::Byte<1>> port6 {
    .width = 4,
    .name = "out_stream_V_strb_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_out_stream_V_strb_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVOUT_out_stream_V_strb_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_OUT_out_stream_V_strb_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_strb_V),
#endif
  };
  port6.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_out_stream_V_strb_V;
  port6.hasWrite = true;

  static hls::sim::Stream<hls::sim::Byte<1>> port7 {
    .width = 1,
    .name = "out_stream_V_last_V",
#ifdef POST_CHECK
    .reader = new hls::sim::Reader(AUTOTB_TVOUT_PC_out_stream_V_last_V),
#else
    .writer = new hls::sim::Writer(AUTOTB_TVOUT_out_stream_V_last_V),
    .swriter = new hls::sim::Writer(WRAPC_STREAM_SIZE_OUT_out_stream_V_last_V),
    .gwriter = new hls::sim::Writer(WRAPC_STREAM_EGRESS_STATUS_out_stream_V_last_V),
#endif
  };
  port7.param = (hls::stream<hls::sim::Byte<1>>*)__xlx_apatb_param_out_stream_V_last_V;
  port7.hasWrite = true;

  static hls::sim::Register port8 {
    .name = "coeffs_0",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_0),
#endif
  };
  port8.param = __xlx_apatb_param_coeffs_0;

  static hls::sim::Register port9 {
    .name = "coeffs_1",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_1),
#endif
  };
  port9.param = __xlx_apatb_param_coeffs_1;

  static hls::sim::Register port10 {
    .name = "coeffs_2",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_2),
#endif
  };
  port10.param = __xlx_apatb_param_coeffs_2;

  static hls::sim::Register port11 {
    .name = "coeffs_3",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_3),
#endif
  };
  port11.param = __xlx_apatb_param_coeffs_3;

  static hls::sim::Register port12 {
    .name = "coeffs_4",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_4),
#endif
  };
  port12.param = __xlx_apatb_param_coeffs_4;

  static hls::sim::Register port13 {
    .name = "coeffs_5",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_5),
#endif
  };
  port13.param = __xlx_apatb_param_coeffs_5;

  static hls::sim::Register port14 {
    .name = "coeffs_6",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_6),
#endif
  };
  port14.param = __xlx_apatb_param_coeffs_6;

  static hls::sim::Register port15 {
    .name = "coeffs_7",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_7),
#endif
  };
  port15.param = __xlx_apatb_param_coeffs_7;

  static hls::sim::Register port16 {
    .name = "coeffs_8",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_8),
#endif
  };
  port16.param = __xlx_apatb_param_coeffs_8;

  static hls::sim::Register port17 {
    .name = "coeffs_9",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_9),
#endif
  };
  port17.param = __xlx_apatb_param_coeffs_9;

  static hls::sim::Register port18 {
    .name = "coeffs_10",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_10),
#endif
  };
  port18.param = __xlx_apatb_param_coeffs_10;

  static hls::sim::Register port19 {
    .name = "coeffs_11",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_11),
#endif
  };
  port19.param = __xlx_apatb_param_coeffs_11;

  static hls::sim::Register port20 {
    .name = "coeffs_12",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_12),
#endif
  };
  port20.param = __xlx_apatb_param_coeffs_12;

  static hls::sim::Register port21 {
    .name = "coeffs_13",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_13),
#endif
  };
  port21.param = __xlx_apatb_param_coeffs_13;

  static hls::sim::Register port22 {
    .name = "coeffs_14",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_14),
#endif
  };
  port22.param = __xlx_apatb_param_coeffs_14;

  static hls::sim::Register port23 {
    .name = "coeffs_15",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_15),
#endif
  };
  port23.param = __xlx_apatb_param_coeffs_15;

  static hls::sim::Register port24 {
    .name = "coeffs_16",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_16),
#endif
  };
  port24.param = __xlx_apatb_param_coeffs_16;

  static hls::sim::Register port25 {
    .name = "coeffs_17",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_17),
#endif
  };
  port25.param = __xlx_apatb_param_coeffs_17;

  static hls::sim::Register port26 {
    .name = "coeffs_18",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_18),
#endif
  };
  port26.param = __xlx_apatb_param_coeffs_18;

  static hls::sim::Register port27 {
    .name = "coeffs_19",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_19),
#endif
  };
  port27.param = __xlx_apatb_param_coeffs_19;

  static hls::sim::Register port28 {
    .name = "coeffs_20",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_20),
#endif
  };
  port28.param = __xlx_apatb_param_coeffs_20;

  static hls::sim::Register port29 {
    .name = "coeffs_21",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_21),
#endif
  };
  port29.param = __xlx_apatb_param_coeffs_21;

  static hls::sim::Register port30 {
    .name = "coeffs_22",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_22),
#endif
  };
  port30.param = __xlx_apatb_param_coeffs_22;

  static hls::sim::Register port31 {
    .name = "coeffs_23",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_23),
#endif
  };
  port31.param = __xlx_apatb_param_coeffs_23;

  static hls::sim::Register port32 {
    .name = "coeffs_24",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_24),
#endif
  };
  port32.param = __xlx_apatb_param_coeffs_24;

  static hls::sim::Register port33 {
    .name = "coeffs_25",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_25),
#endif
  };
  port33.param = __xlx_apatb_param_coeffs_25;

  static hls::sim::Register port34 {
    .name = "coeffs_26",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_26),
#endif
  };
  port34.param = __xlx_apatb_param_coeffs_26;

  static hls::sim::Register port35 {
    .name = "coeffs_27",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_27),
#endif
  };
  port35.param = __xlx_apatb_param_coeffs_27;

  static hls::sim::Register port36 {
    .name = "coeffs_28",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_28),
#endif
  };
  port36.param = __xlx_apatb_param_coeffs_28;

  static hls::sim::Register port37 {
    .name = "coeffs_29",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_29),
#endif
  };
  port37.param = __xlx_apatb_param_coeffs_29;

  static hls::sim::Register port38 {
    .name = "coeffs_30",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_30),
#endif
  };
  port38.param = __xlx_apatb_param_coeffs_30;

  static hls::sim::Register port39 {
    .name = "coeffs_31",
    .width = 16,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_coeffs_31),
#endif
  };
  port39.param = __xlx_apatb_param_coeffs_31;

  static hls::sim::Register port40 {
    .name = "num_taps",
    .width = 32,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_num_taps),
#endif
  };
  port40.param = &__xlx_apatb_param_num_taps;

  static hls::sim::Register port41 {
    .name = "num_samples",
    .width = 32,
#ifdef POST_CHECK
#else
    .owriter = nullptr,
    .iwriter = new hls::sim::Writer(AUTOTB_TVIN_num_samples),
#endif
  };
  port41.param = &__xlx_apatb_param_num_samples;

  try {
#ifdef POST_CHECK
    CodeState = ENTER_WRAPC_PC;
    check(port0);
    check(port1);
    check(port2);
    check(port3);
    check(port4);
    check(port5);
    check(port6);
    check(port7);
#else
    static hls::sim::RefTCL tcl("../tv/cdatafile/ref.tcl");
    CodeState = DUMP_INPUTS;
    dump(port8, port8.iwriter, tcl.AESL_transaction);
    dump(port9, port9.iwriter, tcl.AESL_transaction);
    dump(port10, port10.iwriter, tcl.AESL_transaction);
    dump(port11, port11.iwriter, tcl.AESL_transaction);
    dump(port12, port12.iwriter, tcl.AESL_transaction);
    dump(port13, port13.iwriter, tcl.AESL_transaction);
    dump(port14, port14.iwriter, tcl.AESL_transaction);
    dump(port15, port15.iwriter, tcl.AESL_transaction);
    dump(port16, port16.iwriter, tcl.AESL_transaction);
    dump(port17, port17.iwriter, tcl.AESL_transaction);
    dump(port18, port18.iwriter, tcl.AESL_transaction);
    dump(port19, port19.iwriter, tcl.AESL_transaction);
    dump(port20, port20.iwriter, tcl.AESL_transaction);
    dump(port21, port21.iwriter, tcl.AESL_transaction);
    dump(port22, port22.iwriter, tcl.AESL_transaction);
    dump(port23, port23.iwriter, tcl.AESL_transaction);
    dump(port24, port24.iwriter, tcl.AESL_transaction);
    dump(port25, port25.iwriter, tcl.AESL_transaction);
    dump(port26, port26.iwriter, tcl.AESL_transaction);
    dump(port27, port27.iwriter, tcl.AESL_transaction);
    dump(port28, port28.iwriter, tcl.AESL_transaction);
    dump(port29, port29.iwriter, tcl.AESL_transaction);
    dump(port30, port30.iwriter, tcl.AESL_transaction);
    dump(port31, port31.iwriter, tcl.AESL_transaction);
    dump(port32, port32.iwriter, tcl.AESL_transaction);
    dump(port33, port33.iwriter, tcl.AESL_transaction);
    dump(port34, port34.iwriter, tcl.AESL_transaction);
    dump(port35, port35.iwriter, tcl.AESL_transaction);
    dump(port36, port36.iwriter, tcl.AESL_transaction);
    dump(port37, port37.iwriter, tcl.AESL_transaction);
    dump(port38, port38.iwriter, tcl.AESL_transaction);
    dump(port39, port39.iwriter, tcl.AESL_transaction);
    dump(port40, port40.iwriter, tcl.AESL_transaction);
    dump(port41, port41.iwriter, tcl.AESL_transaction);
    port8.doTCL(tcl);
    port9.doTCL(tcl);
    port10.doTCL(tcl);
    port11.doTCL(tcl);
    port12.doTCL(tcl);
    port13.doTCL(tcl);
    port14.doTCL(tcl);
    port15.doTCL(tcl);
    port16.doTCL(tcl);
    port17.doTCL(tcl);
    port18.doTCL(tcl);
    port19.doTCL(tcl);
    port20.doTCL(tcl);
    port21.doTCL(tcl);
    port22.doTCL(tcl);
    port23.doTCL(tcl);
    port24.doTCL(tcl);
    port25.doTCL(tcl);
    port26.doTCL(tcl);
    port27.doTCL(tcl);
    port28.doTCL(tcl);
    port29.doTCL(tcl);
    port30.doTCL(tcl);
    port31.doTCL(tcl);
    port32.doTCL(tcl);
    port33.doTCL(tcl);
    port34.doTCL(tcl);
    port35.doTCL(tcl);
    port36.doTCL(tcl);
    port37.doTCL(tcl);
    port38.doTCL(tcl);
    port39.doTCL(tcl);
    port40.doTCL(tcl);
    port41.doTCL(tcl);
    port0.markSize();
    port1.markSize();
    port2.markSize();
    port3.markSize();
    port0.buffer();
    port1.buffer();
    port2.buffer();
    port3.buffer();
    port4.markSize();
    port5.markSize();
    port6.markSize();
    port7.markSize();
    CodeState = CALL_C_DUT;
    fir_filter_hw_stub_wrapper(__xlx_apatb_param_in_stream_V_data_V, __xlx_apatb_param_in_stream_V_keep_V, __xlx_apatb_param_in_stream_V_strb_V, __xlx_apatb_param_in_stream_V_last_V, __xlx_apatb_param_out_stream_V_data_V, __xlx_apatb_param_out_stream_V_keep_V, __xlx_apatb_param_out_stream_V_strb_V, __xlx_apatb_param_out_stream_V_last_V, __xlx_apatb_param_coeffs_0, __xlx_apatb_param_coeffs_1, __xlx_apatb_param_coeffs_2, __xlx_apatb_param_coeffs_3, __xlx_apatb_param_coeffs_4, __xlx_apatb_param_coeffs_5, __xlx_apatb_param_coeffs_6, __xlx_apatb_param_coeffs_7, __xlx_apatb_param_coeffs_8, __xlx_apatb_param_coeffs_9, __xlx_apatb_param_coeffs_10, __xlx_apatb_param_coeffs_11, __xlx_apatb_param_coeffs_12, __xlx_apatb_param_coeffs_13, __xlx_apatb_param_coeffs_14, __xlx_apatb_param_coeffs_15, __xlx_apatb_param_coeffs_16, __xlx_apatb_param_coeffs_17, __xlx_apatb_param_coeffs_18, __xlx_apatb_param_coeffs_19, __xlx_apatb_param_coeffs_20, __xlx_apatb_param_coeffs_21, __xlx_apatb_param_coeffs_22, __xlx_apatb_param_coeffs_23, __xlx_apatb_param_coeffs_24, __xlx_apatb_param_coeffs_25, __xlx_apatb_param_coeffs_26, __xlx_apatb_param_coeffs_27, __xlx_apatb_param_coeffs_28, __xlx_apatb_param_coeffs_29, __xlx_apatb_param_coeffs_30, __xlx_apatb_param_coeffs_31, __xlx_apatb_param_num_taps, __xlx_apatb_param_num_samples);
    port4.buffer();
    port5.buffer();
    port6.buffer();
    port7.buffer();
    dump(port0, tcl.AESL_transaction);
    dump(port1, tcl.AESL_transaction);
    dump(port2, tcl.AESL_transaction);
    dump(port3, tcl.AESL_transaction);
    port0.doTCL(tcl);
    port1.doTCL(tcl);
    port2.doTCL(tcl);
    port3.doTCL(tcl);
    CodeState = DUMP_OUTPUTS;
    dump(port4, tcl.AESL_transaction);
    dump(port5, tcl.AESL_transaction);
    dump(port6, tcl.AESL_transaction);
    dump(port7, tcl.AESL_transaction);
    port4.doTCL(tcl);
    port5.doTCL(tcl);
    port6.doTCL(tcl);
    port7.doTCL(tcl);
    tcl.AESL_transaction++;
#endif
  } catch (const hls::sim::SimException &e) {
    hls::sim::errExit(e.line, e.msg);
  }
}