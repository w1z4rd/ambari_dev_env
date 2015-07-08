#!/bin/bash
if [ -e ~/"setup-server.sh" ]; then
	~/setup-server.sh
fi
sudo yum install vim -y
sudo wget -O /etc/yum.repos.d/ambari.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos6/2.x/latest/trunk/ambari.repo
sudo yum install epel-release -y
sudo yum clean all
sudo yum --disablerepo="epel" update nss -y
sudo yum install ambari-agent*.rpm -y
sudo sed -i 's/localhost/192.168.64.101/g' /etc/ambari-agent/conf/ambari-agent.ini
sudo ambari-agent start
