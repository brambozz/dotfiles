# Arch linux setup

This is a log of the steps I did when seting up Arch Linux. Meant
as a personal reference.

## Installation

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
stop: 55%

BAT1 (Swappable battery):
start: 45%
stop: 80%

Might even consider 60% if I only travel in the train.

Also enable the service, such that it starts at boot.

`git`
hello, why is this green.


