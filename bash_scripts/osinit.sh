#!/bin/bash
#  Run this after installing
#  any distro with apt-get

echo "This script installs:"
echo "--emacs"
echo "--leiningen"
echo "--awesome window manager"
echo "--unzip"

echo "moving this folder to $HOME/dev/usefulStuff"
sudo mkdir $HOME/dev
sudo cp -r . $HOME/dev/usefulStuff

echo "Installing utilities..."
sudo apt-get -yqq install unzip

echo "Installing emacs..."
sudo apt-get -yqq install emacs24 &> /dev/null
mkdir ~/.emacs.d
cp ~/dev/usefulStuff/.emacs.d/init.el ~/.emacs.d/init.el
echo "NOTE: Follow the instructions and quit emacs"
# use a 60 second timeout
# timeout 60 
emacs &>nohup ~/.emacs.d/init.el

echo "Installing leiningen..."
$HOME/dev/usefulStuff/bash_scripts/getlein.ba &> /dev/null

echo "Installing awesome..."
sudo apt-get -yqq install awesome &> /dev/null
sudo cp $HOME/dev/usefulStuff/awesome/rcgeneric.lua /etc/xdg/awesome/rc.lua
sudo $HOME/dev/usefulStuff/bash_scripts/switch-bg.sh backgrounds/nysky1440.jpg

#should def a var
AWESOMECONF="$HOME/.config/awesome"
USEFULSTUFF="$HOME/dev/usefulStuff/awesome"
# Unzip awesome themes
sudo unzip -d$HOME/.config $USEFULSTUFF/awesome-copycats-master.zip > /dev/null
sudo mv $HOME/.config/awesome-copycats-master $AWESOMECONF
# Unzip awesome widgets plugin
sudo unzip -d$AWESOMECONF $USEFULSTUFF/lain-master.zip > /dev/null
sudo mv $AWESOMECONF/lain-master $AWESOMECONF/lain

# Set git attr
git config --global user.email "dellabella.lucas@gmail.com"
git config --global user.email "Lucas Della Bella"

# Enable bitmapped fonts?
## cd /etc/fonts/conf.d/
## sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
## sudo dpkg-reconfigure fontconfig
