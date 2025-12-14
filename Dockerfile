FROM nvidia/cuda:12.8.0-devel-ubuntu24.04

# NVIDIA 설정
RUN mkdir -p /etc/modprobe.d && \
    echo 'options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerDefaultAC=0x1"' > /etc/modprobe.d/nvidia.conf

# 패키지 설치
RUN apt update && apt install -y \
    wget xvfb libsm6 libxrender1 libxext6 libgl1 \
    libglib2.0-0 libgomp1 libxi6 libxfixes3 xz-utils

# Blender 5.0
WORKDIR /opt
RUN wget https://mirrors.ocf.berkeley.edu/blender/release/Blender5.0/blender-5.0.0-linux-x64.tar.xz && \
    tar -xf blender-5.0.0-linux-x64.tar.xz && \
    rm blender-5.0.0-linux-x64.tar.xz

ENV PATH="/opt/blender-5.0.0-linux-x64:$PATH"
WORKDIR /workspace
