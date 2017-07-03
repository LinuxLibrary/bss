#!/bin/bash

echo "Please input your Repos parent directory"
read REPODIR
echo -e "\nUpdading $REPODIR...\n"

if [[ -z $REPODIR ]]
then
	REPODIR="/GitHub"
fi

echo "Updating ACCOUNT PUSH-STATUS PULL-STATUS" | awk '{printf "%-10s %-65s %-15s %-15s\n",$1,$2,$3,$4}'
for i in `echo $(cd $REPODIR && find ./ -type d -name .git -exec echo {} \; | awk -F/.git$ '{print $1}' | awk -F^./ '{print $2}')`
do
	cd $REPODIR/$i
	GITURL=`git remote -v | grep fetch | awk '{print $2}'`
	ACCOUNT=`echo $GITURL | awk -F.com/ '{print $2}' | awk -F.git$ '{print $1}'`
	GPLOUT=$(git pull -ff origin master 2>&1)
	GPLSUCCESS=$(echo $GPLOUT | grep up-to-date)
	GPLCOMMITS=$(echo $GPLOUT | grep Updating)
	if [[ ! -z $GPLSUCCESS ]]
	then
		PULLOUT="UP-TO-DATE"
	elif [[ ! -z $GPLCOMMITS ]]
	then
		PULLOUT="COMMITS-PULLED"
	fi
	PUSHCHK=`git lg | head -n1 | grep -v origin/master`
	if [[ ! -z $PUSHCHK ]]
	then
		GPSOUT=$(git push -fu origin master 2>&1)
		GPSSUCCESS=$(echo $GPSOUT | grep "To.*git$")
		GPSDENIED=$(echo $GPSOUT | grep "Permission.*denied")
		WARNFILE="/tmp/gitwarn.tmp"
		if [[ ! -z $GPSSUCCESS ]]
		then
			PUSHOUT="COMMITS-PUSHED"
		elif [[ ! -z $GPSDENIED ]]
		then
			echo -e "$GPSDENIED" >> $WARNFILE
			PUSHOUT="ACCESS_DENIED"
		fi
	else
		PUSHOUT="UP-TO-DATE"
	fi
	echo  "Updating $ACCOUNT $PUSHOUT $PULLOUT" | awk '{printf "%-10s %-65s %-15s %-15s\n",$1,$2,$3,$4}'
done

if [[ ! -z $WARNFILE ]]
then
	echo
	more $WARNFILE
	rm -rf $WARNFILE
else
	exit 0
fi
