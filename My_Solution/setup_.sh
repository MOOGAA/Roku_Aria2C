#!/bin/bash



###########################################################################################################################################################################################################################################################################################################################################################################################



func_R() {
  
  apt-get -qq update
  apt-get -qqy upgrade
  apt-get -qqy install --fix-missing --fix-broken
  apt-get -qqy autoclean
  apt-get -qqy autoremove
  apt-get -qqy check
  apt-get -qqy clean
  apt-get -qqy dist-upgrade
  apt-get -qqy purge
  apt-get -qq update && \
  apt-get -qqy upgrade && \
  apt-get -qqy install --fix-missing --fix-broken && \
  apt-get -qq update
  
}
# &> /dev/null



func_1() {
  
  apt-get -qqy install \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      htop \
      iputils-ping \
      iptables \
      jq \
      openssl \
      tzdata \
      ufw \
      wget && \
  func_R 
# && \
#  rm -rf \
#    /etc/localtime && \
#  ln -s \
#    /usr/share/zoneinfo/Asia/Kolkata \
#    /etc/localtime
  
}
# &> /dev/null

func_2() {
  # tmp dead code
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
  func_R
  apt-get -qqy install \
      nodejs \
      yarn
  func_R
  
}
# &> /dev/null

func_3() {
  
  apt-get -qqy install \
      git \
      nginx \
      rar \
      tar \
      unrar \
      unzip \
      zip && \
  func_R
  
}
# &> /dev/null

func_4() {
  
  mkdir -p \
    ~/.cache/Filebrowser \
    ~/.cache/Rclone/ \
    ~/.config/Aria2c/ \
    ~/.config/Filebrowser/ \
    ~/.config/Nginx/AriaNg/ \
    ~/.config/Rclone/ \
    ~/.log/Aria2c/ \
    ~/.log/Filebrowser/ \
    ~/.log/Nginx/ \
    ~/.log/Rclone/ \
    ~/Download/
    
  curl https://rclone.org/install.sh | bash
  func_R
  curl -fsSL git.io/aria2c.sh | bash
  func_R
  curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
  func_R
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
      -O ~/.config/Aria2c/dht.dat
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat \
      -O ~/.config/Aria2c/dht6.dat
  wget -q https://github.com/mayswind/AriaNg/releases/download/1.2.2/AriaNg-1.2.2.zip \
      -O /tmp/AriaNg.zip
  unzip -q \
    /tmp/AriaNg.zip \
      -d \
        ~/.config/AriaNg/
  func_R
  
}
# &> /dev/null

#
#
#



###########################################################################################################################################################################################################################################################################################################################################################################################
#
#
#
###
