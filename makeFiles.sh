#!/bin/bash

## This script takes all the characters below and makes a .scad file
## for each, based off of the FOOBAR file

EVERYTHING="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890.&#"
TEMPLATE="FOOBAR.scad"

## https://stackoverflow.com/a/7579022
chars=$(echo "$EVERYTHING" | grep -o .)

for c in $chars; do
    fname="$c".scad
    if [[ $c == "&" ]]; then fname="and.scad"; fi
    if [[ $c == "." ]]; then fname="dot.scad"; fi
    if [[ $c == "#" ]]; then fname="num.scad"; fi
    [[ -s "$fname" ]] && continue
    cat "$TEMPLATE" | sed 's/FOOBAR/'$c'/' > "$fname"
    echo "$c = $fname"
done
