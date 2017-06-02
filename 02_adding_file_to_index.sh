#!/bin/bash
execute ()
{
	cd $1
	
	echo "State before changes"
	git status
	
	echo "Some description of the project" > README.md
	echo "This is not what we are going to add" > SomeNotImportantFile.txt
	echo "Garbage" > trash.bin
	echo "On a dark desert highway, cool wind in my hair
Warm smell of colitas, rising up through the air
Up ahead in the distance, I saw a shimmering light
My head grew heavy and my sight grew dim
I had to stop for the night." > Poetry.txt
	
	echo "State after adding changes to woring directory"
	git status
	
	git add README.md
	git add Poetry.txt
	git add trash.bin
	
	echo "State after adding changes to index"
	git status
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi

