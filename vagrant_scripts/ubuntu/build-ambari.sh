#!/bin/bash
cd /home/costel_radulescu/work/horton-works/workspace/clean-trunk
mvn versions:set -DnewVersion=$1 > /dev/null 2>&1
mvn -B clean install package jdeb:jdeb -DnewVersion=$1 -DskipTests -Dpython.ver="python >= 2.6" -Preplaceurl > /dev/null 2>&1
