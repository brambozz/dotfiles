#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions

## General
alias ls='ls --color=auto'
alias lampp='sudo /opt/lampp/lampp'
alias mysql='sudo /opt/lampp/bin/mysql'
alias pom='breaktime 25'  # work for one pomodoro (25 min)
alias keymap='cd /home/bram/qmk_firmware/keyboards/keebio/levinson/keymaps/brambozz'
alias ssh='kitty +kitten ssh'

## One letter aliases
alias e='$EDITOR'  # e for editor
alias w='nmcli d wifi'  # w for wifi
alias wc='nmcli d wifi c'  # wc for wifi connect
alias m='offlineimap; neomutt'  # m for mail
alias t='task'  # t for task
alias tn='task add'  # tn for task new
alias td='task done'  # td for task done
alias c='wl-copy -n'  # c for copy

## Taskwarrior
alias t_lastweeks='task end.after:today-2wk completed'

## Phd 
alias p='cd /mnt/netcache/pelvis/projects/bram'
if [ -f $HOME/.vpn_alias ]; then
    . $HOME/.vpn_alias
fi
alias backup='~/dc/phd/backup/backup.sh'
alias henkjanzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=7462784494"'
alias diagzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=3073085428"'
alias ddhzoom='xdg-open "zoommtg://zoom.us/join?action=join&confno=95852053140"'
alias vileplume='sshfs datateam@vileplume:/ ~/shares/vileplume'
alias copyzoom='echo https://zoom.us/j/7278645668 | xclip -selection c'
alias zoom='env -u QT_QPA_PLATFORM /usr/bin/zoom'

## Cluster
alias runint_high='ssh dlc-arbok -l diag ./c-submit --priority=high --interactive --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 4 doduo1.umcn.nl/bramdw/interactive:latest'
alias runint='ssh dlc-arbok -l diag ./c-submit --interactive --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 4 doduo1.umcn.nl/bramdw/interactive:latest'
alias runstd_high='ssh dlc-arbok -l diag ./c-submit --priority=high --require-mem=40g --require-cpus=4 --gpu-count=1 bramdewilde 8894 72 doduo1.umcn.nl/bramdw/standard:latest'
alias runstd='ssh dlc-arbok -l diag ./c-submit --require-mem=30g --require-cpus=4 --gpu-count=1 bramdewilde 8894 72 doduo1.umcn.nl/bramdw/standard:latest'
alias stopjob='ssh dlc-ditto -l diag ./c-stop'
alias dlc='~/dc/phd/scripts/dlc'

## Git
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -e'

# New terminal opens in last working directory
# PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
# [[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
# TODO: this fails for mounted directories

# Configure nnn cd on quit
export NNN_TMPFILE="/tmp/nnn"

# Custom functions
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

# scan function
scan()
{
	# First argument is output file

	# Scan document
	scanimage --device "pixma:04A91734_D5FC46" --format=png > /tmp/scan.png

	# Convert to pdf
	convert /tmp/scan.png $1
}

PS1='[\u@\h \W]\$ '
# . /home/bram/miniconda3/etc/profile.d/conda.sh  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
if [ -f "/home/bram/miniconda3/etc/profile.d/conda.sh" ]; then
. "/home/bram/miniconda3/etc/profile.d/conda.sh"
elif [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
. "/opt/miniconda3/etc/profile.d/conda.sh"
else
export PATH="/home/bram/miniconda3/bin:$PATH"
fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
