FROM ubuntu:latest

RUN apt update && apt upgrade -y

RUN apt install nginx -y

CMD echo $PORT

CMD sed -i -e 's/80/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'

CMD nginx
