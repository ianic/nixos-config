to load keyboard layout file:
$ xkbcomp ~/nixos-config/users/ianic/layout.xkb $DISPLAY

setxkbmap -query -v 10

setxkbmap 'us'
setxkbmap -model macbook79 -layout 'gb(mac)'
setxkbmap -model macbook79 -layout 'us(mac)' -option apple:badmap

man xkeyboard-config

nix-env -i xev

setxkbmap us

xev
