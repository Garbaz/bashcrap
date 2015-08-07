#!/bin/bash

while true; do
for i in $(seq 1 $(tput cols)); do
echo -en "$(($RANDOM % 2))"
done
echo ""
done
