#!/bin/bash

while read ip name alias
do
  if [ ! -z "$name" ]; then
	echo -en "IP is $ip	its name is $name"
	if [ ! -z "$alias" ]; then
	  echo "	alias: $alias"
	else
	  echo
	fi
  fi
done < /etc/hosts
