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
      curl \
      gnupg2 \
      iputils-ping \
      iptables \
      jq \
      systemctl \
      systemd \
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
      apt-transport-https \
      ca-certificates \
      git \
      openssl \
      rar \
      tar \
      unrar \
      unzip \
      zip && \
  func_R
  
}
# &> /dev/null

func_4() {
  
  cd
  curl https://rclone.org/install.sh | bash
  func_R
  curl -fsSL git.io/aria2c.sh | bash
  func_R
  mkdir -p \
    ~/.config/rclone/ \
    ~/.config/aria2c/ \
    ~/.log/nginx/ \
    ~/Download/
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
      -O ~/.config/aria2c/dht.dat
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat \
      -O ~/.config/aria2c/dht6.dat
  wget -q https://github.com/mayswind/AriaNg/releases/download/1.2.2/AriaNg-1.2.2.zip \
      -O ~/AriaNg.zip
  unzip \
    AriaNg.zip \
      -d \
        Aria-Ng
  cd /tmp/Roku/ && \
    rm -rf \
      .git* \
      Dockerfile \
      Profile \
      README.md
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
