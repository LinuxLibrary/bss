#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Used to move many files

###############
## Variables ##
###############

BADARG = 165
REQPARAM = 2
COUNT = `ls -A $1* | wc -l`

###############
## Main Code ##
###############

if [ $# != REQPARAM ]
then
  echo #REQPARAM positional parameters are required!
  exit $BADARG
fi

for file in `ls -A $1*`
do
  echo $file
  mv $file $file.2
  echo $COUNT file(s) moved successfully
done

# End of File
