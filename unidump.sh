#!/bin/bash

for e in {0..65535}; do
h=$(printf "%x" $e)
echo -n "$h:"
echo -en "\u$h \t"
done
echo ""
