#!/bin/bash


read -p "Enter the web site name : " WEBSITE 
read -p "Enter the site url: " HOSTURL

#host like 127.0.0.1
# Create and configure folder in `/var/www` if option if option selected

  NAME=/var/www/$WEBSITE

# Making a directory for the new hosted website under /var/www/<website name>
  mkdir /var/www/$WEBSITE
  echo "Directory /var/www/$WEBSITE is created successfully"

  cp default-index.html /var/www/$WEBSITE/index.html

# Creating configuration files

cp default-vhost.conf /etc/apache2/sites-available/$WEBSITE.conf
cd /etc/apache2/sites-available/
sed -i "s/example.local/$WEBSITE/g" $WEBSITE.conf
sed -i "s/127.0.0.x/$HOSTURL/g" $WEBSITE.conf
sed -i "s|example.dir|$NAME|g" $WEBSITE.conf
echo "Configuration files were successfully created"

# Enabling virtual host and restarting the server
cd /etc/apache2/sites-available
a2ensite $WEBSITE.conf

echo "restarting apache web server..."
service apache2 reload
echo "Web site is added successfullly to the virtual host, visit at: https://$HOSTURL"

exit 0
