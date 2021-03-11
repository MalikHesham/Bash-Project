#!/bin/bash
#script for uninstalling apache2 web server if it is installed on the machine
#the script checks first if there is a version of apache2 before executing the uninstallation
# exit : success code 0
OUTPUT="$(which apache2)"
if [ -z "$OUTPUT" ]
then echo "apache2 was not found on this device"
exit
else echo "stopping the apache2 service ..."
fi

sudo service apache2 stop  
sudo apt-get purge apache2 apache2-utils apache2-bin apache2.2-common
### this following directory is dependent on the linux distro and I found it using the command whereis apache2
sudo rm -rf /usr/share/apache2
echo "apache2 removed successfully"

exit 0