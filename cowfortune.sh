#!/bin/bash

cows=(/usr/share/cows/*)

f=${cows[$RANDOM % ${#cows[@]}]}

f=${f#"/usr/share/cows/"}
f=${f%".cow"}
#echo "$f"
fortune | cowsay -f $f
echo ""
