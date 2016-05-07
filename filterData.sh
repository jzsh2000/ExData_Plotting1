#!/usr/bin/env bash
if [ ! -f $1 ]; then
    echo "File not found: $1" >&2
    exit 1
fi

unzip -c $1 | grep -e '^Date' -e '^[12]/2/2007;' > subset.txt
