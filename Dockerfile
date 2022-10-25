FROM golang:1.16-alpine

WORKDIR /wasm
COPY *.go /wasm/

# link for server
RUN go mod init github.com/leviyanx/wasm
RUN go mod tidy

RUN go build -o server .

FROM alpine:3.14

WORKDIR /app

RUN apk update
RUN apk add --no-cache coreutils binutils findutils grep curl git bash
# Add wasmedge (wasm runtime)
RUN curl -sSf https://gitee.com/leviyanx/WasmEdge/raw/master/utils/install.sh | bash

COPY --from=0 /wasm/server /app/server

EXPOSE 8888
ENTRYPOINT ["./server"]