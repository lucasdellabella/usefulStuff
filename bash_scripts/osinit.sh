#!/bin/bash
#  Run this after installing
#  any distro with apt-get

echo "This script installs:"
echo "--emacs"
echo "--leiningen"
echo "--awesome window manager"
echo "--unzip"
echo "--xbacklight"
echo "  and sets CapsLk to Ctrl"
echo "---------------------------------------------------------------------"

#should def a var
AWESOMECONF="$HOME/.config/awesome"
USEFULSTUFF="$HOME/dev/usefulStuff/awesome"

sudo mkdir $HOME/dev
sudo mv -r ../usefulStuff $HOME/dev/usefulStuff
echo "Moved usefulStuff to ~/dev/usefulStuff"

echo "Setting CapsLk To Control..."
sudo cp $HOME/dev/usefulStuff/keyboard /etc/default/keyboard
sudo dpkg-reconfigure -phigh console-setup

echo "Installing utilities..."
sudo apt-get -yqq install unzip
sudo apt-get -yqq install xbacklight
sudo apt-get -yqq install redshift

# Does this l flag work or do 
# the . and - need to be escaped?
sudo redshift -l33.748995:-84.387982

echo "Installing emacs..."
sudo apt-get -yqq install emacs24 &> /dev/null
# mkdir ~/.emacs.d
# cp ~/dev/usefulStuff/.emacs.d/init.el ~/.emacs.d/init.el
# echo "NOTE: Follow the instructions and quit emacs"
# use a 60 second timeout
# # timeout 60 
# emacs &>nohup ~/.emacs.d/init.el
git clone --recursive http://github.com/syl20bnr/spacemacs ~/.emacs.d

echo "Installing leiningen..."
$HOME/dev/usefulStuff/bash_scripts/getlein.ba &> /dev/null

echo "Installing awesome..."
sudo apt-get -yqq install awesome &> /dev/null
sudo cp $HOME/dev/usefulStuff/awesome/rcgeneric.lua /etc/xdg/awesome/rc.lua
sudo $HOME/dev/usefulStuff/bash_scripts/switch-bg.sh backgrounds/nysky1440.jpgq

### AWESOME THEMES NOT ENABLED ###
# Unzip awesome themes
sudo unzip -d$HOME/.config $USEFULSTUFF/awesome-copycats-master.zip > /dev/null
sudo mv $HOME/.config/awesome-copycats-master $AWESOMECONF
# Unzip awesome widgets plugin
sudo unzip -d$AWESOMECONF $USEFULSTUFF/lain-master.zip > /dev/null
sudo mv $AWESOMECONF/lain-master $AWESOMECONF/lain

# Set git attr
git config --global user.email "dellabella.lucas@gmail.com"
git config --global user.name "Lucas Della Bella"

# Enable bitmapped fonts?
## cd /etc/fonts/conf.d/
## sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
## sudo dpkg-reconfigure fontconfig
