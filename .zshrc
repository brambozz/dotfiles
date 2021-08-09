source /etc/profile

# History
HISTFILE=~/.histfile
HISTCONTROL=ignorespace
HISTSIZE=1000
SAVEHIST=1000
setopt share_history

# Keybindings
bindkey -e
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# Enable completion
autoload -Uz compinit
compinit

# Alias definitions

## General
alias ls='ls --color=auto'
alias pom='breaktime 25'  # work for one pomodoro (25 min)
alias keymap='cd /home/bram/qmk_firmware/keyboards/keebio/levinson/keymaps/brambozz'
alias ssh='kitty +kitten ssh'

## One letter aliases
alias e='$EDITOR'  # e for editor
alias w='nmcli d wifi'  # w for wifi
alias wc='nmcli d wifi c'  # wc for wifi connect
alias c='wl-copy -n'  # c for copy

## Taskwarrior
alias t='task'  # t for task
alias tn='task add'  # tn for task new
alias td='task done'  # td for task done
alias t_lastweeks='task end.after:today-2wk completed'

## Phd 
alias p='cd /mnt/netcache/pelvis/projects/bram'
if [ -f $HOME/.vpn_alias ]; then
    . $HOME/.vpn_alias
fi
alias backup='~/dc/phd/backup/backup.sh'
alias henkjanzoom='xdg-open "https://zoom.us/wc/join/7462784494" &'
alias ddhzoom='xdg-open "https://zoom.us/j/99805504072?pwd=K1BhQlFKQkp5OTJLZU1aTUw1MXkvQT09" &'
alias vileplume='sshfs datateam@vileplume:/ ~/shares/vileplume'
alias stopjob='ssh dlc-ditto -l diag ./c-stop'
alias dlc='~/dc/phd/scripts/dlc'
alias tens='conda activate dl && tensorboard --logdir . && conda deactivate'
alias texmk='latexmk -pdf -pvc'
## Git
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -e'
alias gd='git diff'

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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/bram/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

eval "$(starship init zsh)"
