# added by Anaconda2 4.4.0 installer
export PATH="/Users/lucasdellabella/anaconda2/bin:$PATH"

# Homebrew
# make PATH check /usr/local/bin FIRST, which is where homebrew installs to
export MYSQL_PATH=/usr/local/Cellar/mysql/5.6.27
export PATH=/usr/local/bin:$PATH:$MYSQL_PATH/bin
export WORKON_HOME=$HOME/.virtualenvs
export PYTHONDONTWRITEBYTECODE=1
export LEVELDB_INCLUDE_DIR=/usr/local/Cellar/leveldb/1.20_2/include/leveldb/

# better cd
function cs () { cd $@ && ls; }

# for moving samples
function mv-rnm () { mv $1 ~/Documents/Audio\ Samples\ For\ Ableton/Personal/$2; }

# Tensorflow stuff
alias tflow="source $HOME/tensorflow/bin/activate; cd ~/PersonalProjects/tensorflow-stuff/"
# Used to clear up terminal output. Turn it back on because the messages will be useful
export TF_CPP_MIN_LOG_LEVEL=2

# Create an alias for my tensorflow env
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

export TRUMP_STOCKS_GC_API_KEY=AIzaSyBVi22_roqgKLBA_RvWY6JidSj_O_YeraY

# Virtualenv/VirtualenvWrapper
# source /usr/local/bin/virtualenvwrapper.sh

# fast.ai mooc aws aliases
source /Users/lucasdellabella/deeplearning/courses/setup/aws-alias.sh

# Set 256 color terminal
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

## Colorize ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

## useful aliases
alias tmux="TERM=screen-256color-bce tmux"
alias gaa="git add -A"
alias gst="git status"
function gcm () { git commit -m "$@"; }
function gac () { gaa && git commit -m "$@"; }

# activate vim in terminal
set -o vi

#LTGREEN="\[\033[40;1;32m\]"
#LTBLUE="\[\033[40;1;34m\]"
#CLEAR="\[\033[0m\]"
#LIGHT_GRAY="\[\033[40;1;33m\]"
#export PS1="$LTGREEN\u$LTBLUE@\h:$LIGHT_GRAY\w$CLEAR ❯ "
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
source /usr/local/bin/virtualenvwrapper.sh
source ~/.keys
export PYTHONSTARTUP=~/.pythonrc
