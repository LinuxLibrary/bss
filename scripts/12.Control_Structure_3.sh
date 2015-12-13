#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015

################
## Main Code  ##
################

FILE1="test1"
FILE2="test2"

if [ "$FILE1" -nt "$FILE2" ]
then
  echo $FILE1 is newer
else
  echo $FILE2 is newer
fi

# End of File
