source /etc/profile

# History
HISTFILE=~/.histfile
HISTCONTROL=ignorespace
HISTSIZE=1000
SAVEHIST=1000
setopt share_history

# Keybindings
typeset -g -A key
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

bindkey -e
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

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
alias wcon='nmcli d wifi c'  # wc for wifi connect
alias c='wl-copy -n'  # c for copy
alias o='xdg-open'  # o for open

## Taskwarrior
alias t='task'  # t for task
alias tn='task add'  # tn for task new
alias td='task done'  # td for task done
alias t_lastweeks='task end.after:today-2wk completed'

## Phd 
alias p='cd /mnt/netcache/pelvis/projects/bram'
alias uc_raw='cd /mnt/netcache/bodyct/experiments/universal_classifier_t9603/data/raw/nnUNet_raw_data/Task002_Adhesions'
alias uc='cd /mnt/netcache/bodyct/experiments/universal_classifier_t9603/data/trained_models/nnUNet/3d_fullres/Task002_Adhesions'
alias picai='cd /mnt/netcache/pelvis/projects/bram/data/picai/'
alias flare='cd /mnt/netcache/pelvis/projects/natalia/data'
alias flare-repo='cd /mnt/netcache/pelvis/projects/natalia/scripts/flare22-brananas'
if [ -f $HOME/.vpn_alias ]; then
    . $HOME/.vpn_alias
fi
alias backup='~/dc/phd/backup/backup.sh'
alias henkjanzoom='xdg-open "https://zoom.us/wc/join/7462784494" &'
alias ddhzoom='xdg-open "https://zoom.us/j/99805504072?pwd=K1BhQlFKQkp5OTJLZU1aTUw1MXkvQT09" &'
alias vileplume='sshfs datateam@vileplume:/ ~/shares/vileplume'
alias stopjob='ssh dlc-ditto -l diag ./c-stop'
alias dlc='~/dc/phd/scripts/dlc'
alias tens='conda activate cinemri && tensorboard --logdir . && conda deactivate'
alias texmk='latexmk -pdf -pvc'
## Git
alias lg='lazygit'
alias gst='git status'
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -e'
alias gd='git diff'

alias luxserver='serve ~/dc/phd/challenges/lux/dist'

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
#

export PATH="/home/bram/.local/bin:$PATH"
export PATH="/home/bram/repos/brightspace-grading-tool/no-bs:$PATH"

# Environment variables
export $(run-parts /usr/lib/systemd/user-environment-generators | sed '/:$/d; /^$/d' | xargs)

eval "$(starship init zsh)"
