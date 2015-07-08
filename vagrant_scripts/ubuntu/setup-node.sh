#!/bin/bash
sudo wget -O /etc/apt/sources.list.d/ambari.list http://dev.hortonworks.com.s3.amazonaws.com/ambari/ubuntu12/2.x/latest/trunk/ambari.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
sudo apt-get update
sudo dpkg -i ambari-agent*.deb
sudo apt-get install -f -y
sudo sed -i 's/localhost/192.168.12.101/g' /etc/ambari-agent/conf/ambari-agent.ini
sudo ambari-agent start
