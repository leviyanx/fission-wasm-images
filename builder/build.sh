#!/bin/sh
set -euxo pipefail

srcDir=/usr/src/$(basename ${SRC_PKG})

if [ -d ${SRC_PKG} ]; then
    echo "Building in directory ${scrDir}"
    ln -sf ${SRC_PKG} ${srcDir}
elif [ -f ${SRC_PKG} ]; then
    # only file
    echo "Building file ${SRC_PKG} in ${srcDir}"
    mkdir -p ${srcDir}
    cp ${SRC_PKG} ${srcDir}/function.rs
fi

cd ${srcDir}

# function
rustc +nightly --target wasm32-unknown-unknown -O function.rs

cp function.wasm ${DEPLOY_PKG}
