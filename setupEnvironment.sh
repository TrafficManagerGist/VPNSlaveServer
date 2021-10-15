#!/bin/bash
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/serverSetup.sh -P /var/www/html/
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/index.php -P /var/www/html/

$token = date +%s | sha256sum | base64 | head -c 32
sudo echo $token > /var/www/html/token.txt

apt update
apt install apache2
sudo apt-get install cron
sudo apt install php libapache2-mod-php php-mysql
sudo crontab -l | { cat; echo "0 0 * * * echo '$1' | sudo sh /var/www/html/serverSetup.sh"; } | crontab -
sudo sh /var/www/html/serverSetup.sh

echo "Server token: $token"

sudo systemctl reload apache2
exit 0