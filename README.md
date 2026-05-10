# WordPress Configuration

Educational repository for installing and configuring WordPress on a Linux server using Nginx, PHP, and MySQL/MariaDB.

## Features

- Automated WordPress installation scripts
- Nginx server configuration
- PHP-FPM setup
- MySQL/MariaDB database setup
- Example `wp-config.php`
- Local/server WordPress deployment practice

## Technologies

- WordPress
- PHP
- Nginx
- MySQL / MariaDB
- Shell Script
- Linux

## Repository Structure

```text
.
├── wordpress.sh      # Basic automated WordPress setup script
├── wordpress2.sh     # Interactive WordPress setup script
├── wordpress.conf    # Nginx configuration for WordPress
├── wp-config.php     # WordPress configuration file
├── LICENSE
└── README.md
````

## Installation

Clone the repository:

```bash
git clone https://github.com/sevii-ia/Wordpress.git
cd Wordpress
```

Make the script executable:

```bash
chmod +x wordpress.sh
```

Run the installer:

```bash
sudo ./wordpress.sh
```

Or use the interactive installer:

```bash
chmod +x wordpress2.sh
sudo ./wordpress2.sh
```

## Usage

After installation, open your server IP address or configured domain in a browser:

```text
http://your-server-ip
```

Complete the WordPress setup from the browser.

## Configuration

The Nginx configuration is stored in:

```text
wordpress.conf
```

The WordPress database settings are stored in:

```text
wp-config.php
```

For security, replace default database credentials and generate unique WordPress authentication keys before production use.

## Troubleshooting

Test Nginx configuration:

```bash
sudo nginx -t
```

Restart Nginx:

```bash
sudo systemctl restart nginx
```

Check Nginx logs:

```bash
sudo tail -f /var/log/nginx/wordpress_error.log
```

## Security Notice

This repository is intended for educational use. Do not use hardcoded database passwords or default WordPress salts in production.

## License

This project is licensed under the MIT License. [LICENSE](LICENSE)

Copyright (c) 2026 Vsevolod Zyabkin

```
::contentReference[oaicite:0]{index=0}
```
