FROM ghcr.io/yangjuncode/go:1.21.13

#ref from https://github.com/yangjuncode/flutter-android-go-builder
LABEL org.opencontainers.image.source=https://github.com/yangjuncode/debian-go-mingw-builder

USER root

ARG cmake_version=3.31.1

RUN set -o xtrace \
    && apt-get update \
    && apt-get -y --allow-unauthenticated install ninja-build g++-mingw-w64-i686-posix  \
    gcc-mingw-w64-i686-posix g++-mingw-w64-x86-64-posix gcc-mingw-w64-x86-64-posix

RUN wget https://github.com/Kitware/CMake/releases/download/v${cmake_version}/cmake-${cmake_version}-linux-x86_64.tar.gz \
    && tar -xvf cmake-${cmake_version}-linux-x86_64.tar.gz  -C /usr/local \ 
    && rm -rf /usr/local/cmake-${cmake_version}-linux-x86_64/doc/ \
    && rm -rf /usr/local/cmake-${cmake_version}-linux-x86_64/man/ \   
    && rm cmake-${cmake_version}-linux-x86_64.tar.gz

ENV PATH="$PATH:/usr/local/cmake-${cmake_version}-linux-x86_64/bin"