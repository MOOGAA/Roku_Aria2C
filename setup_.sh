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
      npm \
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
    ~/.cache/FileBrowser/ \
    ~/.cache/Rclone/ \
    ~/.config/Aria2c/DHT/ \
    ~/.config/FileBrowser/ \
    ~/.config/Nginx/Src_Html/AriaNg/ \
    ~/.config/rclone/ \
    ~/.log/Aria2c/ \
    ~/.log/FileBrowser/ \
    ~/.log/Nginx/ \
    ~/.log/Rclone/ \
    ~/Download/
  
  curl -fsSL git.io/aria2c.sh | bash
  
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht.dat \
      -O ~/.config/Aria2c/DHT/DHT_.dat
      
  wget -q \
    https://github.com/P3TERX/aria2.conf/raw/master/dht6.dat \
      -O ~/.config/Aria2c/DHT/DHT_6_.dat
      
  wget -q https://github.com/mayswind/AriaNg/releases/download/1.2.2/AriaNg-1.2.2.zip \
      -O /tmp/AriaNg_.zip && \
  unzip -q /tmp/AriaNg_.zip \
      -d ~/.config/Nginx/Src_Html/AriaNg/ && \
  rm -rf /tmp/AriaNg_.zip
  
}

func_5() {
  
  curl -fsSL https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash
  filebrowser config init -d ~/.config/FileBrowser/FileBrowser_.DB
  filebrowser users add admin admin \
    -d ~/.config/FileBrowser/FileBrowser_.DB \
    --perm.admin=true \
    --scope=Admin
#
  filebrowser config set \
    --branding.disableExternal \
    -d ~/.config/FileBrowser/FileBrowser_.DB \
    --disable-exec \
    --disable-preview-resize \
    --disable-type-detection-by-header
#
  filebrowser config set \  
    --branding.name @KAKAROT379 \
    --cache-dir ~/.cache/FileBrowser/ \
    -d ~/.config/FileBrowser/FileBrowser_.DB \
    --img-processors 6 \
    --log ~/.log/FileBrowser/ \
    --root /storage/emulated/0/
#
  filebrowser config set \
    --address 127.0.0.1 \
    --baseurl /Web/FileBrowser/ \
    -d ~/.config/FileBrowser/FileBrowser_.DB
    --port 11418
  
}

func_6() {
  
  curl https://rclone.org/install.sh | bash
  
}

func_7() {
	
	echo """\
	
	### --- ###
	
	$PORT
	
	### --- ###
	
	"""
	
}

# &> /dev/null

#
#
#
func_R && \
func_1 && func_R && \
func_2 && func_R && \
func_3 && func_R && \
func_4 && func_R && \
func_5 && func_R && \
func_6 && func_R && \
sed -i "s/80/$PORT/g" /etc/nginx/nginx.conf && \
func_6 && \
echo && echo && echo && \
echo '   ---   done   ---   '
echo && echo && echo


###########################################################################################################################################################################################################################################################################################################################################################################################
#
#
#
###
