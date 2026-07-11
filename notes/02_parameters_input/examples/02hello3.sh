#!/bin/bash
echo -n "Hello $(basename $0)! Como te llamas: "
read
echo "Hello $REPLY"
exit 0