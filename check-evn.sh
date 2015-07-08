#!/bin/bash
echo "=========Ambari tools versions============"
java -version
echo "======="
mvn --version
echo "======="
python -V
echo "======="
echo "Node "`node -v`
echo "======="
echo "npm "`npm -v`
echo "======="
echo "brunch "`brunch --version`
echo "======="
echo `virtualbox -help | grep -i manager`
echo "======="
vagrant -v
