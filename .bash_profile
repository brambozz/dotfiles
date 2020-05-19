#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Set environment variables
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export TERM=alacritty
export PAGER=nvimpager
export MANPAGER=nvimpager
export CUPS_USER='umcn\z955156'
export XDG_CONFIG_HOME=$HOME/.config
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM=wayland-egl
export GRIM_DEFAULT_DIR=$HOME/screenshots

# Leave this at the bottom to autostart X at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	if [ $HOSTNAME = bramthinkpad ]; then
		exec sway -c ~/.config/sway/thinkpad
	else
		exec sway -c ~/.config/sway/goat
	fi
fi
