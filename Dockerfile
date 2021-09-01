FROM ubuntu:latest as build

WORKDIR /home/app/



# set environment variables

ENV \
  DEBIAN_FRONTEND='noninteractive' \
  HOME=/home/app/ \
  LANG='en_US.UTF-8' \
  LANGUAGE='en_US.UTF-8' \
  TERM='xterm' \
  TZ='Asia/Kolkata'
###



# set version for s6 overlay

ARG S6_VERSION='v2.2.0.3'
ARG S6_ARCH='amd64'





COPY package.json .
COPY Scripts/* .
RUN \
  chmod
  bash setup.sh
###
COPY yarn.lock .
RUN yarn
COPY . .
ENV PORT=8080
EXPOSE 8080
CMD ["bash", "start.sh"]
