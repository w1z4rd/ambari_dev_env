#!/bin/bash
if [ $# -ne 1 ];
then
  echo "Usage ${0} <folder>"
  exit 1
fi
cd $1
mvn clean exec:exec -Dexec.executable="python" -Dexec.workingdir="src/test/python" -Dexec.args="unitTests.py false"
