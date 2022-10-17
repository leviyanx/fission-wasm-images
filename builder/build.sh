#!/bin/sh
# cd ${SRC_PKG}
echo "start building"
cargo build --target wasm32-wasi
cp ${SRC_PKG}/target/wasm32-wasi/debug/*.wasm ${DEPLOY_PKG}
echo "finish building"