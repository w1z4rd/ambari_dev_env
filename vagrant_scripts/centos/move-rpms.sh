#!/bin/bash
cd /opt/ambari-vagrant/centos6.4/
rm *.rpm
cd /home/costelradulescu/work/horton-works/workspace/clean-trunk/
for file in `find . -name "*.rpm" -type f`; do
  cp -v $file /opt/ambari-vagrant/centos6.4/
done

