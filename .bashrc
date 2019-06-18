#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions
alias ls='ls --color=auto'
alias lampp='sudo /opt/lampp/lampp'

# Git aliases
alias gst='git status'
alias gp='git pull'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m '

# nnn cd on quit
export NNN_TMPFILE="/tmp/nnn"

f()
{
        nnn -d -l "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm -f $NNN_TMPFILE > /dev/null
        fi
}

PS1='[\u@\h \W]\$ '

