#!/bin/bash
file="text.txt"
for var in $(cat $file)
do
  echo " $var"
done
