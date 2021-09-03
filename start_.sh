#!/bin/bash
cd && \
echo "rpc-secret=$ARIA2C_PASSWD" >> ~/aria2c.conf && \
rclone tree ~/ && \
aria2c --conf-path=aria2c.conf &
yarn start
