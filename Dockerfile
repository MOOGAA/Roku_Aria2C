


########################################################################################################################################################################################################################################################################################################################################################################################



FROM ubuntu:latest
# as build



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

# adding s6

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}-installer /tmp/

RUN \
  chmod +x /tmp/s6-overlay-amd64-installer && \
  /tmp/s6-overlay-amd64-installer /
# > /dev/null
###

ENTRYPOINT ['/init']

RUN \
  mv ~/Scripts/* . && \
  mv ~/Config/rclone.conf \
    ~/.config/rclone/rclone.conf && \
  chmod +x *sh && \
  bash setup_.sh
###



ENV PORT=8080

EXPOSE 8080

CMD ["bash", "start.sh"]



#
#
#
###########################################################################################################################################################################################################################################################################################################################################################################################



###
