#!/usr/bin/env bash
# Purpose : To shift through and print the arguments

echo -e "Current user :\t$USER"
COUNT=0
NUMBER=$#

while [ $COUNT -lt $NUMBER ]
do
	COUNT=`expr $COUNT + 1`
	TOKEN='$'"$COUNT"
	ARG=`echo $* | awk '{print $1}'`
	echo -e "\tArgument $COUNT: $ARG"
	shift
done
# END
