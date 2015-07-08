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
sudo yum install -y ambari-server
sudo ambari-server setup -s
sudo yum install unzip -y
#TODO make this if from v2.1 forward!
if [ "$vers" == "trunk" ]; then
  sudo unzip -o -j -q /var/lib/ambari-server/resources/jce_policy-8.zip -d /usr/jdk64/jdk1.8.0_40/jre/lib/security/
else
  sudo unzip -o -j -q /var/lib/ambari-server/resources/UnlimitedJCEPolicyJDK7.zip -d /usr/jdk64/jdk1.7.0_67/jre/lib/security/
fi
sudo ambari-server start --debug
