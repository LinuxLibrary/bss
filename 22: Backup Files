#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose: Used to backup files/directories locally and store remotely

###############
## Variables ##
###############

BACKUPDIR="~/backup"
SCRIPTDIR="~/temp2"
BACKUPFILE="scripts.backup.`date +%F`.tgz"
BACKUPHOST=<Remote Host Name/IP>
COUNT=`ls $BACKUPDIR/scripts.* | wc -l`
THRESHOLD=7

###############
## Main Code ##
###############

if [ !-e $BACKUPDIR ]
then
  echo "Creating Backup Directory because it doesn't exists!"
  mkdir ~/$BACKUPDIR
fi

if [ $COUNT -le $THRESHOLD ]
then
  tar -czvf $BACKUPDIR/$BACKUPFILE $SCRIPTDIR > /dev/null
  if [ $? != 0 ]
  then
    echo "Problems creating $BACKUPFILE backupfile."
  else
    scp $BACKUPDIR/$BACKUPFILE $BACKUPHOST:
    if [ $? != 0 ]
    then
      echo "Problems copying $BACKUPFILE to $BACKUPHOST"
    fi
  fi
fi

# End of File
