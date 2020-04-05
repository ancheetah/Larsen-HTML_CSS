#!/bin/bash

# My first bash script
# I wrote this before my dumbass realized I have to create the remote
# repository on Github first anyways. This script will not execute the
# push command until the remote repository already exists

echo "Are you in the root folder of your new project? [y/n]"
read CHOICE

if [ -d .git ] && [ "$CHOICE" = "y" ]; then
	echo "There is already an existing repository here. Aborting..."
	exit 1
elif [ "$CHOICE" == "y" ]; then
	
	git init

	REPONAME=$(basename "$PWD")
	REPONAME="$REPONAME.git"

	echo "git remote add origin git@github.com:ancheetah/"$REPONAME""
	git remote add origin git@github.com:ancheetah/"$REPONAME"
	git remote -v

	git add README
	git commit -m "README"

	git push -u origin master

else
	echo "Switch to the root directory. Aborting..."
	exit 1
fi
