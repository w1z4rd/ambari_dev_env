#!/bin/bash
sudo yum install -y ambari-server*.rpm
sudo ambari-server setup -s
sudo yum install unzip -y
sudo unzip -o -j -q /var/lib/ambari-server/resources/UnlimitedJCEPolicyJDK7.zip -d /usr/jdk64/jdk1.7.0_67/jre/lib/security/
sudo ambari-server start --debug
sudo ./install_kdc_centos.sh
