set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(CMAKE_C_COMPILER aarch64-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER aarch64-linux-gnu-g++)
set(CMAKE_CUDA_COMPILER /usr/local/cuda-13.2/bin/nvcc)
set(CMAKE_CUDA_HOST_COMPILER aarch64-linux-gnu-g++)

set(CMAKE_CROSSCOMPILING_EMULATOR "qemu-aarch64-static;-L;/usr/aarch64-linux-gnu")

set(CMAKE_C_FLAGS "-mcpu=cortex-a78")
set(CMAKE_CXX_FLAGS "-mcpu=cortex-a78")

set(CMAKE_FIND_ROOT_PATH /usr/local/cuda-13.2/targets/sbsa-linux /usr/aarch64-linux-gnu)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_CUDA_ARCHITECTURES "87-real")
set(CMAKE_CUDA_FLAGS "-target-dir aarch64-linux")
set(CUDA_TOOLKIT_ROOT_DIR /usr/local/cuda-13.2)
set(CUDAToolkit_TARGET_DIR /usr/local/cuda-13.2/targets/sbsa-linux)
set(GGML_CUDA_CUB_3DOT2 OFF CACHE BOOL "Disable fetching CCCL from git" FORCE)
set(GGML_CPU_ARM_ARCH "armv8.2-a+fp16+dotprod" CACHE STRING "" FORCE)
set(GGML_NATIVE OFF CACHE BOOL "" FORCE)


