#########################################################################
# 2dll: A script to display (multiline) ascii art animations.           #
# --------------------------------------------------------------------- #
#                                                                       #
# Give a file location as the first argument for the script.            #
# The file should only contain the frames, with an empty line between   #
# each frame.                                                           #
# To print an empty line in a frame, just put a space in there, so that #
# it only looks empty.                                                  #
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

#################################
# TODO:                         #
# - Enable easier use of spaces #
#                               #
#################################

#!/bin/bash

IFS='' #Do not remove spaces!

noloop="nope" #When the second argument is equal this string, do not loop

trap ctrl_c INT # Trap interrupting to make the cursor visible again

function ctrl_c() { 
 IFS=' '
 tput cvvis
 exit 0
}

#Check whether the first argument was given. Write warning and terminate if not
if [[ -z $1 ]];then
printf "\nPlease provide the file:\n"
printf "\"./2dll.sh FILE [LOOP] [TIME]\"\n\n"
exit 1
fi

#Check whether the third argument was given. Set the T to 0.5 if not
if [[ -z $3 ]];then
T="0.5"
else
T=$3
fi

#Read file and handle backslashes ("Prevent" handeling '\' as an escape char)
file=$(cat $1 | sed 's/\\/\\\\\\\\/g')
tput clear
tput civis

while true; do
l=0
while read line; do
tput cup $l 0 #Set cursor position
l=$(($l + 1)) # Increment line counter
if [[ -z $line ]]; then # Check for empty line
l=0 # Reset line counter. New frame will overwrite old one
sleep $T #Display frame for T seconds
else
printf "$line" # Print line (if not empty)
fi
done <<< "$file" # piping the file string into the read
sleep $T
if [[ "$2" == "$noloop" ]]; then
printf "\n"
break # Exit if looping were disabled
fi
done
IFS=' '
tput cvvis
