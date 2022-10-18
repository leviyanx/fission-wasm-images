#!/bin/sh
echo "start building"

# check dir
echo "src path: ${SRC_PKG}"
pwd
ls -l

# if exist "__MACOSX" (archive with macos), remove it; else don't need to this step
if [ -d "__MACOSX"]; then
    rm -rf __MACOSX
fi

# enter source dir``
cd */ || cd hello
# check source dir
ls -l

# print file in src
ls src

# build
cargo build --target wasm32-wasi
# print build result
ls -l
ls target/wasm32-wasi/debug/

cp ./target/wasm32-wasi/debug/*.wasm ${DEPLOY_PKG}

echo "finish building"