#!/bin/bash
vms=("u1201" "u1202" "u1203")
horton_home="/home/costel_radulescu/work/horton-works/"
version=$1
server=( $(find ${horton_home}"/workspace/clean-trunk" -name "ambari-server*"$version"*.deb" -type f) )
agent=( $(find ${horton_home}"/workspace/clean-trunk" -name "ambari-agent*"$version"*.deb" -type f) )
agent_script=$horton_home"scripts/setup-node-ubuntu.sh"
server_script=$horton_home"scripts/setup-server-ubuntu.sh"
kdc_script=$horton_home"scripts/install_kdc_ubuntu.sh"
vagrant_home=$horton_home"workspace/ambari-vagrant/ubuntu12.4/"
krb5_conf=$horton_home"scripts/krb5.conf"
kadm5_acl=$horton_home"scripts/kadm5.acl"
if [[ "$1" == "trunk" ]]; 
then
	server_script=$horton_home"scripts/setup-server-trunk-ubuntu.sh"
	agent_script=$horton_home"scripts/setup-node-trunk-ubuntu.sh"
	server=""
	agent=""
fi
for name in ${vms[0]} 
do
	path="vagrant@"$name":/home/vagrant"
	scp $server $server_script $kdc_script $krb5_conf $kadm5_acl $path
#	$(expect -c 'spawn scp '$server' '$server_script' '$kdc_script' '$krb5_conf' '$path'
#	     expect {
#	     	-re ".*password*" {
#			exp_send "vagrant\r"
#				}
#			}
#		interact');
done
for name in ${vms[@]}
do
	path="vagrant@"$name":/home/vagrant"
	scp $agent $agent_script $path
#	$(expect -c 'spawn scp '$agent' '$agent_script' '$path'
#	     expect {
#	     	-re ".*password*" {
#			exp_send "vagrant\r"
#				}
#			}
#		interact');
done
