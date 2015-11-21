# Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: STDIN to rainbow
# Description: This script will color all text it gets from stdin and print it colored character wise. It isn't truly a rainbow, but rather just the terminal colors from 17 to 231.
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
color=16
while read -r i; do
	IFS=$non
	for c in $(seq 0 ${#i});do
		color=$(($color + 1))
		if [[ "$color" == "232" ]];then
			color=17
		fi
		printf "\e[38;5;$color""m"
		echo -n "${i:$c:1}"
	done
	printf "\n"
	printf "\e[39m"
	IFS=''
done
IFS=$non
