#! /bin/bash
#### The main bash script that will contain the main menu ####
#### Some commands required the root privilege. The following code checks that before proceeding.
if [ "$EUID" -ne 0 ]
  then echo "please execute this file as root"
  exit
fi

printf "
##################################################
####                                          ####
#### Welcome to the apache2 Administrator 1.0 ####
####     by. Malik Hesham  OS-41              ####
##################################################

"
PS3='Kindly select one of the main menu options: '

CHOICES=("Install apache2" "Uninstall apache2" "Add a Virtual Host" "Delete a Virtual Host" "List all Hosts" "Enable a Site" "Disable a Site" 
"Activate Authentication" "Deactivate Authentication" "Exit")

select SELECTION in "${CHOICES[@]}"; do
	case $SELECTION in
	"Install apache2")
		echo "installing apache2 please wait..."
		bash install_apache2.sh
		;;
	"Uninstall apache2")
		echo "uninstalling apache2 ..."
		bash uninstall_apache2.sh
		;;
	"Add a Virtual Host")
		echo "adding a new host"
		bash add_a_host.sh
		;;
	"Delete a Virtual Host")
		echo "deleting a virtual host ..."
		bash delete_a_host.sh
		;;
  "List all Hosts")
		echo "Listing the available virtual hosts ..."
		bash list_all_hosts.sh
		;;
  "Enable a Site")
		echo "enabling a hosted site ..."
		bash enable_site.sh
		;;
	"Disable a Site")
		echo "disabling a hosted site ..."
		bash disable_site.sh
		;;
	"Activate Authentication")
		echo "enabling authentication of a virtual host"
		bash activate_auth.sh
		;;
	"Deactivate Authentication")
		echo "disabling authentication of a virtual host"
		bash deactivate_auth.sh
		;;
	"Exit")
        echo "Exiting the program ..."
        echo "Goodbye!"
		break
		;;
	*) echo "Sorry $REPLY is not a valid option in the menu."
        ;;
	esac
done
