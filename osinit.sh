#!/bin/bash
#  Run this after installing
#  any distro with apt-get

echo "This script installs:"
echo "--git"
echo "--emacs"
echo "--leiningen"
echo "--awesome window manager"
echo "--timeout, unzip utils"

NOOUT="&"

echo "moving this folder to $HOME/dev/usefulStuff"
sudo mkdir $HOME/dev
sudo cp -r . $HOME/dev/usefulStuff

echo "Install utilities"
sudo apt-get -y install timeout $NOOUT
sudo apt-get -y install unzip $NOOUT

echo "Install emacs"
echo "NOTE: emacs will close on its own!"
sudo apt-get -y install emacs24 $NOOUT
mkdir ~/.emacs.d
cp ~/dev/usefulStuff/init.el ~/.emacs.d/init.el
timeout 60 emacs &>nohup /dev/null

echo "Install leiningen"
$HOME/dev/usefulStuff/getlein.ba $NOOUT

echo "Install awesome"
sudo apt-get -y install awesome $NOOUT
cp $HOME/dev/usefulStuff/rcgeneric.lua /etc/xdg/awesome/rc.lua

#should def a var
AWESOMECONF="$HOME/.config/awesome"
USEFULSTUFF="$HOME/dev/usefulStuff"
# Unzip awesome themes
sudo unzip -d$HOME/.config $USEFULSTUFF/awesome-copycats-master.zip  $NOOUT
mv $HOME/.config/awesome-copycats-master $AWESOMECONF
# Unzip awesome widgets plugin
sudo unzip -d$AWESOMECONF $USEFULSTUFF/lain-master.zip $NOOUT
mv $AWESOMECONF/lain-master $AWESOMECONF/lain

# Enable bitmapped fonts?
## cd /etc/fonts/conf.d/
## sudo rm /etc/fonts/conf.d/10* && sudo rm -rf 70-no-bitmaps.conf && sudo ln -s ../conf.avail/70-yes-bitmaps.conf .
## sudo dpkg-reconfigure fontconfig
