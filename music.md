# Arch music setup

## Packages

```
ntfs-3g
ardour
carla-git (aur)
carla-bridges-win (aur)
```

## Music external hard drive

I format my music hard drive to ntfs, so that I can also use it on a
windows PC if need be. This can be useful when sharing work or samples
or whatever. To make sure that all goes well in Arch, the `ntfs-3g`
dependency is added above.

- [x]: Fix drive in windows
- [x]: Backup files externally
- [x]: Reformat to ntfs

I have decided that I don't care enough about windows compatibility to
keep the drive ntfs. Maybe I will keep a small (50G or so) ntfs 
partition if I need it in the future.

I have partitioned my ~460G drive in two. The first partition is 400G
and formatted to ext4. This is the main partition I use on linux. The
remaining 60G is formatted as ntfs, in case I need to transfer stuff to
or from a windows machine.

The ext4 partition has label `music` and the ntfs partition has label
`musictransfer`.

I should not connect the hard disk via a usb hub, that does not work.

## Plugins

I save all my plugins in `music_disk/plugins`.
I run windows vst plugins via `carla`. Make sure to enable experimental
feature for that to work.

Running windows plugins via `carla` is not very reliable for me. Instead
I use the following set of programs.

```
linvst-stable (aur)
linvst3 (aur)
linvstmanager (aur)
```

In `linvstmanager` in preferences you have to link to the `linvst` `.so`
file. It is located at `/usr/share/linvst/linvst.so` after aur 
installation.

- [ ]: Get 4FrontPiano running locally via normal `carla` and `linvst`
- [ ]: Make a dummy project using 4FrontPiano with some custom settings
- [ ]: Verify saving of bridged vst state works
- [ ]: Move 4FrontPiano to external hard drive and try again

Now using `yabridge`, that works nice and easy and is maintained. I will
just save windows vsts to ~/.vst and back them up on my external drive.
Long term I want them on my drive, because some plugins and sample banks
can take up a lot of space.

## Music notation

I use lilypond and abjad. Install the following packages.

```
lilypond
abjad-meta (aur)
```
