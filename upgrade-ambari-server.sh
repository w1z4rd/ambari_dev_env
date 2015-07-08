#!/bin/bash
sudo ambari-server stop
sudo yum upgrade ambari-server ambari-log4j -y
sudo rpm -qa | grep ambari
sudo ambari-server upgrade
