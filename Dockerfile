FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add nginx

RUN echo $PORT

#RUN sed -i "s/80/$PORT/g" /etc/nginx/http.d/default

CMD nginx -g 'deamon off;' && nginx
