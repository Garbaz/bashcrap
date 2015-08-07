#!/bin/bash

for i in {0..255}; do

echo -en "\e[38;5;"$i"m$i\t"

done

echo -e "\e[m39"
