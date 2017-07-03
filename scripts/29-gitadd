#!/bin/bash

for i in `git s | grep -v '^D' | awk '{print $2}'`
do
	if [[ -z $i ]]
	then
		echo "There are neither additions nor deletions to stage"
	else
		echo "Adding $i to staging..."
		git add $i
	fi
done
