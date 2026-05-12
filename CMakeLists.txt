cmake_minimum_required(VERSION 4.0)
project(FIR_filter)

set(CMAKE_CXX_STANDARD 17)

add_executable(FIR_filter
        fir_ref.h fir_ref.cpp
        fir_ref_tb.cpp
        fir_ref.h fir_ref.cpp)
