#!/bin/bash

for var1 in `ls `
do
	echo "this is my for loop"
	if test -e $var1
	then
		echo $var1
		mv $var1 b$var1
	fi
done
