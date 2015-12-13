#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose : Simple illustration of a until loop

################
## Variables  ##
################

NUM=100
MAX=20

################
## Main Code  ##
################

until [ $NUM -eq $MAX ]
 do
  echo $NUM
  let "NUM -= 1"
done

# End of File
