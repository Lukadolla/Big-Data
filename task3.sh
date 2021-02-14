#!/bin/bash
input="$1"
cut_columns=""

for col in {1..43}; do
         column=`cut -d"," -f$col $input | tail -n +2`Â
         first=`head -q -n 1 <<<"$column"`
         lineToCut=0
       while IFS= read -r line; do
           if [ "$line" != "$first" ]; then
                  lineToCut=1
           fi

  done <<< "$column"

  if [ $lineToCut -eq 0 ]; then
       if [ "$cut_columns" == "" ]; then
            cut_columns="$col"
       else
            cut_columns="$cut_columns,$col"
       fi
  fi

done

cut -d"," -f$cut_columns --complement $input > task3.csv
