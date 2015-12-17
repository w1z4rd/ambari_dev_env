#!/bin/bash
user_group=$(groups $(whoami) | sed 's/\s//g')
dir=`pwd`
# personal flavor tools (vim unzip)
sudo apt-get install -y dconf-cli
sudo apt-get install -y vim-nox
sudo apt-get install -y unzip
sudo apt-get install -y curl
# git
sudo apt-get install -y git
# java 7
#TODO: change to java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y oracle-java7-installer
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
# maven 3.0.5
sudo wget http://mirror.reverse.net/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz -O /tmp/apache-maven-3.0.5-bin.tar.gz
cd /tmp
sudo tar -xvzf /tmp/apache-maven-3.0.5-bin.tar.gz
sudo mv /tmp/apache-maven-3.0.5 /usr/local/
sudo update-alternatives --install /usr/bin/mvn mvn /usr/local/apache-maven-3.0.5/bin/mvn 1
# setting and maven java options
sudo echo 'JAVA_HOME="/usr/lib/jvm/java-7-oracle"' >> /etc/environment
sudo echo '_JAVA_OPTS="-Xmx2048m -XX:MaxPermSize=1024m -Djava.awt.headless=true"' >> /etc/environment
sudo echo 'MAVEN_OPTS="-Xms1024m -Xmx4096m -XX:PermSize=1024m"' >> /etc/environment
# python 2.7
wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea -O /tmp/setuptools-0.6c11-py2.7.egg
sudo sh /tmp/setuptools-0.6c11-py2.7.egg
sudo apt-get install -y python-dev
#TODO install python setuptools
# g++
sudo apt-get install -y g++
# rpm
sudo apt-get install -y rpm
# nodeJS
wget http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz -O /tmp/node-v0.10.31-linux-x64.tar.gz
tar -xzf /tmp/node-v0.10.31-linux-x64.tar.gz
sudo mv /tmp/node-v0.10.31-linux-x64 /usr/local/
sudo update-alternatives --install /usr/bin/node node /usr/local/node-v0.10.31-linux-x64/bin/node 1
sudo update-alternatives --install /usr/bin/npm npm /usr/local/node-v0.10.31-linux-x64/bin/npm 1
# brunch
sudo mkdir -p /usr/lib/node_modules
sudo chown $user_group -R /usr/lib/node_modules
sudo npm install -q brunch@1.7.17
# VirtualBox
sudo apt-get install -y VirtualBox
sudo apt-get install -y virtualbox-dkms
# vagrant
sudo apt-get install -y vagrant
cd $dir
