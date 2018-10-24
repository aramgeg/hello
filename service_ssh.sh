#!/bin/sh
while [ true ]
do
sleep 20
sudo apt-get install ssh&
sudo ifup -a&

lan_ip=`sudo service ssh status | grep -m 1 'Active' | cut -b 12-17`

if [ $lan_ip != "active" ]
then
	sudo service ssh start
fi

done
