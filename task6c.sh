#!/bin/bash

list=""
new_col=""

index=0

while IFS= read -r line
do
     if [ "$line" == "yourselves" ]
     then
          list="${list}${line}"
     else
          list="${list}${line}|"
     fi
done < stopwords.txt

for col in {1..39}
do
    header=`cut -d"," -f"$col" $1 | head -n 1`

    if [ "$header" == "title" ]
    then
        column=`cut -d"," -f"$col" $1`
        new_col=`sed -r 's/\b"($list)"\b//g' <<< "$column"
        index=$col
    fi
done

paste -d"," <(cut -d"," -f1-$(($index-1)) "$1") <(echo "$new_col") <(cut -d"," -f$(($index+1))-39 "$1") > task6c.csv
