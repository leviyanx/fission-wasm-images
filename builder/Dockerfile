## Fission builder base image
ARG BUILDER_IMAGE=fission/builder:latest
FROM ${BUILDER_IMAGE}

## Build rust environment
# FROM ubuntu:20.04

# install rust
RUN apk update && apk upgrade\
    && apk add git vim bash curl\
    && curl https://sh.rustup.rs -sSf | bash -s -- -y
    # && source "/root/.cargo/env"

ENV PATH="/root/.cargo/bin:${PATH}"

# Add build environment (wasm32)
RUN rustup toolchain install nightly \
    && rustup target add wasm32-wasi

# Add wasmedge (wasm runtime)
# RUN curl -sSf https://gitee.com/leviyanx/WasmEdge/raw/master/utils/install.sh | bash

# Add example (rust code)
ADD cli /root/cli

## Fission builder specific section
ADD build.sh /usr/local/bin/build
ENV PATH="/usr/local/bin/build:${PATH}"
EXPOSE 8001