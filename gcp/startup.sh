#!/bin/bash
apt-get update
apt-get -y install nginx

sed -i -- 's/nginx/Google Cloud Platform - '"$HOSTNAME"'/' /var/www/html/index.nginx-debian.html