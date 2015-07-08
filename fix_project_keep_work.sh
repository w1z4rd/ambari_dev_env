#!/bin/bash
git clean -fxd;
for file in `find . -name "pom.xml"`; do
  git checkout $file
done
