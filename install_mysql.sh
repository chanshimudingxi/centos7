#!/bin/sh

# mysql8.0.14
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-libs-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-common-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-devel-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-client-8.0.14-1.el7.x86_64.rpm
wget https://cdn.mysql.com/archives/mysql-8.0/mysql-community-server-8.0.14-1.el7.x86_64.rpm
rpm -ivh mysql-community-*.rpm


# mysql5.6.51
wget https://repo.mysql.com/yum/mysql-5.6-community/el/7/x86_64/mysql-community-libs-5.6.51-2.el7.x86_64.rpm
wget https://repo.mysql.com/yum/mysql-5.6-community/el/7/x86_64/mysql-community-common-5.6.51-2.el7.x86_64.rpm
wget https://repo.mysql.com/yum/mysql-5.6-community/el/7/x86_64/mysql-community-devel-5.6.51-2.el7.x86_64.rpm
