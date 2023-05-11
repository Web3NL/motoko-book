#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

file="$1"

xxd -p "$file" | tr -d '\n' | sed 's/../\\&/g' 
