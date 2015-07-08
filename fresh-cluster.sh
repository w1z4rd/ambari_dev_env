#!/bin/bash
version=$1
cd /home/costel_radulescu/work/horton-works/workspace/ambari-vagrant/centos6.4/
vagrant destroy -f
rpm_version=$version
if [ "$version" != "trunk" ]; then
	/home/costel_radulescu/work/horton-works/scripts/apply-patch.sh
	rpm_version=${version:0:5}"-"${version##*.}
	/home/costel_radulescu/work/horton-works/scripts/build-ambari.sh $version ~/work/horton-works/workspace/clean-trunk
fi
/home/costel_radulescu/work/horton-works/scripts/setup-cluster.sh $rpm_version
