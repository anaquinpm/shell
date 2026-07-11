#!/bin/bash

echo "My name is `basename $0` - I was colled $0"
echo "I was colled with $# parameters"
count=1
while [ "$#" -ge "1" ]; do
	echo "Parameter number $count is: $1"
	let count=$count
	shift
done
