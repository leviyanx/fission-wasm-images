FROM ubuntu:20.04 AS base
WORKDIR /
RUN apt update && apt install -y ca-certificates && rm -rf /var/lib/apt/lists/*

# wasm runtime environment
# WasmEdge from https://github.com/WasmEdge/WasmEdge/releases
COPY ./WasmEdge /root/.wasmedge
ENV PATH="/root/.wasmedge/bin:${PATH}"

## compile server
FROM golang:latest AS builder

ENV GOPATH /usr
ENV APP    ${GOPATH}/src/github.com/leviyanx/wasm

WORKDIR ${APP}

COPY *.go ${APP}

RUN go mod init
RUN go mod tidy
RUN go build -o server . && cp server /

## setup server
FROM base
COPY --from=builder /server /

ENTRYPOINT ["/server"]
EXPOSE 8888