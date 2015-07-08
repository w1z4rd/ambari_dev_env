#!/bin/bash
sudo wget -O /etc/apt/sources.list.d/ambari.list http://dev.hortonworks.com.s3.amazonaws.com/ambari/ubuntu12/2.x/latest/trunk/ambari.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
sudo apt-get update
sudo apt-get -y install ambari-server
sudo ambari-server setup -s
sudo apt-get install unzip -y
sudo unzip -o -j -q /var/lib/ambari-server/resources/UnlimitedJCEPolicyJDK7.zip -d /usr/jdk64/jdk1.7.0_67/jre/lib/security/
sudo ambari-server start
