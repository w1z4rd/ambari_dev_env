#!/bin/bash
vms=("cradulescu-1" "cradulescu-2" "cradulescu-3")
if [[ "$2" == "kerb" ]]; then
	vms=("cradulescu-kerb-1" "cradulescu-kerb-2" "cradulescu-kerb-3")
fi
horton_home="/home/costel_radulescu/work/horton-works/"
version=$1
server=( $(find ${horton_home} -name "ambari-server*"$version"*.rpm" -type f) )
agent=( $(find ${horton_home} -name "ambari-agent*"$version"*.rpm" -type f) )
metrics_monitor=( $(find ${horton_home} -name "ambari-metrics*monitor*.rpm" -type f) )
metrics_collector=( $(find ${horton_home} -name "ambari-metrics*collector*.rpm" -type f) )
metrics_sink=( $(find ${horton_home} -name "ambari-metrics*sink*.rpm" -type f) )
agent_script=$horton_home"scripts/setup-node-gce.sh"
server_script=$horton_home"scripts/setup-server-gce.sh"
update_sink=$horton_home"scripts/update-hadoop-sink.sh"
key=$horton_home"keys/gce-key"
jce=$horton_home"scripts/install_jce.sh"
kdc=$horton_home"scripts/install_kdc.sh"
hosts=$horton_home"scripts/fix-hosts.sh"
mysql_connector=$horton_home"files/mysql-connector-java-5.1.34-bin.jar"
mysql_install=$horton_home"scripts/install_mysql_server_centos.sh"
if [[ "$1" == "trunk" ]]; 
then
	server_script=$horton_home"scripts/setup_server_trunk_centos.sh"
	agent_script=$horton_home"scripts/setup_node_trunk_centos.sh"
	server=""
	agent=""
	update_sink=""
	metrics_collector=""
	metrics_sink=""
	metrics_monitor=""
fi
for name in ${vms[0]} 
do
	path=root@$name:/root
	scp -i $key $server $server_script $jce $kdc $mysql_connector $path 
done
for name in ${vms[@]}
do
	path=root@$name:/root
	scp -i $key $agent $agent_script $metrics_monitor $metrics_collector $metrics_sink $update_sink $hosts $path
done
