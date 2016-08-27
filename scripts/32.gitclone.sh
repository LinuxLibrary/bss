#!/bin/bash

clear
read -p "Input your GitHub login name: " USER
# USER='vmsnivas'

read -s -p "GitHub login password: " PASSWORD
# PASSWORD='Admin_119'

echo
read -p "Input your GitHub org name: " ORG
# ORG='LinuxLibrary'

echo
read -p "Input your fullname: " FULLNAME
echo "Configuring Git user on $HOSTNAME"
git config --global user.name "$FULLNAME"
read -p "Input your email: " EMAIL
echo "Configuring Git email on $HOSTNAME"
git config --global user.email "$EMAIL"

echo
for name in $USER $ORG
do
	if [[ ! -z $USER ]] && [[ ! -d  /GitHub/users/$USER ]]
	then
		mkdir -p /GitHub/users/$USER/
	fi
	if [[ ! -z $ORG ]] && [[ ! -d /GitHub/orgs/$ORG ]]
	then
		mkdir -p /GitHub/orgs/$ORG/
	fi
done

USERREPOS="/GitHub/users/$USER"
ORGREPOS="/GitHub/orgs/$ORG"

UREPOCOUNT=0
function userrepos {
	if [[ ! -z $USER ]]
	then
		curl -s -u $USER:$PASSWORD https://api.github.com/users/$USER/repos > res.out
		URLS=`more res.out | jq '.[] .clone_url'`
		CLONE_URLS=`echo $URLS | sed -ne 's/https:\/\//git+ssh:\/\/git@/p' | tr -d '"'`
		for REPO in `echo $CLONE_URLS`
		do
			REPONAME=`echo $REPO | awk -F$USER/ '{print $2}' | sed -ne 's/.git//p'`
			if [[ ! -d $USERREPOS/$REPONAME ]]
			then
				mkdir -p $USERREPOS/$REPONAME
				cd $USERREPOS/$REPONAME
				git init >> usercloneres.out 2>&1
				git remote add -f origin $REPO >> usercloneres.out 2>&1
				git remote set-url origin $REPO >> usercloneres.out 2>&1
				git pull -ff origin master >> usercloneres.out 2>&1
				UREPOCOUNT=`expr $UREPOCOUNT + 1`
				echo -e "Cloned $USER/$REPONAME successfully!"
			else
				echo "Ignoring $USER/$REPONAME as repository exists!"
			fi
		done
	fi
}

OREPOCOUNT=0
function orgrepos {
	if [[ ! -z $USER ]] && [[ ! -z $ORG ]]
	then
		curl -s -u $USER:$PASSWORD https://api.github.com/orgs/$ORG/repos > res.out
		URLS=`more res.out | jq '.[] .clone_url'`
		CLONE_URLS=`echo $URLS | sed -ne 's/https:\/\//git+ssh:\/\/git@/p' | tr -d '"'`
		for REPO in `echo $CLONE_URLS`
		do
			REPONAME=`echo $REPO | awk -F$ORG/ '{print $2}' | sed -ne 's/.git//p'`
			if [[ ! -d $ORGREPOS/$REPONAME ]]
			then
				mkdir -p $ORGREPOS/$REPONAME
				cd $ORGREPOS/$REPONAME
				git init >> orgcloneres.out 2>&1
				git remote add -f origin $REPO >> orgcloneres.out 2>&1
				git remote set-url origin $REPO >> orgcloneres.out 2>&1
				git pull -ff origin master >> orgcloneres.out 2>&1
				echo -e "Cloned $ORG/$REPONAME successfully!"
				OREPOCOUNT=`expr $OREPOCOUNT + 1`
			else
				echo "Ignoring $ORG/$REPONAME as repository exists!"
			fi
		done
	elif [[ -z $ORG ]]
	then
		echo "You have no Git organizations!"
	fi
}

for OPT in USER ORG
do
	case $OPT in 
	USER)
#		:> usercloneres.out
		userrepos
		if [[ ! -z $USER ]]
		then
			echo -e "Cloned $UREPOCOUNT user repos of $USER successfully.\n"
		fi
	;;
	ORG)
#		:> orgcloneres.out
		orgrepos
		if [[ ! -z $ORG ]]
		then
			echo -e "Cloned $OREPOCOUNT user repos of $ORG successfully.\n"
		fi
	;;
	esac
done

echo -e "\n Successfully cloned `expr $UREPOCOUNT + $OREPOCOUNT` repos. \n"
