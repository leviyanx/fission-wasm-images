## Fission builder base image
ARG BUILDER_IMAGE=fission/builder:latest
FROM ${BUILDER_IMAGE}

## Build rust environment
FROM ubuntu:20.04

# install rust
RUN apt-get update \
    && apt-get install -y build-essential curl vim git\
    && curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

# Add build environment (wasm32)
RUN rustup toolchain install nightly \
    && rustup target add wasm32-wasi

# Add wasmedge (wasm runtime)
RUN curl -sSf https://gitee.com/leviyanx/WasmEdge/raw/master/utils/install.sh | bash

# Add example (rust code)
ADD cli /root/cli

## Fission builder specific section
ADD build.sh /usr/local/bin/build