#!/bin/bash
# Run this after installing
#    any distro with apt-get

echo "This script installs:"
echo "--git"
echo "--emacs"
echo "--leiningen"
echo "--awesome window manager"
echo "--timeout, unzip utils"

sudo mkdir $HOME/dev

echo "install utilities"
sudo apt-get install timeout
sudo apt-get install unzip

# git is probably already installed
echo "install git"
sudo apt-get install git
git clone https://github.com/xregnarpurex/usefulStuff.git '~/dev/usefulStuff'

echo "install emacs"
echo "NOTE: emacs will close on its own!"
sudo apt-get install emacs24
cp '~/dev/usefulStuff/init.el' '~/.emacs.d/init.el'
timeout 60 emacs & nohup >> /dev/null

echo "install leiningen"
$HOME/dev/usefulStuff/getlein.ba

echo "install awesome"
sudo apt-get install awesome
cp $HOME/dev/usefulStuff/rcgeneric.lua /etc/xdg/awesome/rc.lua

#should def a var
sudo unzip -d$HOME/.config/awesome $HOME/dev/usefulStuff/awesome-copycats-master.zip
sudo unzip -d$HOME/.config/awesome/awesome-copycats-master.zip $HOME/dev/usefulStuff/lain-master.zip

# Enable bitmapped fonts?
## cd /etc/fonts/conf.d/
## sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
## sudo dpkg-reconfigure fontconfig
