## Fission builder base image
ARG BUILDER_IMAGE=fission/builder:latest
FROM ${BUILDER_IMAGE}

## Build rust environment
FROM ubuntu:20.04

# install rust
RUN apt-get update \
    && apt-get install -y build-essential curl vim\
    && curl https://sh.rustup.rs -sSf | bash -s -- -y

ENV PATH="/root/.cargo/bin:${PATH}"

# Add wasm32 environment
RUN rustup toolchain install nightly \
    && rustup target add wasm32-unknown-unknown --toolchain nightly

## Fission builder specific section
ADD build.sh /usr/local/bin/build
