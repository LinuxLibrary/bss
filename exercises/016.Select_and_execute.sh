#!/bin/bash

echo -e "1) a \n 2) b \n 3) c \n 4) d " 
echo "select any one:"

read a
case $a in
	a) echo -e "enter either a1 or a2 or a3"
	read a1
	case $a1 in
		a1) echo "one";;
		a2) echo "two";;
		a3) echo "three";;
	esac
	;;
b) echo "case two selected";;
c) echo "case three selected";;
esac
