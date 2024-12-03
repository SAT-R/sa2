# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/ubuntu/.devcontainer/base.Dockerfile

# [Choice] Ubuntu version (use ubuntu-22.04 or ubuntu-18.04 on local arm64/Apple Silicon): ubuntu-22.04, ubuntu-20.04, ubuntu-18.04
ARG VARIANT
FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends binutils-arm-none-eabi \
     gcc-arm-none-eabi libpng-dev build-essential clang-format-13 xorg-dev \
     libsdl2-dev gcc-mingw-w64 texinfo flex bison gettext libgsl-dev libgmp3-dev \
     libmpfr-dev libmpc-dev zlib1g-dev autopoint cmake automake patch

WORKDIR /deps
RUN git clone https://github.com/SAT-R/agbcc.git && cd agbcc && ./build.sh

ENV PS2DEV=/usr/local/ps2dev

RUN mkdir -p $PS2DEV && chown -R $USER: $PS2DEV

ENV PS2DEV=/usr/local/ps2dev
ENV PS2SDK=$PS2DEV/ps2sdk
ENV GSKIT=$PS2DEV/gsKit
ENV PATH=$PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

RUN git clone https://github.com/ps2dev/ps2dev && cd ps2dev && ./build-all.sh
