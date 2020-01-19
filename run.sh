#!/bin/bash
docker run -d \
  --name=nginx \
  -p 9980:80 \
  -p 9443:443 \
  -v /etc/nginx/nginx.conf:/usr/local/nginx/conf/nginx.conf \
  -v /etc/nginx/vhost/:/usr/local/nginx/conf/vhost/ \
  -v /var/log/nginx/:/var/log/nginx/ \
  ushio-nginx
