#!/usr/bin/env bash
# ==============================================================================
# audio.cpp Release Build Script for NVIDIA Jetson AGX Orin
# Target: JetPack 7.2.1 / CUDA 13.2 (aarch64, sm_87)
# Models: qwen3_asr + qwen3_tts
# ==============================================================================
set -euo pipefail

CUDA_PATH="${CUDA_PATH:-/usr/local/cuda}"
BUILD_DIR="${BUILD_DIR:-build-orin}"
INSTALL_DIR="${INSTALL_DIR:-/home/admin/s2st/audiocpp/bin}"

echo "======================================================================"
echo " Building audio.cpp for AGX Orin (JetPack 7.2.1 / CUDA 13.2)"
echo " Models: qwen3_asr, qwen3_tts | Arch: sm_87"
echo "======================================================================"

mkdir -p "$BUILD_DIR"

cmake -S . -B "$BUILD_DIR" \
  -DCMAKE_BUILD_TYPE=Release \
  -DENGINE_ENABLE_CUDA=ON \
  -DCUDAToolkit_ROOT="$CUDA_PATH" \
  -DCMAKE_CUDA_COMPILER="$CUDA_PATH/bin/nvcc" \
  -DCMAKE_CUDA_ARCHITECTURES="87-real" \
  -DAUDIOCPP_MODEL_SET=custom \
  -DAUDIOCPP_MODELS="qwen3_asr;qwen3_tts" \
  -DAUDIOCPP_DEPLOYMENT_BUILD=ON

echo "======================================================================"
echo " Compiling audiocpp_server and audiocpp_cli with $(nproc) threads..."
echo "======================================================================"

cmake --build "$BUILD_DIR" -j"$(nproc)" --target audiocpp_server audiocpp_cli

echo "Build complete!"
ls -lh "$BUILD_DIR/bin/"

if [ -d "$INSTALL_DIR" ]; then
    echo "Deploying binaries to $INSTALL_DIR..."
    cp -vf "$BUILD_DIR/bin/audiocpp_server" "$INSTALL_DIR/"
    cp -vf "$BUILD_DIR/bin/audiocpp_cli" "$INSTALL_DIR/"
    echo "Binaries deployed successfully."
fi

echo "======================================================================"
echo " Done! You can now restart audiocpp service with:"
echo "   sudo systemctl restart audiocpp.service"
echo "======================================================================"
