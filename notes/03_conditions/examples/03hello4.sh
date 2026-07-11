#!/bin/bash
echo "You are using $(basename $0)"
[ -z $1 ] || echo "Hello $1" 	#[ ]: es  igual que test ; -z: verifica si $1 tiene 0bytes
exit 0
