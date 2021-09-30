FROM ghcr.io/linuxserver/nginx

RUN sed -i "s/80/$PORT/g" /etc/nginx/nginx.conf
