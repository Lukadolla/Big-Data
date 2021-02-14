#!/bin/bash

declare -A map

new_col=""
index=""

while IFS= read -r line
do
     key=`cut -d" " -f1 <<< "$line"`
     val=`cut -d" " -f2 <<< "$line"`
     map["$key"]="$val"

do < short_stem.txt

for col in {1..39}
do
     header=`cut -d"," -f$col $1 | head -n 1`

     if [ "$header" == "title" ]
     then
          column=`cut -d"," -f$i $1`

       for key in "${!map[@]}"
       do
          new_col=`sed 's/"$col"/"${map[$col]}"`
       done
      index=$col
      break
     fi
done

paste -d"," <(cut -d"," -f1-$(($index-1)) "$1") <(echo "$new_col") <(cut -d"," -f$(($index+1))-39 "$1") > task6d.csv
