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
	git checkout $from

	git checkout -b $newName

	doCommits $teamName $featureName 3

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

git checkout -b team1_sprint

git checkout -b team2_sprint

git checkout team1_sprint

createBranch team1_sprint feature1 team1 feature1

createBranch team2_sprint feature3 team2 feature3

createBranch team1_sprint feature2 team1 feature2

createBranch team2_sprint feature4 team2 feature4

git checkout team1_sprint

git rebase feature1

git rebase feature2

git checkout team2_sprint

git rebase feature3

git rebase feature4

git checkout develop

git rebase team1_sprint

git rebase team2_sprint

git checkout master

git rebase develop

git log --graph --all --oneline --decorate

git checkout master

git branch -D feature1

git branch -D feature2

git branch -D feature3

git branch -D feature4

git branch -D team1_sprint

git branch -D team2_sprint

git log --graph --all --oneline --decorate
