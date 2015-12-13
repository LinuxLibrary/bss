#!/bin/bash
# Author: Arjun Shrinivas
# Date: 24-Jan-2015

################
## Main Code  ##
################

for countries in USA Africa Latvia Germany Jamica
  do
  if [ "$countries" = "USA" ]
  then
   echo Welcome to USA
  elif [ "$countries" = "Jamica" ]
  then
   echo One Love
  else
   echo $countries
  fi
done

# End of File
