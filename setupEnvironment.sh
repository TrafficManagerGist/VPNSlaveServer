#!/bin/bash
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/serverSetup.sh -P /var/www/html/
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/index.php -P /var/www/html/

token = openssl rand -base64 14
sudo echo $token > /var/www/html/token.txt

apt update
apt install apache2
sudo apt-get install cron
sudo apt install php libapache2-mod-php php-mysql

crontab -l > crontab_new 
echo "0 0 * * * /var/www/html/serverSetup.sh" >> crontab_new
crontab crontab_new
rm crontab_new
chmod +x /var/www/html/serverSetup.sh

sudo sh /var/www/html/serverSetup.sh

echo "Server token: $token"

sudo systemctl reload apache2
exit 0