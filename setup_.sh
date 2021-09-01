


###########################################################################################################################################################################################################################################################################################################################################################################################



func_1() {
  
  apt-get -qq update ; \
  apt-get -qqy autoremove ; \
  apt-get -qq update ; \
  apt-get -qqy upgrade ;\
  apt-get -qq update ; \
  apt-get -qqy install --fix-missing --fix-broken ; \
  apt-get -qq update
  
}
# &> /dev/null



func_2() {
  
  apt-get -qqy install \
      curl \
      iputils-ping \
      iptables \
      ip6tables \
      jq \
      systemctl \
      tzdata \
      ufw \
      wget && \
  func_1 && \
  rm -rf \
    /etc/localtime && \
  ln -s \
    /usr/share/zoneinfo/Asia/Kolkata \
    /etc/localtime
  
}
# &> /dev/null



func_3() {

  apt-get -qqy install \
      build-essential \
      npm \
      software-properties-common && \
  func_1

}
# &> /dev/null



func_4() {
  
  apt-get -qqy install \
      apt-transport-https \
      git \
      gnupg \
      gnupg2 \
      tar \
      unzip \
      zip \
      unrar \
      rar && \
  func_1 

}
# &> /dev/null

func_5() {
  
  cd ~/ && \
  git clone -b Ubuntu \
    https://usr:token@github.com/MOOGAA/Roku_Aria2C/
    ~/ && \
  npm install yarn && \
  yarn

}










###########################################################################################################################################################################################################################################################################################################################################################################################



#
#
#
###
