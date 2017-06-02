#!/bin/bash

execute ()
{
	cd $1
	
	echo "Pushing to GitHub"
	git push github master
	# If you have issues with preexisting account on Windows
	# you can remove default credentials by 
	# Control Panel -> User Accounts -> Credential Manager -> Windows Credentials -> Generic Credentials
	
	echo "Pushing to BitBucket"
	git push bitbucket master
	
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi
