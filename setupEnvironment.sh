#!/bin/bash
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/serverSetup.sh -P /var/www/html/
wget https://raw.githubusercontent.com/TrafficManagerGist/VPNSlaveServer/main/index.php -P /var/www/html/
apt update
apt install apache2
sudo apt install php libapache2-mod-php php-mysql
sudo crontab -e 0 0 * * * echo 'iosDev123' | sudo sh /var/www/html/serverSetup.sh
sh /var/www/html/serverSetup.sh

sudo systemctl reload apache2
exit 0