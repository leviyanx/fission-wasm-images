# Fission: WebAssembly Environement

## Usage

## Compiling

To build the runtime environment:

```bash
docker build -f Dockerfile . -t ${user}/wasm-env:${tag}
```

(`WasmEdge` folder is from https://github.com/WasmEdge/WasmEdge/releases)

To build the builder environment:

```bash
cd builder/ && docker build -f Dockerfile . -t ${user}/wasm-builder:${tag}
```

## Reference

The rust-code in example directory comes from https://github.com/second-state/wasm-learning.