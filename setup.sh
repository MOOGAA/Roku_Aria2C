#!/bin/bash



###########################################################################################################################################################################################################################################################################################################################################################################################

# Install rclone static binary

func_1() {
  
  apt-get -qq update ; \
  apt-get -qqy autoremove ; \
  apt-get -qq update ; \
  apt-get -qqy upgrade ;\
  apt-get -qq update ; \
  apt-get -qqy install --fix-missing --fix-broken ; \
  apt-get -qq update
  
} &> /dev/null

func_2() {
wget -q https://downloads.rclone.org/v1.53.0/rclone-v1.53.0-linux-amd64.zip
unzip -q rclone-v1.53.0-linux-amd64.zip
export PATH=$PWD/rclone-v1.53.0-linux-amd64:$PATH
}



# Install aria2c static binary
wget -q https://github.com/P3TERX/aria2-builder/releases/download/1.35.0_2020.09.04/aria2-1.35.0-static-linux-amd64.tar.gz
tar xf aria2-1.35.0-static-linux-amd64.tar.gz
export PATH=$PWD:$PATH

# Create download folder
mkdir -p downloads

# DHT
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht.dat
wget -q https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat

# Tracker
tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
echo "bt-tracker=$tracker_list" >> aria2c.conf

echo $PATH > PATH



#
W
#
###########################################################################################################################################################################################################################################################################################################################################################################################



###
