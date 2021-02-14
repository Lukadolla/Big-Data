#!/bin/bash

new_col=""

for col in {1..39}
do
      header=`cut -d"," -f"$col" $1 | head -n 1`
       if [ "$header" == "title" ]
         then
         column=`cut -d"," -f"$col" $1`
         new_col=`tr [:upper:] [:lower] | tr -d [:punct:]`
       fi
done

paste -d"," <(cut -d"," -f1-$(($col-1)) "$1") <(echo "new_col") <(cut -d"," -f$(($i+1))-39 "$1") > task6a+b.csv

