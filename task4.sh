#!/bin/bash

input="$1"
created_column=""
retrieved_column=""

for col in {1..39}; do
       column=`cut -d"," -f"$col" "$input" | tail -n +2`
       header=`cut -d"," -f"$col" "$input" | head -n 1`

       if [ "$header" == "created_utc" ]; then
           created_column="$header"
           while IFS= read -r line; do
                 new_line=$(date -d @"$line" +%B)
                 created_column="$created_column
$new_line"
           done <<< "$column"

      fi

      if [ "$header" == "retrieved_on" ]; then
          retrieved_column="$header"
          while IFS read -r line; do
                new_line=$(date -d @"$line" +%B)
                retrieved_column="$retrieved_column
$new_line"

          done <<< "$column"

      fi
done

paste -d"," <(cut -d"," -f1-7 "$input") <(echo "$created_column") <(cut -d"," -f9-26 "$input") <(echo "$retrieved_column") <(cut -d"," -f28-39 "$input") > task4.csv
