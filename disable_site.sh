#!/bash/bash
# this script takes the website name from the user and disables it
# exit code 0 : success

read -p "Enter the site name to be disabled: " WEBSITE

cd /etc/apache2/sites-available
a2dissite $WEBSITE.conf
echo "$WEBSITE was disabled successfully"

# reloading apache2 to effects are done
echo "restarting apache2 ..."
service apache2 reload
exit 0