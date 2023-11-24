#!/bin/sh

mkdir -p /var/www/adminer;
wget -O /var/www/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;

exec php-fpm81 -F