#!/bin/bash

makeRepo ()
{
	PARENT=`pwd`
	mkdir -v $1
	cd $1
	git init
	git status
	cd $PARENT
}

makeRepo repo

makeRepo other_repo