#!/bin/bash
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

function printHeader {
  echo "#####"
  echo "# "$1
  echo "#####"
}

printHeader "stopping ambari-server"
ambari-server stop

printHeader "stopping ambari-agent"
ambari-agent stop

printHeader "stopping ambari-metrics-monitor"
ambari-metrics-monitor stop

printHeader "stopping ambari-metrics-collector"
ambari-metrics-collector stop

printHeader "adding trunk repository"
wget -O /etc/yum.repos.d/ambari.repo http://dev.hortonworks.com.s3.amazonaws.com/ambari/centos6/2.x/latest/trunk/ambari.repo
yum clean all

printHeader "upgrading artifacts"
yum -y upgrade ambari-server ambari-log4j ambari-agent ambari-metrics-collector ambari-metrics-monitor ambari-metrics-hadoop-sink

printHeader "list of installed ambari artifacts"
rpm -qa | grep ambari

printHeader "running ambari-server upgrade"
ambari-server upgrade

printHeader "starting ambari-metrics-monitor"
ambari-metrics-monitor start

printHeader "starting ambari-metrics-collector"
ambari-metrics-collector start

printHeader "starting ambari-server"
ambari-server start --debug

printHeader "starting ambari-agent"
ambari-agent start

