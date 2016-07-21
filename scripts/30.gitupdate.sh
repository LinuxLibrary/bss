#!/bin/bash

echo "Please input your Repos parent directory"
read REPODIR
echo

if [[ -z $REPODIR ]]
then
	REPODIR="/e/Practice/GitRepos"
fi

#for i in `echo $(ls $REPODIR | tr -d '/')`
for i in `echo $(cd $REPODIR && find ./ -type d -name .git -exec echo {} \; | awk -F/.git$ '{print $1}' | awk -F^./ '{print $2}')`
do
	echo "Changing to $REPODIR/$i"
	cd $REPODIR/$i
	GITURL=`git remote -v | grep fetch | awk '{print $2}'`
	ACCOUNT=`echo $GITURL | awk -F.com/ '{print $2}' | awk -F.git$ '{print $1}'`
	echo "Updating $ACCOUNT ..."
	echo "Pulling all the changes from $GITURL <--- ..."
	git pull -ff origin master > /dev/null
	PUSHCHK=`git lg | head -n1 | grep -v origin/master`
	if [[ ! -z $PUSHCHK ]]
	then
		echo "Pushing all local commits to $GITURL ---> ..."
		git push -fu origin master > /dev/null
	else
		echo "ORIGIN is up-to date. No commits found to push!"
	fi
	echo
done
