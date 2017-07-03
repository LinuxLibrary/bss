#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015
# Purpose : Until loop to check whether a host is up or down in a network

################
## Main Code  ##
################

until [ $STATUS -eq 0 ]
 do
  ping -c 1 192.168.1.1
  echo The host is down
  STATUS = `echo $?`
done

# End of File
