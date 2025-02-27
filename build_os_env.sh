#!/bin/sh

# must be root

mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache all

mv /etc/yum.repos.d/epel-7.repo /etc/yum.repos.d/epel-7.repo.backup
curl -o /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
yum makecache all

mv /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo /etc/yum.repos.d/CentOS-SCLo-scl-rh.repo.backup
mv /etc/yum.repos.d/CentOS-SCLo-scl.repo /etc/yum.repos.d/CentOS-SCLo-scl.repo.backup
cp CentOS-SCLo-rh.repo /etc/yum.repos.d/CentOS-SCLo-rh.repo
cp RPM-GPG-KEY-CentOS-SIG-SCLo /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-SCLo
yum clean all
yum makecache
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7 

yum update -y 
yum install -y gcc gcc-c++ glibc-static libstdc++-static
yum install -y zlib-static zlib-devel
yum install -y openssl-static openssl-devel 
yum install -y mysql-devel
yum install -y wget git vim net-tools tcpdump make cmake3 automake libtool m4 autoconf mlocate
yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-gdb devtoolset-8-binutils devtoolset-8-libasan-devel

# zlib
# yum -y remove zlib zlib-devel
# cd ${THIRD_PARTY_PATH}
# if [ ! -d zlib-1.2.11 ]; then
#     wget https://nchc.dl.sourceforge.net/project/libpng/zlib/1.2.11/zlib-1.2.11.tar.gz
#     tar -zxvf zlib-1.2.11.tar.gz
#     cd zlib-1.2.11
# else
#     cd zlib-1.2.11
#     make uninstall
#     make clean
# fi
# ./configure --prefix=/usr/local --static
# make
# make install

# # openssl
# # remove old openssl 1.0.2
# yum -y remove openssl openssl-devel
# # install OpenSSL dependencies
# yum -y groupinstall "Development Tools"
# # download new openssl (1.1.0f->1.1.1n)
# cd ${THIRD_PARTY_PATH}
# if [ ! -d openssl-1.1.1n ]; then
#     wget https://www.openssl.org/source/openssl-1.1.1n.tar.gz
#     tar -zxvf openssl-1.1.1n.tar.gz
#     cd openssl-1.1.1n
# else
#     cd openssl-1.1.1n
#     make uninstall
#     make clean
# fi
# ./config --openssldir=/usr/etc/openssl --prefix=/usr
# make -j4
# make install


