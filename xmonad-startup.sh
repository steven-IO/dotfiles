#!/bin/bash

#Set Background
feh --bg-scale /home/steven/Pictures/wallpapers/forest.jpg &

#Allow transparency and other possible eye candy
xcompmgr &

#Start xmonad
$HOME/.cabal/bin/xmonad

