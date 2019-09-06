#!/usr/bin env bash

## Variables
DOTFILE_DIR="${HOME}/dotfiles"
PROGRAMS=$(ls -d */)

## Loop through the packages in the dotfile folder
echo "Stowing programs..."
for pkg in $PROGRAMS; do
	stow -v "$pkg"
	echo $pkg
done

## Get the list of files and do a git checkout to revert them to the original
FILES=$(git status -s | awk '{ print $2 }')

for file in $FILES; do
	if [ "$file" != "setup.sh" ]; then
		git checkout -- "$file"
	fi
done

