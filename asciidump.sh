#!/bin/bash

for e in {0..255}; do
h=$(printf "%x" $e)
echo -n "$h:"
echo -en "\x$h \t"
done
echo ""
