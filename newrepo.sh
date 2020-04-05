#!/bin/bash

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

	echo "Git repository is ready."
else
	echo "Switch to the root directory. Aborting..."
	exit 1
fi
