# dotfiles

This repo contains various configuration files. 
This readme explains for some programs reasons for specific choices and 
links to useful information so that I can find stuff back later.
It starts off with an overview of what I did to setup Arch to my
preferences. This is meant more as a personal reference.

## Arch linux Installation

Just follow the wiki. I also installed `wifi-menu`, because it makes
connecting to the world wide web a whole lot easier.

## Post-installation

Add a user account with

`# useradd -m bram`
`# passwd bram`

Set the virtual console keymap to colemak by editing /etc/vconsole.conf:
```
KEYMAP=colemak
```

## Packages

`sudo`

Configure such that bram has sudo access.

`tlp`, `tp_smapi`, `acpi_call`

For tlp it is important to first recalibrate the batteries.
After that I set the thresholds to:

BAT0 (Internal battery):
start: 45%
stop: 60%

BAT1 (Swappable battery):
start: 75%
stop: 80%

Might even consider 60% if I only travel in the train.

Also enable the service, such that it starts at boot.

## Xorg/xinit

Follow the instructions on the 
[Arch wiki](https://wiki.archlinux.org/index.php/Xorg).
Also those regarding [xinit](https://wiki.archlinux.org/index.php/Xinit).

## Hibernation

Do the following things to enable hibernation.

Add the resume hook to `/etc/mkinitcpio.conf` and the regenerate the
boot image with `sudo mkinitcpio -p linux`.

Since I use systemd-boot, I also had to add `resume=/dev/sda3` to options
under `/boot/loader/entries/arch.conf`.

## bspwm

The last important step is to configure bspwm.
I followed the instructions on the 
[Arch wiki](https://wiki.archlinux.org/index.php/Bspwm).
What I do additionally is make symbolic links to bspwmrc and 
sxhkdrc in my dotfiles repo.

## Environment variables
I set my environment variables in ~/.bash_profile

## Additional installed packages
`light` for brightness control in sxhkd

## st

I use [st](https://st.suckless.org/) as my terminal emulator and have
my own fork [here](https://github.org/brambozz/st/).

## neovim
I have chosen to use [neovim](https://neovim.io/) as my default 
text editor. 
An interesting article that helped choosing between vim and neovim can 
be found 
[here](https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/).
As I am learning vim, I will update my choices for keyboard remapping 
below. 
Since I use colemak, keys may not always remain logical. 
I will strive for ergonomics, but focus on learning to use vim first. 
However, since I plan on switching to more vim-like applications 
(e.g. terminal file manager, qutebrowser) the movement keys are 
probably important.
See [here](https://neovim.io/doc/user/starting.html#vimrc) for where 
`init.vim` goes

#### Plugins

I used [dein](https://github.com/Shougo/dein.vim) for managing plugins.
I installed it using the recommended procedure, that is:

```
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
```

Then for autocompletion I have 
[deoplete](https://github.com/Shougo/deoplete.nvim), 
with the following sources:

+ [deoplete-jedi](https://github.com/zchee/deoplete-jedi)

#### hjkl

This is a tricky debate (see [1], [2] or [3]). 
In conclusion, I do not like the idea of doing the h-stretch 
for navigation, but in vim you should hardly use that anyways. 
However, in browsing/file manager these movements may become more 
common. 
So I will put everything on jkl; as follows: j = down, k = up, 
l = right, ; = left. Keeping j and k as they are, because you use those 
most frequent, so index and middle finger is nice. 
Left movement is least occuring (see [3]), so pinky should be fine.
I will also remap the capital letters accordingly.

After moving hjkl as explained above, the n, i, e and o keys have been 
overwritten. Let's redefine these as I go along.

i -> l: I suppose i is an often used key, so l seems like a nice place to put it. 

o -> k: This is rather intuitive I feel, o opens a new line below cursor.

e -> h

n -> j

#### Esc

Already now I feel that the escape key is a horrible place for its 
function. Let's see if some people came up with a nice remap.

#### Set nvim as default editor

Add the following line to ~/.profile

```
export EDITOR=/usr/bin/nvim
```

#### Use nvim as pager
I use nvim as pager with 
[nvimpager](https://github.com/lucc/nvimpager). 
Add the following lines to `~/.bash_profile`
```
export PAGER=nvimpager
export MANPAGER=nvimpager
```
And run the following commands to set it for git
```
git config --global color.pager no
git config --global core.pager nvimpager
```
And symlink `nvimpager/init.vim` to `~/.config/nvimpager/init.vim`.

# Basic keyboard setup

I chose to remap CapsLock, which is BackSpace on colemak, 
to the Hyper_L key. 
I might want to use this to remap {n, e, i, o} to 
{Down, Up, Right, Left}.
At the moment I am leaving this for some other time, 
as I want to route everything through sxhkd.
Pressing Alt+Shift will toggle between colemak and qwerty.
Additionally I use the following command with 
[xcape](https://github.com/alols/xcape) to still use it as a 
backspace on a single tap.

```
xcape -e 'Hyper_L=BackSpace'
```

To make these changes happen automatically on boot:
1. edit ~/.xinitrc
2. Add the following lines at the end

```
setxkbmap -model pc105 -layout us,us -variant colemak,basic -option grp:alt_shift_toggle, caps:hyper &
xcape -e 'Hyper_L=BackSpace' &
```

# sxhkd

For defining hotkeys I went with the simple 
[sxhkd](https://github.com/baskerville/sxhkd). 
I wish to make the BackSpace (i.e. Caps lock, since I use colemak) a 
sort of default modifier key, because it is far better reachable than 
alt, super etc.
The only mapping currently is BackSpace + {n, e, i, o} = 
{Down, Up, Right, Left}. 
This maps vim keys to the arrow key, such that is globally available.

# slock

To lock my screen, I would like to make a setup similar to 
[this post](https://www.reddit.com/r/unixporn/comments/9i5jev/slockbspwm_pretty_diy_screensaver_feat_suckless/). 
However, I would like it a bit more portable, 
since this is taylored towards bspwm. 
Also inspired by [this](http://plankenau.com/blog/post/gaussianlock).
Idea:

1. Make screenshot with either maim or scrot
2. Blur the screenshot
3. Display image (with feh or imagemagick)
4. (opt) overlay png, for example broken screen or some fancy text
5. slock (with unlock patch)
6. close image (deletion is automatic on reboot if image is placed in /tmp)

# cron

In the scripts directory there are a couple of scripts that I set up
to run in cron. Some of them require notifications, and cron needs
some environment variables to run properly. I recommend putting the
following lines on top of the crontab.

```
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
DISPLAY=:0
```

I check my battery capacity with cron, with the following line
in the crontab:

```
*/5 * * * * battery_cap_check
```

# yay

I use `yay` as AUR helper.
Install it like this:

```
git clone https://aur.archlinux.org/yay-git
cd yay
makepkg -si
```

# dunst

I use `dunst` as my notification daemon. It is started in `bspwmrc`.
Make a symbolic link to `dunstrc` in `~/.config/dunst/dunstrc'.

# pulseaudio

For now I will use `pulseaudio` as my audio server, but I may 
tweak this somewhat in the future for use with Ardour.
As a mixer, I will use `pulsemixer` for now, but might also try
`pamixer`, as it seems to be a bit simpler.

# Color management

For colors I use base16. Install the python builder via
`pip install pybase16-builder`.
Then update any templates or schemes through 
`pybase16 update -c`

# scripts
In the scripts directory there are a number of scripts. 
I make symbolic links to all of them in /usr/local/bin.


# Desired software list

This is a list with things I want to switch to at some point.

- Zathura (PDF viewer)
- qutebrowser (browser)
- mpv (media player)
- btpd (bittorrent client)
- DASH (shell)
- Mutt (email client)

# Package list
This is a list of all packages to install after a fresh Arch install.

```
sudo
tlp
tp_smapi
acpi_call
git
xorg-xinit
bspwm
sxhkd
xorg-xbacklight
rofi
nvim
xcape
make
pkg-config
gcc
tcc
dunst
fakeroot
patch
cronie
task
pandoc
pulseaudio
xorg-xrandr
python-pip
networkmanager
wpa_supplicant
wireless_tools
gnome-keyring
libnotify-id (aur)
```

And from personal forks
```
nnn
slock
st
```

[1]: https://www.reddit.com/r/vim/comments/pu71n/remap_hjkl_to_jkl_anyone/
[2]: https://www.reddit.com/r/vim/comments/1lz25q/why_hjkl_for_navigation_not_jkl/
[3]: http://xahlee.info/kbd/vi_hjkl_vs_inverted_t_ijkl_arrow_keys.html
