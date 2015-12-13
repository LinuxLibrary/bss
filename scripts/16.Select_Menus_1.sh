#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Illustrate the basic usage of Select

###############
## Variables ##
###############

PS3='Please select a choice'
LIST="Choice1 Choice2 Quit"

###############
## Main Code ##
###############

select i in $LIST
do
  if [ $i = "Choice1" ]
  then
    echo "Hello world."
  elif [ $i = "Choice2" ]
  then
    echo "Goodbye world."
  elif [ $i = "Quit" ]
  then
    exit
 fi
done

# End of File
