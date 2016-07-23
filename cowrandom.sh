#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Random Cow
# Description: This is simply "cowsay" with a random "-f"-file. All additional parameters and piping will be passed on onto the cowsay command
# Dependecies: "cowsay"

#!/bin/bash


if [ -z "$1" ];then
printf "Gimme something to say dude!\n"
else
	cows=($(cowsay -l | tail -n +2))

	f=${cows[$RANDOM % ${#cows[@]}]}

	f=${f#"/usr/share/cowsay/cows/"}
	f=${f%".cow"}
	cowsay -f $f "$@"
fi
