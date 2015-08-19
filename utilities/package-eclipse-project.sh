#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Usage: ${0} <archive-name> <path-to-project>"
  exit 1;
fi
$(tar -czf $1 $2 --exclude="target" --exclude=".git" --exclude=".gitignore" --exclude=".classpath" --exclude=".project" --exclude=".settings")
