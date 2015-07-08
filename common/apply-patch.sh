#!/bin/bash
cd /home/costelradulescu/work/horton-works/workspace/ambari/
git diff trunk > ../final.patch
cd /home/costelradulescu/work/horton-works/workspace/backup-ambari/
git pull
cd ..
rm -rf clean-trunk/
cp -r backup-ambari/ clean-trunk/
cd clean-trunk/
git apply ../final.patch
