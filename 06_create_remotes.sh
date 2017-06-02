#!/bin/bash

execute ()
{
	cd $1
	
	echo "Current remotes configuration:"
	git remote -v
	
	git remote add github https://github.com/20170602/20170602.git
	git remote add bitbucket https://20170602@bitbucket.org/20170602/20170602.git
	
	echo "Updated remotes configuration:"
	git remote -v
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi
