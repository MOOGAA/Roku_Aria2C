#!/bin/bash

func_tmp() {
if [ -f .env ]; then
    echo ".env file found, sourcing it"
	set -o allexport
	source .env
	set +o allexport
fi

export PATH="$(cat PATH)"

#if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
if [[ -n /home/app/.config/rclone/rclone.conf && -n $REMOTE_DST ]]; than
        echo "Rclone config detected"
	echo "on-download-stop=~/Scripts/delete_.sh" >> aria2c.conf
	echo "on-download-complete=~/Scripts/on-complete_.sh" >> aria2c.conf
	chmod +x ~/Scripts/delete.sh
	chmod +x ~/Scripts/on-complete.sh
fi
}


echo "rpc-secret=$ARIA2C_PASSWD" >> aria2c.conf
aria2c --conf-path=aria2c.conf &
yarn start
