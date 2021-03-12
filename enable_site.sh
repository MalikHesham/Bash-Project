#!/bash/bash
# the following line reads the requried website to be activated
# exit code 0 : success

read -p "Enter the site name to be enabled: " WEBSITE

#changing directory to /etc/apache2 and then enabling the site
cd /etc/apache2/sites-available
a2ensite $WEBSITE.conf

echo "$WEBSITE was enabled successfully"
echo "restarting apache2 ..."

service apache2 reload
exit 0