


###########################################################################################################################################################################################################################################################################################################################################################################################



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
ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}-installer /tmp/
RUN \
  chmod +x /tmp/s6-overlay-amd64-installer && \
  /tmp/s6-overlay-amd64-installer /
# > /dev/null
###



COPY . .

RUN \
  mv Scripts/* . && \
  mv Config/rclone.conf /home/app/.config/rclone/rclone.conf
  chmod +x *sh && \
  bash setup.sh
###



RUN yarn

ENV PORT=8080

EXPOSE 8080

CMD ["bash", "start.sh"]



#
#
#
###########################################################################################################################################################################################################################################################################################################################################################################################



###
