# Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Bullshit / Oh so 1337
# Description: This scripts prints endlessly 1 and 0 (random). After every line a \n is issued, allowing for piping of the stdout (Try piping the output to "lolcat". It's amazing).
# Dependecies: "tput"

#!/bin/bash

while true; do
for i in $(seq 1 $(tput cols)); do
printf "$(($RANDOM % 2))"
#echo -n ""
done
printf "\n"
done
