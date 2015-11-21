# Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: STDIN to random color
# Description: This script colors each character from stdin in a random color
# Dependencies: -

#!/bin/bash

trap ctrl_c INT
function ctrl_c() {
	printf "\e[39m"
	IFS=$non
	exit -1
}
non=$IFS
IFS=''
while read -r i; do
	IFS=$non
	for c in $(seq 0 ${#i}) ;do
		color=$(($RANDOM % 214 + 17))
		printf "\e[38;5;$color""m"
		echo -n "${i:$c:1}"
	done
	printf "\n"
	printf "\e[39m"
	IFS=''
done
IFS=$non
