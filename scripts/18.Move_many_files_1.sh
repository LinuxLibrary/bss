#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Used to move many files

###############
## Variables ##
###############

COUNT = `ls -A $1* | wc -l`

###############
## Main Code ##
###############

for file in `ls -Al test*`
do
  echo $file
  mv $file $file.old
done

echo $COUNT files moved successfully

# End of File
