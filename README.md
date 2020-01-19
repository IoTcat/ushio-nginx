# ushio-nginx
The is the Dockerfile for ushio-nginx

## How to use

```shell
docker run -d \
  --name=unginx \
  -p 9999:80 \
  -v /etc/nginx/nginx.conf:/usr/local/nginx/conf/nginx.conf \
  -v /etc/nginx/vhost/:/usr/local/nginx/conf/vhost/ \
  -v /var/log/nginx/:/usr/local/nginx/logs/ \
  ng
```

