#!/bin/bash
# This bash script file reads a the website name then removes the config file under /etc/apache2
# then the working directory is changed to be under /var/www to recursivly remove the directory of the hosted website
# exit code 0 : success
# exit code 1 : the config file doesn't exist
# exit code 2 : the directory of the website name doesn't exist  
 
read -p "Enter the site name : " WEBSITE

#### Checking the config file of the web site ####
if [[ -f "/etc/apache2/sites-available/$WEBSITE.conf" ]]
then
    echo "This config file exists on your filesystem."
    echo "Deleting ..."
    rm $WEBSITE.conf
else
    echo "Sorry we couldn't find the config file of the specified web site!"
    exit 1
fi

#### Checking if the directory exists under the /var/wwww path ####

if [[ -d /var/www/$WEBSITE ]]
then
    echo "/var/www/$WEBSITE exists on your filesystem."
    echo "Deleting ..."
    cd /var/www
    rm -R $WEBSITE
else
    echo "Sorry we couldn't find the directory of the hosted web site under /var/wwww"
    exit 2
fi

echo "$WEBSITE is successfully deleted"
exit 0