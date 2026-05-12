cmake_minimum_required(VERSION 4.0)
project(FIR_Filter)

set(CMAKE_CXX_STANDARD 20)

add_executable(FIR_Filter fir_ref_tb.cpp fir_ref.cpp)
