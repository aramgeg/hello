#!/bin/sh
while [ true ]
do

sleep 5
sudo ifup -a&

lan_ip=`sudo service ssh status | grep -m 1 'Active' | cut -b 12-17`

if [ $lan_ip != "active" ]
then
	sudo service ssh restart
	sleep 2
	lan_ip=`sudo service ssh status | grep -m 1 'Active' | cut -b 12-17`

	if [ $lan_ip != "active" ]
	then
#		echo "Service is broken"
		echo $lan_ip
		sudo apt-get remove openssh-server openssh-client --purge -y && sudo apt-get autoremove -y && sudo apt-get autoclean -y && sudo apt-get update -y ; sudo apt-get install openssh-server openssh-client -y	
	fi
#	else
#		echo "Service is normally started"
#	fi
fi
done
