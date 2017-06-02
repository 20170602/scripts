#!/bin/bash
REPOS="repo other_repo"

key=$RANDOM
echo "type $key"
read input

if [ "$input" -eq "$key" ]
then
	rm -rf $REPOS
else
	echo "wrong"
fi