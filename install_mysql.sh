#!/bin/sh

# mysql server
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-libs-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-common-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-devel-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-client-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-server-8.0.14-1.el7.x86_64.rpm
rpm -ivh mysql-community-*.rpm