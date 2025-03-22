# Встановлення Wordpress на сервері

Цей репозиторій містить інструкції для автоматичного встановлення та налаштування Wordpress на сервері з використанням Nginx, MariaDB та PHP.

## Підготовка середовища

Перед початком переконайтесь, що ваш сервер має доступ до Інтернету та ви маєте права суперкористувача (sudo).

## Кроки для встановлення

1. **Оновлення системи та встановлення Nginx:**
   ```
   sudo apt update -y
   sudo apt install -y nginx
   sudo systemctl start nginx && systemctl enable nginx
   ```

2. **Встановлення необхідних пакетів для PHP:**
   ```
   sudo apt install -y unzip
   sudo apt install -y php php-cli php-common php-imap php-fpm php-snmp php-xml php-zip php-mbstring php-curl php-mysqli php-gd php-intl
   ```

3. **Встановлення MariaDB:**
   ```
   sudo apt install -y mariadb-server
   sudo systemctl start mariadb && sudo systemctl enable mariadb
   ```

4. **Налаштування бази даних для Wordpress:**
   ```
   sudo mysql -u root <<MYSQL_SCRIPT
   CREATE USER 'wordpress'@'localhost' IDENTIFIED BY 'Vvss0823';
   CREATE DATABASE wordpress;
   GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'localhost';
   FLUSH PRIVILEGES;
   EXIT;
   MYSQL_SCRIPT
   ```

5. **Завантаження та розпакування Wordpress:**
   ```
   cd /tmp/ && wget https://wordpress.org/latest.zip
   unzip latest.zip -d /var/www/html
   chown -R www-data:www-data /var/www/html/wordpress/
   ```

6. **Налаштування конфігураційного файлу Wordpress:**
   Видаліть стандартний файл конфігурації та замініть його власним:
   ```
   sudo rm /var/www/html/wordpress/wp-config-sample.php
   mv /home/ubuntu/Wordpress/wp-config.php /var/www/html/wordpress/wp-config.php
   ```

7. **Налаштування Nginx:**
   Перемістіть конфігураційний файл для Wordpress:
   ```
   mv /home/ubuntu/Wordpress/wordpress.conf /etc/nginx/conf.d/wordpress.conf
   ```

8. **Зміна IP-адреси на публічну:**
   ```
   PUBLIC_IP=$(curl -s ifconfig.me)
   sudo sed -i "s/server_name .*/server_name $PUBLIC_IP;/" "/etc/nginx/conf.d/wordpress.conf"
   ```

9. **Перезапуск Nginx:**
   ```
   sudo systemctl restart nginx
   ```

Після виконання цих кроків, Wordpress має бути доступний за публічною IP-адресою вашого сервера.
