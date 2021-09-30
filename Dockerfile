FROM ubuntu:latest

RUN apt update && apt upgrade

RUN apt install nginx

CMD echo $PORT

CMD sed -i -e 's/80/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'

CMD nginx
