#########################################################################
# 2dll: A script to display (multiline) ascii art animations.           #
# --------------------------------------------------------------------- #
#                                                                       #
# Give a file location as the first argument for the script.            #
# The file should only contain the frames, with an empty line between   #
# each frame.                                                           #
# To print an empty line in a frame use  '\ ' (With the space!).        #
# The script won't clear the screen after each frame, so make sure      #
# every frame has the same character width and height (Use spaces if    #
# required).                                                            #
# If you want the animation to end after the last frame instead of      #
# looping, give "nope" as the second argument. Any different string for #
# the second argument will cause the animation to loop.                 #
# If you want to set a specific time to be waited between frames, give  #
# that as the third argument in seconds (default is 0.5 seconds).       #
#                                                                       #
# "./2dll.sh FILE [LOOP] [TIME]"                                        #
#                                                                       #
# Script by: Garbaz (garbaz@t-online.de)                                #
#########################################################################

#!/bin/bash

noloop="nope"

trap ctrl_c INT

function ctrl_c() {
 tput cvvis
 exit 0
}

if [[ -z $1 ]];then
printf "\nPlease provide the file:\n"
printf "\"./2dll.sh FILE [LOOP] [TIME]\"\n\n"
exit 1
fi

if [[ -z $3 ]];then
t="0.5"
else
t=$3
fi

file=`cat $1`

tput clear
tput civis

while true; do
l=0
while read line; do
tput cup $l 0
l=$(($l + 1))
if [[ -z $line ]]; then
l=0
sleep $t
else
printf "$line"
fi
done <<< "$file"
sleep $t
if [[ "$2" == "$noloop" ]]; then
printf "\n"
break
fi
done
