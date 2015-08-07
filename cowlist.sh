#!/bin/bash

cows=/usr/share/cows/*

for f in $cows; do

f=${f#"/usr/share/cows/"}
f=${f%".cow"}

cowsay -f $f "Hello I'm $f"
echo -e "\n"

done
