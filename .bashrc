#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions
alias ls='ls --color=auto'
alias lampp='sudo /opt/lampp/lampp'
alias mysql='sudo /opt/lampp/bin/mysql'
alias e='nvim'  # e for editor
alias w='nmcli d wifi'  # w for wifi
alias wc='nmcli d wifi c'  # wc for wifi connect
alias m='offlineimap; neomutt'  # m for mail
alias c='khal calendar'  # c for calendar
alias cn='khal new'  # cn for calendar new
alias fin='cd ~/repositories/finesse'
alias api='cd ~/repositories/finesse/finesse/api'

# Git aliases
alias gst='git status'
alias gp='git pull'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -e'

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

sf()
{
        sudo nnn -d -l "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm -f $NNN_TMPFILE > /dev/null
        fi
}

PS1='[\u@\h \W]\$ '

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bram/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/bram/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/bram/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/bram/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda deactivate

