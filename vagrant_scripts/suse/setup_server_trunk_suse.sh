#!/bin/bash
#sudo wget -O /etc/zypp/repos.d/ambari.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/suse11/2.x/latest/trunk/ambari.repo
sudo wget -O /etc/zypp/repos.d/ambari.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/suse11/2.x/latest/2.0.0/ambari.repo 
#sudo wget -O /etc/zypp/repos.d/ambari.repo http://public-repo-1.hortonworks.com/ambari/suse11/1.x/updates/1.7.0/ambari.repo 
sudo zypper --non-interactive install ambari-server
sudo /etc/init.d/ambari-server setup -s --jdbc-db=mysql --jdbc-driver=/home/vagrant/mysql-connector-java-5.1.34-bin.jar
sudo /etc/init.d/ambari-server setup -s
sudo zypper --non-interactive install unzip 
sudo unzip -o -j -q /var/lib/ambari-server/resources/UnlimitedJCEPolicyJDK7.zip -d /usr/jdk64/jdk1.7.0_67/jre/lib/security/
sudo /etc/init.d/ambari-server start --debug
