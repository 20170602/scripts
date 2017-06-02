#!/bin/bash

execute ()
{
	cd $1
	
	git checkout -b develop
	
	echo "some content" > develop.file
	
	git add develop.file
	
	git commit -m "preparing develop branch"
	
	git checkout -b lyrics
	
	echo "" > song.txt
	
	git add song.txt
	
	git commit -m "Initial commit for lyrics feature branch"
	
	git checkout -b california
	
	git checkout -b hotel
	
	echo "On a dark desert highway, cool wind in my hair
Warm smell of colitas, rising up through the air
Up ahead in the distance, I saw a shimmering light
My head grew heavy and my sight grew dim
I had to stop for the night." >> song.txt

	git add song.txt
	
	git commit -m "verse #1"
	
	git checkout california
	
	echo "There she stood in the doorway;
I heard the mission bell
And I was thinking to myself
'This could be heaven or this could be Hell'
Then she lit up a candle and she showed me the way
There were voices down the corridor,
I thought I heard them say" >> song.txt

	git add song.txt
	
	git commit -m "verse #2"
	
	git log --graph --decorate --oneline  --all
	
	git checkout hotel
	
	echo "Welcome to the Hotel California
Such a lovely place (such a lovely place)
Such a lovely face.
Plenty of room at the Hotel California
Any time of year (any time of year) you can find it here" >> song.txt

	git add song.txt
	
	git commit -m "verse #3"
	
	git checkout california
	
	echo "Her mind is Tiffany-twisted, she got the Mercedes bends
She got a lot of pretty, pretty boys, that she calls friends
How they dance in the courtyard, sweet summer sweat
Some dance to remember, some dance to forget" >> song.txt

	git add song.txt
	
	git commit -m "verse #4"
	
	git log --graph --decorate --oneline  --all
	
	git checkout hotel
	
	echo "So I called up the Captain,
'Please bring me my wine'
He said, 'we haven't had that spirit here since nineteen sixty-nine'
And still those voices are calling from far away,
Wake you up in the middle of the night
Just to hear them say" >> song.txt

	git add song.txt
	
	git commit -m "verse #5"
	
	git checkout california
	
	echo "Welcome to the Hotel California
Such a lovely place (such a lovely place)
Such a lovely face.
They livin' it up at the Hotel California
What a nice surprise (what a nice surprise), bring your alibis" >> song.txt

	git add song.txt
	
	git commit -m "verse #6"
	
	git log --graph --decorate --oneline  --all
	
	
	
}

if [ ${#1} -gt 0 ] && [ -d $1 ] && [ -d "$1/.git" ]
then
	execute "$@"
else
	echo "Please input the repository directory"
fi
