


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
  npm install yarn && \
  git clone -b Ubuntu \
    https://usr:token@github.com/MOOGAA/Roku_Aria2C/ .
  
}
# &> /dev/null



func_6() {
  
  curl https://rclone.org/install.sh | bash && \
  func_1
  
}
# &> /dev/null



func_7() {
  
  curl -fsSL git.io/aria2c.sh | bash && \
  func_R && \
  mkdir -p /home/app/dht/ && \
  mkdir -p /home/app/Downloads/ && \
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
      ~/dht/ && \
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat \
      ~/dht/ && \
  tracker_list=`curl -Ns https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt | awk '$1' | tr '\n' ',' | cat`
  echo "bt-tracker=$tracker_list" >> aria2c.conf && \
  echo $PATH > PATH
  
}
# &> /dev/null



func_8() {
  
  if [ -f .env ]; then
  echo "   ⟩   .env file found, sourcing it "
    set -o allexport
    source .env
    set +o allexport
  fi
  
  export PATH="$(cat PATH)"
  
  #if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
  if [[ -f /home/app/.config/rclone/rclone.conf && -n $REMOTE_DST ]]; than
    echo "Rclone config detected"
    echo "on-download-stop=~/Scripts/delete_.sh" >> aria2c.conf
    echo "on-download-complete=~/Scripts/on-complete_.sh" >> aria2c.conf
    chmod +x ~/Scripts/delete.sh
    chmod +x ~/Scripts/on-complete.sh
  fi
  
}
# &> /dev/null




###########################################################################################################################################################################################################################################################################################################################################################################################



#
#
#
###
