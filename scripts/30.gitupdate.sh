#!/bin/bash

echo "Please input your Repos parent directory"
read REPODIR
echo

if [[ -z $REPODIR ]]
then
	REPODIR="/e/Practice/GitRepos"
fi

for i in `echo $(ls $REPODIR | tr -d '/')`
do
	echo "Changing to $REPODIR/$i"
	cd $REPODIR/$i
	GITURL=`git remote -v | grep fetch | awk '{print $2}'`
	echo "Pulling all the changes from $GITURL <--- ..."
	git pull -ff origin master > /dev/null
	echo "Pushing all local commits to $GITURL ---> ..."
	git push -fu origin master > /dev/null
	echo
done
