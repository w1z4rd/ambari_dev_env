#!/bin/bash
#sudo wget -O /etc/zypp/repos.d/ambari.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/suse11/2.x/latest/trunk/ambari.repo
sudo wget -O /etc/zypp/repos.d/ambari.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/suse11/2.x/latest/2.0.0/ambari.repo 
#sudo wget -O /etc/zypp/repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/suse11/1.x/updates/1.7.0/ambari.repo 
sudo zypper --non-interactive install epel-release 
sudo zypper --non-interactive clean all
sudo zypper --non-interactive --disablerepo="epel" update nss 
sudo zypper --non-interactive install  ambari-agent
sudo sed -i 's/localhost/192.168.11.101/g' /etc/ambari-agent/conf/ambari-agent.ini
sudo /etc/init.d/ambari-agent start
