#!/bin/bash

ENVS="production preprod stage test dev blade"
for ENV in $ENVS
do
	URL="https://XXXXXXXXXXX.atlassian.net/rest/api/2/search?jql=project%20%3D%20CHGMGMT%20and%20cf%5B16002%5D%20%3D%20$ENV"
	RESULT=$(curl -s -u XXXXXXXXXX:xxxxxxxx $URL)
	COUNT=$(echo $RESULT | python -c 'import sys, json; print json.load(sys.stdin)["total"]')
	echo "$ENV=$COUNT"
done
