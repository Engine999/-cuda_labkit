#ifndef CUDA_LABKIT_CUH
#define CUDA_LABKIT_CUH

#pragma once  // 헤더 중복 포함 방지 

#include <cuda_runtime.h>
#include <cstdio>
#include <cstdlib>
#include <chrono>

//00.cuda error 체크
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

//01.cuda kernel launch 에러 체크
#define CHECK_KERNEL_LAUNCH() \
do{                            \
    CHECK_CUDA(cudaGetLastError()); \
}while(0)

//02.cuda kernel 동기화 에러 체크 (커널 런타임 에러 체크)
#define CHECK_KERNEL_SYNC() \
do{                            \
    CHECK_CUDA(cudaGetLastError()); \
    CHECK_CUDA(cudaDeviceSynchronize()); \
}while(0)

#endif

