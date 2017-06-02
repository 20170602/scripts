#!/bin/bash
execute ()
{
	cd $1

	echo "Current local configuration:"
	CURRENT_CONFIG=`git config --local -l`
	echo "$CURRENT_CONFIG"

	USER_NAME_LOCAL="20170602_demo_"$RANDOM

	echo
	echo "Input your email"
	read EMAIL

	echo "Setting user name"
	git config --local user.name $USER_NAME_LOCAL

	echo "Setting user email"
	git config --local user.email $EMAIL

	echo "Setting long paths to true"
	git config --local core.longpaths true

	echo 
	echo "Ammended local configuration:"
	AMENDED_CONFIG=`git config --local -l`
	echo "$AMENDED_CONFIG"
	diff <( echo "$CURRENT_CONFIG" ) <( echo "$AMENDED_CONFIG" )
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi