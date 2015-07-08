#!/bin/bash
sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos6/2.x/latest/2.0.0/ambari.repo 
sudo yum clean all
export HOME=~
if [ -e $HOME"/upgrade-ambari-server.sh" ]; then
	$HOME/upgrade-ambari-server.sh
fi
sudo ambari-agent stop
sudo yum upgrade ambari-agent ambari-log4j -y
sudo rpm -qa | grep ambari
if [ -e $HOME"/upgrade-ambari-server.sh" ]; then
	sudo ambari-server start
fi
sudo ambari-agent start 
