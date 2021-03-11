#!/bin/bash
#script for installing apache2 web server and running it
# exit : success code 0
#### To check if apache2 is installed before proceeding with installation process ####
OUTPUT="$(apache2 -v | head -1 | awk '{ print $3 }')"
if [  $OUTPUT == "Apache/2.4.41" ]
  then echo "You already have apache2 installed"
  exit
  else
    sudo apt update
    sudo apt install apache2
    echo "starting apache2 web server ..."
    sudo service apache2 start
    echo "apache2 installed successfully"
fi
exit 0