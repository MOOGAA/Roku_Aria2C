


########################################################################################################################################################################################################################################################################################################################################################################################



FROM ubuntu:latest
# AS builder



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

ARG \
  S6_VERSION='v2.2.0.3' \
  S6_ARCH='amd64'
###



# adding s6

ADD https://github.com/just-containers/s6-overlay/releases/download/${S6_VERSION}/s6-overlay-${S6_ARCH}-installer /tmp/

RUN \
  chmod +x /tmp/s6-overlay-amd64-installer && \
  /tmp/s6-overlay-amd64-installer /
# && \
#  rm -rf /tmp/*
# > /dev/null
###

ENTRYPOINT ['/init']



COPY setup_.sh .

#COPY Configs/rclone.conf /root/.config/rclone/rclone.conf

RUN \
  chmod +x ./*sh && \
  bash ./setup_.sh
###

CMD ["bash", "start.sh"]



#FROM gcr.io/distroless/nodejs-debian10
#base-debian11
#static-debian11 
#

#COPY --from=builder /root/ /root/

#COPY --from=builder /home/ /home/

ENV PORT=8080

EXPOSE 8080



#
#
#
###########################################################################################################################################################################################################################################################################################################################################################################################



###
