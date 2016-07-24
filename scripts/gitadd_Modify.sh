#!/bin/bash

U=`git s | grep ^? | awk '{print $2}'`
A=`git s | grep ^A | awk '{print $2}'`
M=`git s | grep ^M | awk '{print $2}'`
D=`git s | grep ^D | awk '{print $2}'`
R=`git s | grep ^R | awk '{print $4}'`
for i in A M D R U
do
	if [[ -z $(git s) ]]
	then
		echo "There are neither additions nor deletions to stage"
	else
		case $i in
		A)
			echo "Adding $A to staging..."
			git add 
		M)
		elif [[ $i == $U ]]
		then
			echo "Adding $i to staging..."
			git add $i
		elif [[ $i == $M ]]
		then
			echo "Modifying $i and adding to staging..."
			git add $i
		elif [[ $i == $D ]]
		then
			echo "Deleting $i from repository..."
			git add $i
		elif [[ $i == $R ]]
		then
			R1=`git s | grep $i | awk '{print $2}'`
			R2=`git s | grep $i | awk '{print $4}'`
			echo "Renaming $R1 to $R2 ..."
			git add $R2
#		else
#			echo "Exiting..."
#			exit 0
		fi
	fi
done
