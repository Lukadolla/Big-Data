#!/bin/bash

input="$1"

echo "$(tail -n+2 $input | cut -d, -f8 | sort | uniq -c)"
