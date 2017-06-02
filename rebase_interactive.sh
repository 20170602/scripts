#!/bin/bash

doCommits() 
{
	teamName=$1
	featureName=$2
	cnt=$3
	for i in `seq 1 $cnt`;
	do
		fileName=$featureName.file$i
		content="$featureName_s$i"
	
		echo $content > $fileName
		
		git add $fileName
		
		git commit -m "$teamName $featureName s$i"
	done    

}

createBranch() 
{
	from=$1
	newName=$2
	teamName=$3
	featureName=$4
	cnt=$5
	git checkout $from

	git checkout -b $newName

	doCommits $teamName $featureName $cnt

	git log --graph --all --oneline --decorate
}

git init $1

cd $1

echo "This is a git merge demonstration project" > README.md

git add README.md

git commit -m "Initial commit"

git checkout -b develop

echo "some content" > develop.file

git add develop.file

git commit -m "preparing develop branch"

createBranch develop feature1 team1 "Long-feature" 6

