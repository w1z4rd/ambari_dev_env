#!/bin/bash
hosts=("cradulescu-1" "cradulescu-2" "cradulescu-3")
for host in ${hosts[@]} 
do
	echo $host
	ssh-keygen -f $HOME"/.ssh/known_hosts" -R $host 
done
