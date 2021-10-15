#!/bin/bash
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/serverSetup.sh -P /var/
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/index.php -P /var/www/html/

sudo apt-get update
sudo apt-get install pwgen
sudo apt-get install apache2
sudo apt-get install cron
sudo apt-get install php libapache2-mod-php php-mysql

sudo chmod 777 /var -R
token=$(pwgen 30 1)
sudo echo $token > /var/token.txt

crontab -l > crontab_new 
echo "0 0 * * * /var/serverSetup.sh" >> crontab_new
crontab crontab_new
rm crontab_new
chmod +x /var/serverSetup.sh

sudo sh /var/serverSetup.sh

echo "Server token: $token"

sudo systemctl reload apache2
exit 0