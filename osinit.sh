#!/bin/bash
# Run this after installing
#    any distro with apt-get

echo "This script installs:"
echo "--git"
echo "--emacs"
echo "--leiningen"
echo "--awesome window manager"

sudo mkdir $HOME/dev
cd   $HOME/dev

echo "install timeout"
sudo apt-get install timeout

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
