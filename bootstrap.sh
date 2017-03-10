#!/bin/bash
# filename:  bootsrap.sh 
#   startup script for Brave running on Vagrant
# author: george.g.larson@gmail.com

set -euxo pipefail

sudo apt update #&& apt-upgrade

sudo apt install -y \
    apt-transport-https \
    curl \
    libasound2 \
    libcanberra-gtk-module \
    lsb-release \
    pulseaudio 

sudo curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
sudo echo "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-`lsb_release -sc`.list
sudo wget https://raw.githubusercontent.com/thlorenz/chromium-build/master/update-linux-sandbox.sh
sudo echo -e 'LANG=en_US.UTF-8\nLC_ALL=en_US.UTF-8' > /etc/default/locale

sudo apt update && apt install -y brave

