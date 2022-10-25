## Fission builder base image
ARG RUST_BASE_IMG=latest
ARG BUILDER_IMAGE=fission/builder:latest
FROM ${BUILDER_IMAGE}

# install rust
FROM rust:${RUST_BASE_IMG}

# Add build environment (wasm32)
RUN rustup toolchain install nightly \
    && rustup target add wasm32-wasi

## Fission builder specific section
COPY --from=0 /builder /builder
ADD build.sh /usr/local/bin/build
RUN chmod +x /usr/local/bin/build