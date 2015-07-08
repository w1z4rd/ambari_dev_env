#!/bin/bash
vers="trunk"
if [ "$vers" == "trunk" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/centos6/2.x/latest/trunk/ambari.repo
fi
if [ "$vers" == "2.0" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos6/2.x/latest/2.0.0/ambari.repo 
fi
if [ "$vers" == "1.7" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo 
fi
if [ "$vers" == "1.7.1" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.1/ambari.repo 
fi
if [ "$vers" == "1.6" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo 
fi
if [ "$vers" == "1.6.1" ]; then
  sudo wget -O /etc/yum.repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.1/ambari.repo 
fi
sudo yum clean all
sudo yum --disablerepo="epel" update nss -y
sudo yum install -y ambari-agent
sudo sed -i 's/localhost/192.168.64.101/g' /etc/ambari-agent/conf/ambari-agent.ini
sudo ambari-agent start
