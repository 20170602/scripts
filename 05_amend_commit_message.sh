#!/bin/bash

execute ()
{
	cd $1
	
	echo "Current history"
	git log --graph --decorate --oneline  --all
	
	git commit --amend -m "Initial commit"
	
	echo "History after amend"
	git log --graph --decorate --oneline  --all

}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi
