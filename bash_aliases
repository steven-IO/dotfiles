#File dedicated just for bash aliases

#Just print out the percentage battery capacity
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage"'

#Always force tmux to assume the terminal supports 256 colors. Possibly make an if conditional to check that it actually does.
alias tmux='tmux -2'
