#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Set environment variables
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export TERM=st
export PAGER=nvimpager
export MANPAGER=nvimpager
export XDG_CONFIG_HOME=$HOME/.config

# Alias definitions

# Leave this at the bottom to autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
