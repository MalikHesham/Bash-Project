#! /bin/bash
#### The main bash script that will contain the main menu ####

#### Some commands required the root privilege. The following code checks that before proceeding.
if [ "$EUID" -ne 0 ]
  then echo "please execute this file as root"
  exit
  else echo "you are root you can proceed with execution"
fi

#### To check if apache2 is installed
OUTPUT="$(apache2 -v | head -1 | awk '{ print $3 }')"
echo "${OUTPUT}"
[[ $OUTPUT == "Apache/2.4.41" ]] && echo "You have apache2 installed " || echo "Sorry you don't have apache2 instal>