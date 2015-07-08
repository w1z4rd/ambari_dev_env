#!/bin/bash
path="/opt/ambari-vagrant/centos6.4/"
cd $path
vagrant destroy -f
vagrant up c6401 c6402 c6403
provision-vms.sh $1
