#!/bin/sh

# jemalloc
if [ ! -d jemalloc-5.3.0 ]; then
    wget https://github.com/jemalloc/jemalloc/archive/refs/tags/5.3.0.tar.gz
    tar -zxvf 5.3.0.tar.gz
    cd jemalloc-5.3.0
else
    cd jemalloc-5.3.0
    make uninstall
    make clean
fi
sh autogen.sh
./configure --prefix=/usr/local
make
make install

# redis
if [ ! -d redis-6.0.20 ]; then
    wget https://github.com/redis/redis/archive/refs/tags/6.0.20.tar.gz
    tar -zxvf 6.0.20.tar.gz
    cd redis-6.0.20
else
    cd redis-6.0.20
    make uninstall
    make clean
fi
scl enable devtoolset-8 bash
make PREFIX=/usr/local
make install
cp redis.conf /usr/local/etc/redis.conf
exit