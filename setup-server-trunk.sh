#!/bin/bash
sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/centos6/2.x/latest/trunk/ambari.repo
#sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos6/2.x/latest/2.0.0/ambari.repo 
#sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo 
sudo yum install -y ambari-server
sudo ambari-server setup -s --jdbc-db=mysql --jdbc-driver=/home/vagrant/mysql-connector-java-5.1.34-bin.jar
sudo ambari-server setup -s
sudo yum install unzip -y
sudo unzip -o -j -q /var/lib/ambari-server/resources/UnlimitedJCEPolicyJDK7.zip -d /usr/jdk64/jdk1.7.0_67/jre/lib/security/
sudo ambari-server start
