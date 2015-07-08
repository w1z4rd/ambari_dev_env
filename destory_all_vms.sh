#!/bin/bash
cd /home/costel_radulescu/work/horton-works/workspace/ambari-vagrant
OSes=( "centos5.8" "centos5.9" "centos6.4" "centos6.5" "ubuntu12.4" "win7" "trunk_centos" "trunk_ubuntu" "suse11" )
for dir in ${OSes[@]}; do
       	cd $dir 
	vagrant destroy -f
	cd ..
done
