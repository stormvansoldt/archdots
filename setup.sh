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

