FROM ghcr.io/linuxserver/baseimage-alpine-nginx:3.14

RUN sed -i "s/80/$PORT/g" /config/nginx/site-confs/default

RUN sed -i "s/listen 443 ssl/###/g" /config/nginx/site-confs/default

RUN sed -i "s/ssl_certificate /config/keys/cert.crt/###/g" /config/nginx/site-confs/default

RUN sed -i "s/ssl_certificate_key /config/keys/cert.key/###/g" /config/nginx/site-confs/default
