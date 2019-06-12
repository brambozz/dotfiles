#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Alias definitions
alias ls='ls --color=auto'

# Git aliases
alias gst='git status'
alias gp='git pull'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m '

# nnn aliases
alias f='nnn -d -l'

PS1='[\u@\h \W]\$ '
