#!bin/bash
#this script reads the name of a website directory and the hosted url and then deactivate the authentication
#exit code 0 : success
read -p "Enter the site name : " WEBSITE
read -p "Enter the host name : " HOSTURL

NAME=/var/www/$WEBSITE

#### the following lines remove the /etc/apache2/sites-enabled/<site name>withAuth.config
#### remove the .htaccess and the .htpasswd files related to the given website name under /var/www/name
rm /etc/apache2/sites-available/${WEBSITE}withAuth.conf
rm $NAME/.htaccess $NAME/.htpasswd

echo "restarting apache2 ..."
service apache2 reload
echo "authentication was deactivated successfully"
exit 0

