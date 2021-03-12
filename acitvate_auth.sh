#!/bin/bash
# this bash script is used to activated website visiting authentication
# exit code 0 : success
read -p "Enter the site name : " WEBSITE
read -p "Enter the host name : " HOSTURL

NAME=/var/www/$WEBSITE
#### apache2 utils were required for the job to be done
echo "installing apache2 utils ..."

sudo apt-get update
sudo apt-get install apache2-utils

#### creating the .htpasswd
touch $NAME/.htpasswd
### read the user name required for logging in
read -p "Kindly enter the user name : " LOGINNAME
htpasswd $NAME/.htpasswd $LOGINNAME

# copies and replaces the dummy data with the real data that was prompted from the user
cp default_vhostwithAuth.conf /etc/apache2/sites-available/${WEBSITE}withAuth.conf
sed -i "s/example.local/$WEBSITE/g" /etc/apache2/sites-available/${WEBSITE}withAuth.conf
sed -i "s/127.0.0.x/$HOSTURL/g" /etc/apache2/sites-available/${WEBSITE}withAuth.conf
sed -i "s|example.dir|$NAME|g" /etc/apache2/sites-available/${WEBSITE}withAuth.conf

cp default_htaccess $NAME/.htaccess
cd $NAME
sed -i "s|example.dir|$NAME|g" .htaccess
echo "authentication is activated successfully you now will need to login with password"

echo "restarting apache2 ..."
service apache2 reload
exit 0