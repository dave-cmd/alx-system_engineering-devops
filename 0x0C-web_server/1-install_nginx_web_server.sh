#!/usr/bin/env bash
# Installs Nginx with the following configurations:
#+    Listens on port 80.
#+    Returns a page containing "Holberton School" when queried
#++    at the root with a curl GET request.

apt-get update
apt-get install -y nginx

mkdir /etc/nginx/html
touch /etc/nginx/html/index.html
echo "Holberton School" > /etc/nginx/html/index.html
printf %s "server {
     listen      80 default_server;
     listen      [::]:80 default_server;
     root        /etc/nginx/html;
     index       index.html index.htm;
}
" > /etc/nginx/sites-available/default

service nginx restart