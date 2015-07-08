#!/bin/bash
yum remove ambari-metrics-hadoop-sink -y
rm -rf /usr/lib/ambari-metrics-hadoop-sink/
rm -rf /usr/lib/ambari-metrics-kafka-sink/
rm -rf /usr/lib/flume/
rm -rf /usr/lib/storm/
yum install ambari-metrics-hadoop-sink-0.1.0-SNAPSHOT.x86_64.rpm -y
