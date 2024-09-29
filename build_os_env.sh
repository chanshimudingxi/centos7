#!/bin/sh

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
yum install -y wget git vim net-tools tcpdump make cmake3 automake libtool m4 autoconf
yum install -y devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-binutils


