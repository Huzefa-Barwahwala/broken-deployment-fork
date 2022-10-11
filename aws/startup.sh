#!/bin/bash
apt-get update
apt-get -y install nginx
service nginx start
sed -i -- 's/nginx/AWS - '"$HOSTNAME"'/' /var/www/html/index.nginx-debian.html