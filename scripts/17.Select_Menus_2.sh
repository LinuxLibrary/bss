#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Illustrate the basic usage of Select

###############
## Variables ##
###############

PS3='Please select a choice'
LIST="MySQL System Quit"

select i in $LIST
do
  if [ $i = "MySQL" ]
  then
    watch tail /var/log/mysqld.log
  elif [ $i = "System" ]
  then
    watch tail /var/log/messages
  elif [ $i = "Quit" ]
  then
    exit
  fi
done

# End of File
