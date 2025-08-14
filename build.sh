#!/bin/sh
set -e

POWERSYNC_CORE_VERSION="0.4.4"
SQLITE_PATH="sql.js"

if [ -d "$SQLITE_PATH" ]; then
  echo "Deleting existing clone"
  rm -rf $SQLITE_PATH
fi

git clone --filter=blob:none https://github.com/sql-js/sql.js.git $SQLITE_PATH
cd $SQLITE_PATH

# Main version as of 2024-10-01
git checkout 52e5649

git apply ../patches/*
mkdir -p powersync-libs
curl -L -o powersync-libs/libpowersync-wasm.a "https://github.com/powersync-ja/powersync-sqlite-core/releases/download/v${POWERSYNC_CORE_VERSION}/libpowersync-wasm.a"

make 

cd ../
mkdir -p dist
cp -r $SQLITE_PATH/dist/* dist/
