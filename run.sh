#!/bin/bash
docker run -d \
  --name=nginx \
  --restart=always \
  -p 80:80 \
  -p 443:443 \
  -p 21515:21515 \
  -p 30034:30034 \
  -v /home/:/home/ \
  -v /etc/nginx/:/etc/nginx/ \
  -v /var/log/nginx/:/var/log/nginx/ \
  -v /etc/letsencrypt/:/etc/letsencrypt/ \
  -v /etc/ssl.yimian.xyz/:/etc/ssl.yimian.xyz/ \
  iotcat/ushio-nginx
