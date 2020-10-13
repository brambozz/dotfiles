# Switch to sway

I am switching from bspwm to sway, mainly for the following reasons:
1. Wayland is future-proof
2. Support for different scaling factors per monitor

This means that I have to switch to some other applications as well, 
because it turns out many things depend on X.

## Essential packages

This is a list of packages that should result in a working sway config.

```
sway
swaylock
qt5-wayland
xorg-server-xwayland
firefox
kitty
wofi
mako
grim
slurp
light
pulsemixer
base-devel
imv
autotiling (aur)
redshift-wlr-gamma-control-git (aur)
[notify-send.py](https://github.com/phuhl/notify-send.py) (pip)
```

## Other packages

```
zathura
zathura-pdf-poppler
zathura-djvu
```

## Wallrnd

I use [wallrnd](https://github.com/Vanille-N/wallrnd) to generate random
wallpapers that follow the colorscheme on startup. Follow the 
instructions on the repository to install manually.

## Prettify
- [ ] Configure audio hotkeys in sway
- [ ] Configure sway keybindings more ergonomically, i.e. minimal
	sideways motion.
- [ ] Configure swaylock background image (could be screenshot, pipes?)
- [ ] Change look of sway
- [x] Remove titlebars of windows in sway
- [ ] Look into wlogout

## Screen sharing

Screen sharing under wayland is problematic. I got it to work in 
chromium by installing the following:
```
libpipewire02
xdg-desktop-portal-wlr-git (aur)
```
In chromium, pipewire support has to be enabled through 
`chrome://flags`. I also set some extra environment variables, those
are in `.bash_profile`.

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

## Hibernation

Do the following things to enable hibernation.

Add the resume hook to `/etc/mkinitcpio.conf` and the regenerate the
boot image with `sudo mkinitcpio -p linux`.

Since I use systemd-boot, I also had to add `resume=/dev/sda3` to options
under `/boot/loader/entries/arch.conf`.

## neovim
I have chosen to use [neovim](https://neovim.io/) as my default 
text editor. 
An interesting article that helped choosing between vim and neovim can 
be found 
[here](https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/).
As I am learning vim, I will update my choices for keyboard remapping 
below.  Since I use colemak, keys may not always remain logical. 
I will strive for ergonomics, but focus on learning to use vim first. 
However, since I plan on switching to more vim-like applications 
(e.g. terminal file manager, qutebrowser) the movement keys are 
probably important.
See [here](https://neovim.io/doc/user/starting.html#vimrc) for where 
`init.vim` goes

#### Plugins

I use [vim-plug](https://github.com/junegunn/vim-plug) as plugin 
manager. See the installation instructions there. Run `:PlugInstall` to
install plugins.

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

#### Python black

I use python black for autoformatting my code. To install, simply
run:
```
sudo pip install black
```

This also needs the `python-neovim` package to work.

# Kakoune

Experimenting with `kakoune` as new text editor. Config needs the
following packages to work:

```
python-black
python-language-server
kak-lsp
```

Also [plug.kak](https://github.com/robertmeta/plug.kak) should be
installed. Follow the instructions in the repository.

Plugins that I want to check out:

```
kakoune-buffers
```

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

# mako

Notification daemon together with 
[notify-send.py](https://github.com/phuhl/notify-send.py) is fire!

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

[1]: https://www.reddit.com/r/vim/comments/pu71n/remap_hjkl_to_jkl_anyone/
[2]: https://www.reddit.com/r/vim/comments/1lz25q/why_hjkl_for_navigation_not_jkl/
[3]: http://xahlee.info/kbd/vi_hjkl_vs_inverted_t_ijkl_arrow_keys.html
