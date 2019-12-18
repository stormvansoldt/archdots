#!/bin/bash

## Variables
DOTFILE_DIR="${HOME}/archdots"
PROGRAMS=$(ls -d */)

## Loop through the packages in the dotfile folder
echo "Stowing programs..."
for pkg in $PROGRAMS; do
	stow -vS "$pkg"
	echo $pkg
done

