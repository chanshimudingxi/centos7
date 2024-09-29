#!/bin/sh

# libmysqlclient.a
wget https://downloads.mysql.com/archives/get/p/19/file/mysql-connector-c-devel-6.1.10-1.el7.x86_64.rpm
rpm -ivh mysql-connector-c-devel-6.1.10-1.el7.x86_64.rpm

# mysql server
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-icu-data-files-8.0.39-1.el7.x86_64.rpm
rpm -ivh mysql-community-icu-data-files-8.0.39-1.el7.x86_64.rpm
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-client-plugins-8.0.39-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-plugins-8.0.39-1.el7.x86_64.rpm
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-libs-8.0.39-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-8.0.39-1.el7.x86_64.rpm
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-common-8.0.39-1.el7.x86_64.rpm
rpm -ivh mysql-community-common-8.0.39-1.el7.x86_64.rpm
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-client-8.0.39-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-8.0.39-1.el7.x86_64.rpm
wget https://cdn.mysql.com//Downloads/MySQL-8.0/mysql-community-server-8.0.39-1.el7.x86_64.rpm
rpm -ivh  mysql-community-server-8.0.39-1.el7.x86_64.rpm
