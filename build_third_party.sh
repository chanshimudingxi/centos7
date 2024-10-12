#!/bin/sh

WORKPATH=$(dirname $(pwd))
#WORKPATH=$(pwd)
echo "workpath: ${WORKPATH}"
THIRD_PARTY_PATH=${WORKPATH}/third_party
echo "third_party: ${THIRD_PARTY_PATH}"
BUILD_PATH=${WORKPATH}/build
echo "build: ${BUILD_PATH}"

if [ ! -d ${THIRD_PARTY_PATH} ]; then
    mkdir -p ${THIRD_PARTY_PATH}
fi

if [ ! -d ${BUILD_PATH} ]; then
    mkdir -p ${BUILD_PATH}
fi

# hiredis
cd ${THIRD_PARTY_PATH}
if [ ! -d hiredis-1.2.0 ]; then
    wget https://github.com/redis/hiredis/archive/refs/tags/v1.2.0.tar.gz
    tar -zxvf v1.2.0.tar.gz
    cd hiredis-1.2.0
else
    cd hiredis-1.2.0
    make uninstall
    make clean
fi
make PREFIX=${BUILD_PATH}
make PREFIX=${BUILD_PATH} install

# redis-plus-plus
cd ${THIRD_PARTY_PATH}
if [ ! -d redis-plus-plus-1.3.12 ]; then
    wget https://github.com/sewenew/redis-plus-plus/archive/refs/tags/1.3.12.tar.gz
    tar -zxvf 1.3.12.tar.gz
    cd redis-plus-plus-1.3.12
else
    cd redis-plus-plus-1.3.12
    make uninstall
    make clean
fi
if [ ! -d build ]; then
    mkdir -p build
fi
cd build
cmake3 -DCMAKE_PREFIX_PATH=${BUILD_PATH} -DCMAKE_INSTALL_PREFIX=${BUILD_PATH} -DREDIS_PLUS_PLUS_CXX_STANDARD=11 -DREDIS_PLUS_PLUS_BUILD_SHARED=OFF ..
make
make install

# curl
cd ${THIRD_PARTY_PATH}
if [ ! -d  curl-8.5.0 ]; then
    wget https://github.com/curl/curl/releases/download/curl-8_5_0/curl-8.5.0.tar.gz
    tar -zxvf curl-8.5.0.tar.gz
    cd curl-8.5.0
else
    cd curl-8.5.0
    make uninstall
    make clean
fi
autoreconf -fi
# export CPPFLAGS="-I/usr/include/openssl -I/usr/include"
# export LDFLAGS="-L/usr/lib64"
# ./configure --disable-shared --enable-static --without-libpsl --with-openssl --with-zlib --prefix=${BUILD_PATH}
./configure --disable-dict --disable-pop3 --disable-imap --disable-smb --disable-smtp --disable-gopher --disable-mqtt --disable-manual --disable-ldap --disable-ldaps --disable-rtsp  --disable-tftp --disable-file --disable-ftp --disable-telnet  --disable-docs --without-zstd --with-openssl --prefix=${BUILD_PATH}
make
make install

# spdlog
cd ${THIRD_PARTY_PATH}
if [ ! -d spdlog ]; then
    wget https://github.com/gabime/spdlog/archive/refs/tags/v1.14.1.tar.gz
    tar -zxvf v1.14.1.tar.gz
    mv spdlog-1.14.1 spdlog
fi
