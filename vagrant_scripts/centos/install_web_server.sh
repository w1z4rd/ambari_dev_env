#!/bin/bash
sudo yum groupinstall "Web Server" -y
sudo cp /home/vagrant/httpd.conf /etc/httpd/conf/httpd.conf
sudo /sbin/service httpd restart
