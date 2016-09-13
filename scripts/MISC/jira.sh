#!/bin/bash

URL="https://XXXXXXXXXXX.atlassian.net/rest/api/2/search?"
QUERY='jql=project%20%3D%20"CXXXXX%20MXXXXXment"%20AND%20resolutiondate%20is%20not%20EMPTY%20AND%20installed%20not%20in%20(Failed%2C%20No)%20AND%20cf%5B16002%5D%20%3D%20production%20AND%20component%20in%20("XXXXXXXX%20VAN")%20ORDER%20BY%20resolved%20DESC'
RESULT=$(curl -s -u XXXXXXXXXXXXXX:XXXXXXXX $URL$QUERY)
OUTPUT1=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["issues"][0]["fields"]["resolutiondate"]'`
OUTPUT2=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["issues"][0]["key"]' | tr -d 'CHGMGMT-'`
OUTPUT3=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["total"]'`
#OUTPUT4=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["issues"][0]["summary"]'`
RESOLUTION=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["issues"][0]["fields"]["resolutiondate"]'`
RESDATE=`echo $RESOLUTION | awk -F- '{ print $1$2$3 }' | awk -FT '{ print $1 }'`
RESHOUR=`echo $RESOLUTION | awk -FT '{ print $2 }' | awk -F: '{print $1}'`
RESMIN=`echo $RESOLUTION | awk -FT '{ print $2 }' | awk -F: '{print $2}'`
UPDATED=`echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["issues"][0]["fields"]["updated"]'`
UPDDATE=`echo $UPDATED | awk -F- '{ print $1$2$3 }' | awk -FT '{ print $1 }'`
UPDHOUR=`echo $UPDATED | awk -FT '{ print $2 }' | awk -F: '{print $1}'`
UPDMIN=`echo $UPDATED | awk -FT '{ print $2 }' | awk -F: '{print $2}'`
CURDATE=`date +"%Y%m%d"`
CURHOUR=`date +%H`
CURMIN=`date +%M`

if [[ ! -z $RESOLUTION ]]; then
	if [[ $CURHOUR -ge $RESHOUR ]] && [[ $CURMIN -ge $RESMIN ]]; then
		DAYS=`expr $CURDATE - $RESDATE`
		HOURS=`expr $CURHOUR - $RESHOUR`
		MINS=`expr $CURMIN - $RESMIN`
	elif [[ $CURHOUR -ge $RESHOUR ]] && [[ $CURMIN -lt $RESMIN ]]; then
		DAYS=`expr $CURDATE - $RESDATE`
                HOURS=`expr $CURHOUR - $RESHOUR - 1`
                MINS=`expr $(expr $CURMIN + 60) - $RESMIN`
	elif [[ $CURHOUR -lt $RESHOUR ]] && [[ $CURMIN -ge $RESMIN ]]; then
		DAYS=`expr $CURDATE - $RESDATE - 1`
                HOURS=`expr $(expr $CURHOUR + 24) - $RESHOUR`
                MINS=`expr $CURMIN - $RESMIN`
	elif [[ $CURHOUR -lt $RESHOUR ]] && [[ $CURMIN -lt $RESMIN ]]; then
		DAYS=`expr $CURDATE - $RESDATE - 1`
                HOURS=`expr $(expr $CURHOUR + 24) - $RESHOUR - 1`
                MINS=`expr $(expr $CURMIN + 60) - $RESMIN`
	fi
        echo -e "Days=$DAYS\nHours=$HOURS\nMins=$MINS"
	if [[ $DAYS -ne 0 ]]; then
		TOTALMINS=`expr $(expr $DAYS \* 24) \* $(expr $HOURS \* 60) + $MINS`
	else
		TOTALMINS=`expr $(expr $HOURS \* 60) + $MINS`
	fi
	echo -e "Total-in-Mins=$TOTALMINS"
elif [[ ! -z $UPDATED ]]; then
        if [[ $CURHOUR -ge $UPDHOUR ]] && [[ $CURMIN -ge $UPDMIN ]]; then
                DAYS=`expr $CURDATE - $UPDDATE`
                HOURS=`expr $CURHOUR - $UPDHOUR`
                MINS=`expr $CURMIN - $UPDMIN`
        elif [[ $CURHOUR -ge $UPDHOUR ]] && [[ $CURMIN -lt $UPDMIN ]]; then
                DAYS=`expr $CURDATE - $UPDDATE`
                HOURS=`expr $CURHOUR - $UPDHOUR - 1`
                MINS=`expr $(expr $CURMIN + 60) - $UPDMIN`
        elif [[ $CURHOUR -lt $UPDHOUR ]] && [[ $CURMIN -ge $UPDMIN ]]; then
                DAYS=`expr $CURDATE - $UPDDATE - 1`
                HOURS=`expr $(expr $CURHOUR + 24) - $UPDHOUR`
                MINS=`expr $CURMIN - $UPDMIN`
        elif [[ $CURHOUR -lt $UPDHOUR ]] && [[ $CURMIN -lt $UPDMIN ]]; then
                DAYS=`expr $CURDATE - $UPDDATE - 1`
                HOURS=`expr $(expr $CURHOUR + 24) - $UPDHOUR - 1`
                MINS=`expr $(expr $CURMIN + 60) - $UPDMIN`
        fi
        echo -e "Days=$DAYS\nHours=$HOURS\nMins=$MINS"
        if [[ $DAYS -ne 0 ]]; then
                TOTALMINS=`expr $(expr $DAYS \* 24) \* $(expr $HOURS \* 60) + $MINS`
        else
                TOTALMINS=`expr $(expr $HOURS \* 60) + $MINS`
        fi
        echo -e "Total-in-Mins=$TOTALMINS"
fi

echo "Time=$OUTPUT1"
echo "Ticket=$OUTPUT2"
echo "Total=$OUTPUT3"
#echo "Summary=$OUTPUT4"

