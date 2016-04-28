#!/usr/bin/env bash
# Purpose : To shift through the arguments

echo $USER
COUNT=0
NUMBER=$#

while [ $COUNT -lt $NUMBER ]
do
	COUNT=`expr $COUNT + 1`
	TOKEN='$'"$COUNT"
	ARG=`echo $* | awk '{print $1}'`
	echo -e "\tArgument $COUNT: $ARG \n"
	shift
done
# END
