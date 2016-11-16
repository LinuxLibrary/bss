#!/bin/bash

# GIT Alias to status
git config --global alias.s "status -s"

A=`git s | grep '^A\|^AM\|^AR\|^AD^ A' | awk '{print $2}'`
U=`git s | grep ^? | awk '{print $2}'`
M=`git s | grep '^M\|^MA\|^MR\|^MM\|^MD\|^ M' | awk '{print $2}'`
R=`git s | grep '^R\|^RA\|^RM\|^RR\|^RD\|^ R' | awk '{print $4}'`
D=`git s | grep '^D\|^ D' | awk '{print $2}'`

function add {
	for i in `echo $A`
	do
		git add $i
		git commit -m "Added $i"
	done
}

function stgnew {
	for i in `echo $U`
	do
		git add $i
		git commit -m "Added $i"
	done
}

function modify {
	for i in `echo $M`
	do
		git add $i
		git commit -m "Modified $i"
	done
}

function rename {
	for i in `echo $R`
	do
		R1=`git s | grep $i | awk '{print $2}'`
		R2=`git s | grep $i | awk '{print $4}'`
		git add $R2
		git commit -m "Renamed/Moved $R1 to $R2"
	done
}

function delete {
	for i in `echo $D`
	do
		git add $i
		git commit -m "Removed $i"
	done
}

if [[ -z $(git s) ]]
then
	echo "There are neither additions nor deletions to stage"
else
	for i in A U M R D
	do
		case $i in
		A)
			add
		;;
		U)
			stgnew
		;;
		M)
			modify
		;;
		R)
			rename
		;;
		D)
			delete
		;;
		esac
	done
	git push -fu origin master
fi

# END
