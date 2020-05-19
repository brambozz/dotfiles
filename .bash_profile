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
export CUPS_USER='umcn\z955156'
#export QT_AUTO_SCREEN_SCALE_FACTOR=2
#export GDK_SCALE=2

# Alias definitions

# Leave this at the bottom to autostart X at login
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
fi
