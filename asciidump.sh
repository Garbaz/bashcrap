# Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Ascii Dump
# Description: This shell script prints out the one byte ascii characters with the respective hex value. Piping the output is not recommended, since the first 0x20 characters are OP codes which might lead to unwanted behaviour.
# Dependencies: -

#!/bin/bash

for e in {0..255}; do
h=$(printf "%x" $e)
echo -n "$h:"
echo -en "\x$h \t"
done
echo ""
