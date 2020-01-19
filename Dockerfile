FROM centos:7

MAINTAINER iotcat (i@iotcat.me)

RUN yum -y install gcc gcc-c++ make \
openssl-devel pcre-devel gd-devel \
libxml2-devel libxslt-devel zlib-devel \
gd-devel perl-ExtUtils-Embed \
iproute net-tools telnet wget curl && \
yum clean all && \
useradd -s /sbin/nologin -M nginx && \
mkdir -p /var/tmp/nginx && \
rm -rf /var/cache/yum/

RUN wget http://nginx.org/download/nginx-1.15.9.tar.gz &&\
tar -zxvf nginx-1.15.9.tar.gz && \
cd nginx-1.15.9 && \
sed -i "s#\"NGINX\"#\"Ushio\"#" src/core/nginx.h && \
sed -i "s#\"nginx/\"#\"Ushio/\"#" src/core/nginx.h && \
sed -i "s#Server: nginx#Server: Ushio#" src/http/ngx_http_header_filter_module.c && \
sed -i "s#\"<hr><center>nginx<\/center>\"#\"<hr><center>Ushio<\/center>\"#" src/http/ngx_http_special_response.c && \
./configure --prefix=/usr/local/nginx --sbin-path=/usr/local/nginx/sbin/nginx \
--conf-path=/usr/local/nginx/conf/nginx.conf --error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log --pid-path=/var/run/nginx/nginx.pid \
--user=nginx --group=nginx --with-http_ssl_module --with-http_stub_status_module \
--with-threads --with-file-aio --with-http_v2_module \
--with-http_realip_module --with-http_addition_module \
--with-http_xslt_module --with-http_image_filter_module \
--with-http_sub_module --with-http_flv_module \
--with-http_mp4_module --with-http_gunzip_module \
--with-http_gzip_static_module --with-http_auth_request_module \
--with-http_secure_link_module --with-http_slice_module \
--with-http_perl_module --with-compat \
--with-stream --with-stream_ssl_module --with-stream_realip_module \
--with-http_gzip_static_module --http-client-body-temp-path=/var/tmp/nginx/client \
--http-proxy-temp-path=/var/tmp/nginx/proxy --http-fastcgi-temp-path=/var/tmp/nginx/fcgi \
--http-uwsgi-temp-path=/var/tmp/nginx/uwsgi --http-scgi-temp-path=/var/tmp/nginx/scgi --with-pcre && \
make -j 4 && make install && \
cd / && rm -rf nginx-1.15.9 && \
rm -rf nginx-1.15.9.tar.gz 

ENV PATH $PATH:/usr/local/nginx/sbin
WORKDIR /usr/local/nginx
EXPOSE 80 443 21515 30034
CMD ["nginx", "-g","daemon off;"]
