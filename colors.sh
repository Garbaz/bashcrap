#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Terminal Colors
# Description: This script prints all 256 colors avaible in most terminals with their according decimal value. This might not work is some shell emulators, due to color restrictions.
# Dependecies: -


#!/bin/bash

for i in {0..255}; do

echo -en "\e[38;5;"$i"m$i\t"

done

echo -e "\e[m39"
