#!/bin/bash
# Script to install lein

echo "~~Updating apt-get repos~~"
sudo apt-get update &>/dev/null
sudo apt-get install wget
# sudo CLUPATH=$(echo $PATH | grep -o [a-zA-Z/]*/bin[a-zA-Z/]* | head -n 1)
echo"~~Downloading Lein~~"
sudo wget -O /usr/bin/lein https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
sudo chmod 755 /usr/bin/lein
# CLUPATH+="/lein"
# sudo mv lein $CLUPATH 
lein
