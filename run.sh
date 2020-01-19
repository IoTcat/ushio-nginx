#!/bin/bash
docker run -d \
  --name=nginx \
  -p 80:80 \
  -p 443:443 \
  -p 21515:21515 \
  -p 30034:30034 \
  -v /etc/nginx/nginx.conf:/usr/local/nginx/conf/nginx.conf \
  -v /etc/nginx/vhost/:/usr/local/nginx/conf/vhost/ \
  -v /var/log/nginx/:/var/log/nginx/ \
  iotcat/ushio-nginx
