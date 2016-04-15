#!/bin/bash
# Author : Arjun Shrinivas
# Purpose : To know the modification history of a specific file

echo -e "Usage : /bin/bash `basename $0` <filename>"
FILE=$1
 
# USERS=`grep /bin/bash /etc/passwd | grep -v root | awk -F: '{print $1}'`
USERS=`grep /bin/bash /etc/passwd | awk -F: '{print $1}'`
 
if [[ ! -z results.txt ]]
then
        :> results.txt
fi
for i in `echo $USERS`
 do
	case $i in 
	root)
	HISTORY="/root/.bash_history"
	;;
	*)
        HISTORY="/home/$i/.bash_history"
	;;
	esac
	ENCDATE=`sed -ne '/'"$FILE"'/{x;p;d;}' -e x $HISTORY | grep -v ^[a-z] | tail -n1`
        if [[ ! -z $ENCDATE ]]
        then
		COMMAND=`sed -ne '/'"$ENCDATE"'/,+1p' $HISTORY | tail -n1`
		MODDATE=`echo $ENCDATE | tr '#' '@'`
		DATE=`date -d $MODDATE +'%F %T'`
                echo -e "$i\t$DATE\t$COMMAND" >> results.txt
        fi
 done

more results.txt | sort -k2
