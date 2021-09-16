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


#
#
#
###########################################################################################################################################################################################################################################################################################################################################################################################
#
#
#
