#!/bin/bash
vms=("c6401" "c6402" "c6403")
horton_home="/home/costelradulescu/work/horton-works/"
version=$1
server=( $(find ${horton_home} -name "ambari-server*"$version"*.rpm" -type f) )
agent=( $(find ${horton_home} -name "ambari-agent*"$version"*.rpm" -type f) )
#metrics_monitor=( $(find ${horton_home} -name "ambari-metrics*monitor*.rpm" -type f) )
#metrics_collector=( $(find ${horton_home} -name "ambari-metrics*collector*.rpm" -type f) )
#metrics_sink=( $(find ${horton_home} -name "ambari-metrics*sink*.rpm" -type f) )
agent_script=$horton_home"scripts/setup-node.sh"
server_script=$horton_home"scripts/setup-server.sh"
kdc_script=$horton_home"scripts/install_kdc_centos.sh"
echo $server
echo $agent
for name in ${vms[0]} 
do
	path=vagrant@$name:/home/vagrant
	$(expect -c 'spawn scp '$server' '$server_script' '$kdc_script' '$path'
	     expect {
	     	-re ".*password*" {
			exp_send "vagrant\r"
				}
			}
		interact');
done
for name in ${vms[@]}
do
	path=vagrant@$name:/home/vagrant
	$(expect -c 'spawn scp '$agent' '$agent_script' '$path' 
	     expect {
	     	-re ".*password*" {
			exp_send "vagrant\r"
				}
			}
		interact');
done
