#!/bin/bash
if [ $# -ne 2 ]; then
  echo ""
  echo "=========================================================="
  echo " Usage: build-ambari.sh <version> <project dir>"
  echo " Example: build-ambari.sh 2.0.0.0 /path/to/ambari/project"
  echo "=========================================================="
  echo ""
  exit 1;
fi
dir=$2
cd $dir
git clean -fxd;
mvn versions:set -DnewVersion=$1
cd ambari-metrics
mvn versions:set -DnewVersion=$1
mvn clean install package -Dbuild-rpm -DskipTests
cd ..
mvn -B clean install package rpm:rpm -DnewVersion=$1 -DskipTests -Dpython.ver="python >= 2.6" -Preplaceurl
