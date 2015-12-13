#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015

################
## Main Code  ##
################

# Testing Apache

netstat -ant | grep :80 > /dev/null
APACHESTATUS = $?

if [ "$APACHESTATUS" -eq 0 ]
then
  echo Apache is up and running.

# Testing MySQL

  netstat -ant | grep :3306 > /dev/null
  MYSQLSTATUS = $?

    if [ $MYSQLSTATUS != 0 ]
    then
     echo MySQL is not running.
    fi
else
  echo Apache is not running
fi

# End of File
