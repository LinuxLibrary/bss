#!/bin/bash

LIMIT=19
a=0
while [ "$a" -le "$LIMIT" ]
do
	a=$(($a+1))
	if [ "$a" -gt 2 ]
	then
		break # Skip entire rest of loop.
	fi
	echo -n "$a "
done
echo -e \n\n\n
exit 0
