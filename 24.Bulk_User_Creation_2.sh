#!/bin/bash

###############
## Variables ##
###############

HOSTS="/tmp/test/serverlist"
DDID="IDENTIFY"
HOMEPATH="/home/$UNAME"

###############
## Main Code ##
###############

for i in `cat $HOSTS` 
do
  UNIQUE=`awk -F " " '{print $1 }' $DDID`
  RUID=`ssh $i 'grep "$UNIQUE" /etc/passwd'`
  if [[ -ne "$RUID" ]]
  then
    echo "User ID is currently available on $i, ready to add new user"
    UNAME=`awk -F " " '{print $2 }' $DDID`
    PASSWORD=`awk -F " " '{print $3 }' $DDID`
    ROLE=`awk -F " " '{print $4 }' $DDID`
    `ssh $i useradd -u "$UNIQUE" -d "$HOMEPATH" -s /bin/bash -c "$ROLE" -m -k /etc/skel/ "$UNAME"`
    `ssh $i echo "$PASSWORD" | passwd --stdin "$UNAME"`
    else
    echo "User ID exist on $i, check new ID"
  fi
done
