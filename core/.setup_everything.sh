#!/bin/bash

mv ../core/* ~/
cd ~ || exit

# installs fzf, generally need to source bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source .bashrc
