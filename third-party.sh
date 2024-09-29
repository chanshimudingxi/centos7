#!/bin/sh

WORKPATH=$(dirname $(pwd))
echo "workpath: ${WORKPATH}"
THIRD_PARTY_PATH=${WORKPATH}/third-party
echo "third-party: ${THIRD_PARTY_PATH}"
BUILD_PATH=${WORKPATH}/build
echo "build: ${BUILD_PATH}"

#yum install -y zlib-static zlib-devel
#yum install -y openssl-static openssl-devel 

if [ ! -d ${THIRD_PARTY_PATH} ]; then
    mkdir -p ${THIRD_PARTY_PATH}
fi

if [ ! -d ${BUILD_PATH} ]; then
    mkdir -p ${BUILD_PATH}
fi

# zlib
cd ${THIRD_PARTY_PATH}
if [ ! -d zlib-1.2.11 ]; then
    wget https://nchc.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz
    tar -zxvf zlib-1.2.11.tar.gz
    cd zlib-1.2.11
else
    cd zlib-1.2.11
    make uninstall
    make clean
fi
./configure --prefix=/usr/local --static
make
make install

# openssl 
cd ${THIRD_PARTY_PATH}
if [ ! -d openssl-1.1.0f ]; then
    wget https://www.openssl.org/source/openssl-1.1.0f.tar.gz
    tar -zxvf openssl-1.1.0f.tar.gz
    cd openssl-1.1.0f
else
    cd openssl-1.1.0f
    make uninstall
    make clean
fi
./config -fPIC no-shared --openssldir=/usr/local/etc/ssl --prefix=/usr/local zlib no-dso
make
make install

# hiredis
cd ${THIRD_PARTY_PATH}
if [ ! -d hiredis ]; then
    git clone git@github.com:redis/hiredis.git
    cd hiredis
    git checkout -b v1.2.0 v1.2.0
else
    cd hiredis
    make uninstall
    make clean
fi
make PREFIX=${BUILD_PATH}
make PREFIX=${BUILD_PATH} install

# redis-plus-plus
cd ${THIRD_PARTY_PATH}
if [ ! -d redis-plus-plus ]; then
    git clone git@github.com:sewenew/redis-plus-plus.git
    cd redis-plus-plus
    git checkout -b 1.3.12 1.3.12
else
    cd redis-plus-plus
    make uninstall
    make clean
fi
if [ ! -d build ]; then
    mkdir -p build
fi
cd build
cmake3 -DCMAKE_PREFIX_PATH=${BUILD_PATH} -DCMAKE_INSTALL_PREFIX=${BUILD_PATH} -DREDIS_PLUS_PLUS_CXX_STANDARD=11 ..
make
make install

# curl
cd ${THIRD_PARTY_PATH}
if [ ! -d curl ]; then
    git clone git@github.com:curl/curl.git
    cd curl
    git checkout -b curl-8_10_0 curl-8_10_0
else
    cd curl
    make uninstall
    make clean
fi
autoreconf -fi
# export CPPFLAGS="-I/usr/include/openssl -I/usr/include"
# export LDFLAGS="-L/usr/lib64"
./configure --disable-shared --enable-static --without-libpsl --with-openssl --with-zlib --prefix=${BUILD_PATH}
make
make install

# spdlog
cd ${THIRD_PARTY_PATH}
if [ ! -d spdlog ]; then
    git clone git@github.com:gabime/spdlog.git
    cd spdlog
    git checkout -b v1.14.1 v1.14.1
fi
