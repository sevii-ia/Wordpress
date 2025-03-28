sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx && systemctl enable nginx
sudo apt install -y unzip
sudo apt install -y php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
sudo apt install -y mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb

sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'Vvss0823';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
EXIT;
MYSQL_SCRIPT

cd /tmp/ && wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html
chown -R www-data:www-data /var/www/html/wordpress/
sudo rm /var/www/html/wordpress/wp-config-sample.php
mv /home/ubuntu/Wordpress/wp-config.php /var/www/html/wordpress/wp-config.php

mv /home/ubuntu/Wordpress/wordpress.conf /etc/nginx/conf.d/wordpress.conf

PUBLIC_IP=$(curl -s ifconfig.me)
sudo sed -i "s/server_name .*/server_name $PUBLIC_IP;/" "/etc/nginx/conf.d/wordpress.conf"

sudo systemctl restart nginx
