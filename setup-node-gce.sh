#!/bin/bash
#printf "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4\n::1         localhost localhost.localdomain localhost6 localhost6.localdomain6\n10.240.101.39   cradulescu-1.c.pramod-thangali.internal   cradulescu-1\n10.240.193.222   cradulescu-2.c.pramod-thangali.internal   cradulescu-2\n10.240.244.10   cradulescu-3.c.pramod-thangali.internal   cradulescu-3\n" > /etc/hosts
if [ -e "/root/setup-server-gce.sh" ]; then
	/root/setup-server-gce.sh
fi
#sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/centos6/2.x/latest/trunk/ambari.repo
sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://s3.amazonaws.com/dev.hortonworks.com/ambari/centos6/2.x/latest/2.0.0/ambari.repo 
#sudo wget -O /etc/yum.repos.d/ambari-dev.repo http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.7.0/ambari.repo
yum install epel-release -y
yum clean all
yum --disablerepo="epel" update nss -y
yum install -y ambari-agent*.rpm
sed -i 's/localhost/10.240.202.90/g' /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start
