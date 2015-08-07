#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Cow List
# Description: This script simply lists all .cow Cows. Each one will say "Hello I am X" whereby X is the name of the cow.
# Dependecies: cowsay

#!/bin/bash

cows=/usr/share/cows/*

for f in $cows; do

f=${f#"/usr/share/cows/"}
f=${f%".cow"}

cowsay -f $f "Hello I'm $f"
echo -e "\n"

done
