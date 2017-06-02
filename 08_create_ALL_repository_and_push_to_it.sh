#!/bin/bash

execute ()
{
	cd $1
	
	git checkout master	
	
	git remote -v	
	git remote add all https://github.com/20170602/20170602.git
	
	git remote -v
	git remote set-url --add --push all https://github.com/20170602/20170602.git
	
	git remote -v
	git remote set-url --add --push all https://20170602@bitbucket.org/20170602/20170602.git
	
	echo "This line should be pushed to two remotes simultaneously" >> README.md
	
	git status
	
	git add README.md
	
	git status
	
	git commit -m "Adding important note"
	
	git status
	git push all master	
	
	git log --graph --decorate --oneline  --all
	
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi
