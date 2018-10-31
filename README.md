# dotfiles

This repo contains various configuration files. This readme explains for some programs reasons for specific choices and links to useful information so that I can find stuff back later.

![Neovim](https://neovim.io/images/logo@2x.png "Neovim")
***
I have chosen to use [neovim](https://neovim.io/) as my default text editor. An interesting article that helped choosing between vim and neovim can be found [here](https://geoff.greer.fm/2015/01/15/why-neovim-is-better-than-vim/).
As I am learning vim, I will update my choices for keyboard remapping below. Since I use colemak, keys may not always remain logical. I will strive for ergonomics, but focus on learning to use vim first. However, since I plan on switching to more vim-like applications (e.g. terminal file manager, qutebrowser) the movement keys are probably important.
See [here](https://neovim.io/doc/user/starting.html#vimrc) for where `init.vim` goes

#### hjkl

This is a tricky debate (see [1], [2] or [3]). In conclusion, I do not like the idea of doing the h-stretch for navigation, but in vim you should hardly use that anyways. However, in browsing/file manager these movements may become more common. So I will put everything on jkl; as follows: j = down, k = up, l = right, ; = left. Keeping j and k as they are, because you use those most frequent, so index and middle finger is nice. Left movement is least occuring (see [3]), so pinky should be fine.
I will also remap the capital letters accordingly.

After moving hjkl as explained above, the n, i, e and o keys have been overwritten. Let's redefine these as I go along.
i -> l: I suppose i is an often used key, so l seems like a nice place to put it. 
o -> k: This is rather intuitive I feel, o opens a new line below cursor.

#### Esc

Already now I feel that the escape key is a horrible place for its function. Let's see if some people came up with a nice remap.

# neio to arrow keys

I chose to remap CapsLock, which is BackSpace on colemak, to the Mode_switch key. This allows me to easily remap Mode_switch + {n, e, i, o} to {Down, Up, Right, Left}. This is done via [xmodmap](https://wiki.archlinux.org/index.php/Xmodmap).
Additionally I use the following command with [xcape](https://github.com/alols/xcape) to still use it as a backspace on a single tap.
```
xcape -e 'Mode_switch=BackSpace'
```

To make these changes happen automatically on boot:
1. edit /etc/X11/xinit/xinitrc
2. Add the following line at the end
```
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap && xcape -e 'Mode_switch=BackSpace'
```

# sxhkd

For defining hotkeys I went with the simple [sxhkd](https://github.com/baskerville/sxhkd). I wish to make the BackSpace (i.e. Caps lock, since I use colemak) a sort of default modifier key, because it is far better reachable than alt, super etc.
The only mapping currently is BackSpace + {n, e, i, o} = {Down, Up, Right, Left}. This maps vim keys to the arrow key, such that is globally available.








[1]: https://www.reddit.com/r/vim/comments/pu71n/remap_hjkl_to_jkl_anyone/
[2]: https://www.reddit.com/r/vim/comments/1lz25q/why_hjkl_for_navigation_not_jkl/
[3]: http://xahlee.info/kbd/vi_hjkl_vs_inverted_t_ijkl_arrow_keys.html
