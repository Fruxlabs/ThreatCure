#!/bin/bash

old=`grep "Mn" index.html | cut -d ">" -f2 | cut -d "<" -f1`
curl --silent --header "Authorization: xxxxxxxxxxxxxxxxxxxxxxxxxxxx" --header "Accept: application/json" --header "Content-Type: application/json" -k https://cmidng.fruxlabs.com/users/statistics -o stats.txt
sleep 2
msg=`cat stats.txt | grep correlation | cut -d ":" -f2 | cut -d "," -f1`
new=`numfmt --grouping $msg | cut -d "," -f1`
sed -i "s/$old/$new\Mn+/g" index.html
rm stats.txt
