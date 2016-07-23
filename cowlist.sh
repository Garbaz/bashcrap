#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Cow List
# Description: This script simply lists all .cow Cows. Each one will say "Hello I am X" whereby X is the name of the cow.
# Dependecies: cowsay, tail

#!/bin/bash

cows="$(cowsay -l | tail -n +2)"

for f in $cows; do

cowsay -f $f "Hello I'm $f"
printf "\n"

done
