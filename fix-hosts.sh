#!/bin/bash
hosts=""
if [[ "$1" == "kerb" ]]; then
	hosts="127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4\n::1         localhost localhost.localdomain localhost6 localhost6.localdomain6\n10.240.18.185   cradulescu-kerb-1.c.pramod-thangali.internal   cradulescu-kerb-1\n10.240.239.120   cradulescu-kerb-2.c.pramod-thangali.internal   cradulescu-kerb-2\n10.240.62.195   cradulescu-kerb-3.c.pramod-thangali.internal   cradulescu-kerb-3\n"
else
	hosts="127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4\n::1         localhost localhost.localdomain localhost6 localhost6.localdomain6\n10.240.186.43   cradulescu-1.c.pramod-thangali.internal   cradulescu-1\n10.240.79.82   cradulescu-2.c.pramod-thangali.internal   cradulescu-2\n10.240.246.132   cradulescu-3.c.pramod-thangali.internal   cradulescu-3\n"
fi
printf "$hosts" > /etc/hosts
