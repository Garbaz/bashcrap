#Author: Garbaz
# E-Mail: garbaz@t-online.de
# Project: Unicode Dump
# Description: This script prints all 65636 unicode utf-8 characters and their respective hexvalue.
# Dependecies: -

#!/bin/bash

for e in {0..65535}; do
h=$(printf "%x" $e)
echo -n "$h:"
echo -en "\u$h \t"
done
echo ""
