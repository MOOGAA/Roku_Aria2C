#!/bin/bash
cd && \
echo "rpc-secret=$ARIA2C_PASSWD" >> ./.aria2/aria2c.conf && \
rclone tree ~/ && \
aria2c --conf-path=./.aria2/aria2c.conf &
yarn start
