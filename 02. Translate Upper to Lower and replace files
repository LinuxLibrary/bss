#!/bin/bash
# Author:	Arjun Shrinivas
# Date:	24-Jan-2015
# Purpose:	Illustrate using tr in a script to convert upper to lower filenames

################
##  Variables ##
################

myscriptname=`basename $0`;

################
##  Main Code ##
################

for i in `ls -A`
do
  if [[ $i = $myscriptname ]]
    then
    echo " Sorry can't rename myself!"
  elif [[ $i != $myscriptname ]]
    newname=`echo $i | tr A-Z a-z`
    mv $i $newname
  fi
done

# End of File
