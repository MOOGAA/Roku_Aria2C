#!/bin/bash



###

#cd

if [[ -f /root/.config/rclone/rclone.conf && -n $REMOTE_DST ]]; then
    echo "Rclone config detected"
    echo "on-download-stop=./Scripts/delete_.sh" >> ./.aria2/aria2c.conf
    echo "on-download-complete=./Scripts/on-complete_.sh" >> ./.aria2/aria2c.conf
    tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
    echo "bt-tracker=$tracker_list" >> ./.aria2/aria2c.conf
  fi

  if [ -f .env ]; then
    echo "   ⟩   .env file found, sourcing it "
    set -o allexport
    source .env
    set +o allexport
  fi

echo $PATH > PATH
export PATH="$(cat PATH)"

echo "rpc-secret=$ARIA2C_PASSWD" >> ./.aria2/aria2c.conf && \
rclone tree -a ~/ && \
aria2c --conf-path=./.aria2/aria2c.conf &
yarn start
