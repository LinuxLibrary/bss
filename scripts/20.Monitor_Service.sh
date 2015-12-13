#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Monitor a service

###############
## Variables ##
###############

netstat -ant | grep :3306
MYSQLSTATUS=`echo $?`
SERVICENAME="mysqld"
COUNT=0
THRESHOLD=2

###############
## Main Code ##
###############

if [ $MYSQLSTATUS != 0 ]
then
  while [ $COUNT -le $THRESHOLD ]
  do
    service $SERVICENAME start
    if [ $? != 0 ]
    then
      let "COUNT += 1"
    else
      exit 0
    fi
  done
  echo Problems starting $SERVICENAME | mail -s "$SERVICENAME Failure" root
else
  echo $SERVICENAME is running.
fi
# End of File
