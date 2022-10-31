#!/bin/sh
echo "start building"

# test deploy src
cd /packages
ls -l
echo "deploy path: ${DEPLOY_PKG}"
cd ${DEPLOY_PKG}
ls -l

cd ${SRC_PKG}

# check dir
echo "src path: ${SRC_PKG}"
echo "current path:" && pwd
ls -l

# if exist "__MACOSX" (archive with macos), remove it; else don't need to this step
if [ -d "__MACOSX"]; then
    rm -rf __MACOSX
fi

# enter source dir
cd */ || cd hello
# check source dir
ls -l

# build
cargo build --target wasm32-wasi
# print build result
ls -l target/wasm32-wasi/debug/

cp ./target/wasm32-wasi/debug/*.wasm ${DEPLOY_PKG}
echo "deploy path: ${DEPLOY_PKG}"
ls -l ${DEPLOY_PKG}

echo "finish building"