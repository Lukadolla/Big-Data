#!/bin/bash

input="$1"
cut_columns="1,2,3,34"

for col in  {4..58}; do

      if [ $( tail -n +2 "$input" | cut -f$col -d"," | grep -c -v "^$" ) -eq 0 ]; then
             cut_columns="$cut_columns,$col"
      fi
done

cut -d, -f$cut_columns --complement $input > task1+2.csv
