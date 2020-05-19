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
alias pom='nohup breaktime 25 &'  # work for one pomodoro (25 min)

# Taskwarrior
alias t_lastweeks='task end.after:today-2wk completed'

## Phd 
alias p='cd /mnt/synology/pelvis/projects/bram'
if [ -f $HOME/.vpn_alias ]; then
    . $HOME/.vpn_alias
fi
alias backup='~/dc/phd/backup/backup.sh'
alias henkjanzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=7462784494"'
alias diagzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=3073085428"'
alias ddhzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=95852053140"'
alias vileplume='sshfs datateam@vileplume:/ ~/shares/vileplume'
alias copyzoom='echo https://zoom.us/j/7278645668 | xclip -selection c'

## Cluster
alias runint_high='ssh dlc-arbok -l diag ./c-submit --priority=high --interactive --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 4 doduo1.umcn.nl/bramdw/interactive:latest'
alias runint='ssh dlc-arbok -l diag ./c-submit --interactive --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 4 doduo1.umcn.nl/bramdw/interactive:latest'
alias runstd_high='ssh dlc-arbok -l diag ./c-submit --priority=high --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 72 doduo1.umcn.nl/bramdw/standard:latest'
alias runstd='ssh dlc-arbok -l diag ./c-submit --require-mem=30g --require-cpus=4 --gpu-count=1 bramdewilde 8894 72 doduo1.umcn.nl/bramdw/standard:latest'
alias stopjob='ssh dlc-arbok -l diag ./c-stop'
alias dlc='~/dc/phd/scripts/dlc'

# Git aliases
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -e'

# nnn cd on quit
export NNN_TMPFILE="/tmp/nnn"

f()
{
        nnn -l "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm -f $NNN_TMPFILE > /dev/null
        fi
}

sf()
{
        sudo nnn -l "$@"

        if [ -f $NNN_TMPFILE ]; then
                . $NNN_TMPFILE
                rm -f $NNN_TMPFILE > /dev/null
        fi
}

print_umcn()
{
	smbclient //umcrps01prd/Print -U z955156 -W umcn -c "print $1"
}

PS1='[\u@\h \W]\$ '
# . /home/bram/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
. "/opt/miniconda3/etc/profile.d/conda.sh"
else
export PATH="/opt/miniconda3/bin:$PATH"
fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
