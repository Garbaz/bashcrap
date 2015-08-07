#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Cow Fortune
# Description: This script takes the usual "fortune | cowsay" a bit further by taking a random .cow file. It will print a random quote, joke or whatever "fortune" gives you and pipes it into the cowsay command.
# Dependecies: "cowsay", "fortune"

#!/bin/bash

cows=(/usr/share/cows/*)

f=${cows[$RANDOM % ${#cows[@]}]}

f=${f#"/usr/share/cows/"}
f=${f%".cow"}
#echo "$f"
fortune | cowsay -f $f
echo ""
