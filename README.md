# WASM Environment Example

## Usage

## Compiling

To build the runtime environment:

```bash
docker build -f Dockerfile . -t ${user}/wasm-env:${tag}
```

env image dockerfile: `WasmEdge` folder is from https://github.com/WasmEdge/WasmEdge/releases

To build the builder environment:

```bash
cd builder/ && docker build -f Dockerfile . -t ${user}/wasm-builder:${tag}
```