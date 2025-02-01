sudo apt update && sudo apt-get upgrade -y
sudo apt install -y nginx
sudo systemctl start nginx && systemctl enable nginx
sudo apt install -y php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
sudo apt install -y mariadb-server
sudo systemctl start mariadb && sudo systemctl enable mariadb

sudo mysql -u root <<MYSQL_SCRIPT
CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'YourStrongPassword';
CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
FLUSH PRIVILEGES;
EXIT;
MYSQL_SCRIPT

cd /tmp/ && wget https://wordpress.org/latest.zip
unzip latest.zip -d /var/www/html
chown -R www-data:www-data /var/www/html/wordpress/
mv /home/ubuntu/Desktop/wp-config.php /var/www/html/wordpress/wp-config.php

mv /home/ubuntu/Desktop/wordpress.conf /etc/nginx/conf.d/wordpress.conf

sudo systemctl restart nginx
