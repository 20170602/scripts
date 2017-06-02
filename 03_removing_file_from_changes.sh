#!/bin/bash
execute ()
{
	cd $1
	
	echo "State before changes"
	git status
	
	git rm --cached Poetry.txt
	git rm -f trash.bin
	
	echo "State after removing changes from index"
	git status
	
	echo "Note that Poetry.txt is now not in staging area but present in working directory"
	echo "But trash.bin has been removed completely"
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi

