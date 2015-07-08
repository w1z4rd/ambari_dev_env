#!/bin/bash
sudo yum install mysql-server -y
sudo /sbin/service mysqld start
mysql -u root -e "create database oozie default character set utf8;
		  create user 'oozie'@'c6401.ambari.apache.org' identified by 'hadoop';
		  create user 'oozie'@'c6402.ambari.apache.org' identified by 'hadoop';
		  create user 'oozie'@'c6403.ambari.apache.org' identified by 'hadoop';
		  grant all on oozie.* to 'oozie'@'c6401.ambari.apache.org';
		  grant all on oozie.* to 'oozie'@'c6402.ambari.apache.org';
		  grant all on oozie.* to 'oozie'@'c6403.ambari.apache.org';
		  set password for 'root'@'localhost' = password('hadoop');
		  set password for 'root'@'127.0.0.1' = password('hadoop');
		  set password for 'root'@'c6401.ambari.apache.org' = password('hadoop');"
