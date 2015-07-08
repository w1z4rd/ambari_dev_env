#!/bin/sh

# Remove packages
echo "Removing Kerberos Packages"
sudo apt-get remove -y krb5-kdc krb5-admin-server --purge

# Install packages
echo "Installing Kerberos Packages"
sudo apt-get install -y krb5-kdc krb5-admin-server
sudo dpkg-reconfigure krb5-kdc
sudo dpkg-reconfigure krb5-admin-server
sudo apt-get install -y chkconfig
# #################################
# Assming default configuration!!!!
# #################################

# Create krb5.conf file
HOSTNAME=`hostname`
echo "Creating krb5.conf file, assuming KDC host is ${HOSTNAME}"
cat >~/krb5.conf <<EOF
[libdefaults]
	default_realm = EXAMPLE.COM

[realms]
	EXAMPLE.COM = {
		kdc = ${HOSTNAME} 
		admin_server = ${HOSTNAME}
	}

[domain_realm]
	${HOSTNAME} = EXAMPLE.COM
	.${HOSTNAME} = EXAMPLE.COM

[login]
	krb4_convert = false 
	krb4_get_tickets = false

[logging]
  default = FILE:/var/log/krb5libs.log
EOF

sudo cp ~/krb5.conf /etc/krb5.conf
sudo cat >~/kadm5.acl <<EOF
*/admin@EXAMPLE.COM	*
EOF
sudo cp ~/kadm5.acl /etc/krb5kdc/kadm5.acl 
# Create KDC database
echo "Created KDC database, this could take some time"
sudo kdb5_util create -s -P hadoop

# Create admistrative user
echo "Creating administriative account:"
echo "  principal:  admin/admin"
echo "  password:   hadoop"
sudo kadmin.local -q 'addprinc -pw hadoop admin/admin'

# Starting services
echo "Starting services"
sudo /etc/init.d/krb5-kdc restart
sudo /etc/init.d/krb5-admin-server restart

sudo chkconfig krb5-kdc on
sudo chkconfig krb5-admin-server on
