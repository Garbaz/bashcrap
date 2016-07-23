#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Terminal Colors
# Description: This script prints all 256 colors avaible in most terminals with their according hexadecimal value. This might not work is some shell emulators, due to color restrictions.
# Dependecies: -


#!/bin/bash

for i in {0..255}; do

printf "\e[38;5;$i"m"Color: %i\n" $i

done

printf "\e[39m"
