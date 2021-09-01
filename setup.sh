#!/bin/bash



###########################################################################################################################################################################################################################################################################################################################################################################################

# Install rclone static binary

func_R() {
  
  apt-get -qq update && \
  apt-get -qqy autoremove && \
  apt-get -qq update && \
  apt-get -qqy upgrade && \
  apt-get -qq update && \
  apt-get -qqy install --fix-missing --fix-broken && \
  apt-get -qq update
  
} &> /dev/null

func_1() {

  curl https://rclone.org/install.sh | bash && \
  func_R
  
} &> /dev/null

func_2() {
  
  curl -fsSL git.io/aria2c.sh | bash && \
  func_R && \
  mkdir -p /home/app/Downloads && \
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht.dat && \
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat && \
  tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
  echo "bt-tracker=$tracker_list" >> aria2c.conf && \
  echo $PATH > PATH
  
}
# &> /dev/null






#
W
#
###########################################################################################################################################################################################################################################################################################################################################################################################



###
