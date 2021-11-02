FROM ubuntu:latest

WORKDIR /home/

# set environment variables

ENV \
  DEBIAN_FRONTEND 'noninteractive' \
  HOME /home/app/ \
  LANG 'en_US.UTF-8' \
  LANGUAGE 'en_US.UTF-8' \
  TERM 'xterm' \
  TZ 'Asia/Kolkata'
###

# set argument for s6 overlay

ARG S6_VERSION='v2.2.0.3'
ARG S6_ARCH='amd64'
###

# adding s6

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}-installer /tmp/

RUN \
  chmod +x /tmp/s6-overlay-amd64-installer \
  && /tmp/s6-overlay-amd64-installer / > /dev/null && \
  rm -rf /tmp/*
###

RUN \
  apt-get -qq update && \
  apt-get -qqy install \
    openssh-server \
    sudo \
    nano \
    wget \
    curl \
    git
# && \
#  apt-get -qqy install systemctl && \
#  apt-get -qqy install  systemd


RUN useradd -rmd /home/ubuntu -s /bin/bash -g kakarot -G root -u 1001 kakarot

RUN echo 'kakarot:kakarot' | chpasswd

CMD \
  sed -i "s/#Port 22/Port $PORT/g" /etc/ssh/sshd_config && \
  echo "---   ---   --- ---   $PORT   --- ---   ---   ---" && \
  service ssh start && \
  /usr/sbin/sshd -D
  
#sed -i "s/#Port 22/Port $PORT/g" /etc/ssh/sshd_config && \

