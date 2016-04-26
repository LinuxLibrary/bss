#!/usr/bin/env bash
# Purpose : To shift through the arguments

echo $USER
COUNT=0
NUMBER=$#

while [ $COUNT -lt $NUMBER ]
do
	COUNT=`expr $COUNT + 1`
#	COUNT += 1
	echo $COUNT
	TOKEN=$`echo $COUNT`
	echo $TOKEN
	ARG=`echo $TOKEN`
	echo $ARG
	echo -e "\tArgument $COUNT: $# \n"
	shift
done
# END
