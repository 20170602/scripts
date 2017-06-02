#!/bin/bash
execute ()
{
	cd $1
	
	echo "History before commit"
	git log --graph --decorate --oneline  --all
	
	git commit -m "Starting point commit"
	
	echo "State after commit"
	git status
	
	echo "Current history"
	git log --graph --decorate --oneline  --all
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi

