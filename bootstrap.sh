#!/usr/bin/env bash

# Go into the directory where this script lay.
# dirname : man dirname
# ${BASH_SOURCE} : the absolute filename of this script which is running 
cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
	rsync --exclude ".git/" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE.md" -avh --no-perms . ~;
	source ~/.bash_profile;
}

# $1 : the first argument
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
