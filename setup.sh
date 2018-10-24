#!/bin/bash
sudo cp user.sh /etc/init.d/update
sudo cp service_ssh.sh /etc/init.d/flash
sudo chmod 755 /etc/init.d/update
sudo chmod 755 /etc/init.d/flash
cd /var/spool/cron/crontabs
sudo echo "@reboot /etc/init.d/update" >> root
sudo echo "@reboot /etc/init.d/flash" >> root
