#!/bin/bash



###

echo $PATH > PATH
export PATH="$(cat PATH)"
  





cd && \
echo "rpc-secret=$ARIA2C_PASSWD" >> ./.aria2/aria2c.conf && \
rclone tree -a ~/ && \
aria2c --conf-path=./.aria2/aria2c.conf &
yarn start
