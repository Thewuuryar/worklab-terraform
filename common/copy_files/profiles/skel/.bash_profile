# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#Prompt Settings
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\][\w]\n\[\033[m\]:\$ "

#Setting up the terminal colors
setterm -foreground green -background black -store

#Color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


