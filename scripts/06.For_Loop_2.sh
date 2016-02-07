#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose : For loop to get a count of, and display the number of users on the system

################
## Variables  ##
################

PASSFILE="/etc/passwd"
COUNT=0

################
## Main Code  ##
################

for user in $(cat $PASSFILE | cut -f1 -d ':')
  do
  echo $user
  let "COUNT += 1"
done

echo There are $COUNT users registered on the system.

# End of File
