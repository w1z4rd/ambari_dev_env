#!/bin/bash
yum install -y ambari-server*.rpm
ambari-server setup -s
./install_jce.sh
ambari-server start --debug
./install_kdc.sh
