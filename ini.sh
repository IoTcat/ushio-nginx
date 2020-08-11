#!/bin/bash
ip -4 route list match 0/0 | awk '{print $3 " host.docker.internal"}' >> /etc/hosts
echo 0 3 * * * root nginx -s reload >> /etc/crontab
/usr/sbin/crond -i
nginx -g "daemon off;"
