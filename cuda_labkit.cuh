#pragma once  // 헤더 중복 포함 방지 

#include <cuda_runtime.h>
#include <cstdio>
#include <cstdlib>
#include <chrono>

#define CHECK_CUDA(call)                                                     \
do {                                                                         \
    cudaError_t err__ = (call);                                               \
    if (err__ != cudaSuccess) {                                               \
        fprintf(stderr, "CUDA Error at %s:%d\n", __FILE__, __LINE__);         \
        fprintf(stderr, "  code : %d\n", static_cast<int>(err__));           \
        fprintf(stderr, "  name : %s\n", cudaGetErrorName(err__));           \
        fprintf(stderr, "  msg  : %s\n", cudaGetErrorString(err__));         \
        std::exit(EXIT_FAILURE);                                              \
    }                                                                        \
} while (0) 


