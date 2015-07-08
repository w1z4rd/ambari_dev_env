#!/bin/bash
if [ $# -lt 1 ];
then
  echo "======================"
  echo "Usage: "
  echo "${0} <patch>"
  echo "======================"
  exit 1
fi
patch_name=$(basename "${1}")
patch_sufix=${patch_name##*.}
patch_sufix="."$patch_sufix
dir_name=${patch_name%%${patch_sufix}}
cd /home/costelradulescu/work/horton-works/workspace/backup-ambari/
git pull
cd ..
rm -rf $dir_name
cp -r backup-ambari/ $dir_name
cd $dir_name 
git apply $1
