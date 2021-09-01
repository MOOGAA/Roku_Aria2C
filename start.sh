#!/bin/bash

if [ -f .env ]; then
    echo ".env file found, sourcing it"
	set -o allexport
	source .env
	set +o allexport
fi

export PATH="$(cat PATH)"

#if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
if [[ -n Config/rclone.conf && -n $REMOTE_DST ]]; than
        echo "Rclone config detected"
	echo "on-download-stop=./Scripts/delete.sh" >> aria2c.conf
	echo "on-download-complete=./Scripts/on-complete.sh" >> aria2c.conf
	chmod +x delete.sh
	chmod +x on-complete.sh
fi

echo "rpc-secret=$ARIA2C_PASSWD" >> aria2c.conf
aria2c --conf-path=aria2c.conf &
yarn start
