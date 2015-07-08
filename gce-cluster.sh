#!/bin/bash
version=$1
rpm_version=$version
if [ "$version" != "trunk" ]; then
	/home/costel_radulescu/work/horton-works/scripts/apply-patch.sh
	rpm_version=${version:0:5}"-"${version##*.}
	/home/costel_radulescu/work/horton-works/scripts/build-ambari.sh $version
fi
/home/costel_radulescu/work/horton-works/scripts/provision-vms-gce.sh $rpm_version $2
