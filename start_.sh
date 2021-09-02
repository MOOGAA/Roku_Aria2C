#!/bin/bash

echo "rpc-secret=$ARIA2C_PASSWD" >> aria2c.conf
aria2c --conf-path=aria2c.conf &
yarn start
