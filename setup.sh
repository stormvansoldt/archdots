#!/bin/bash

## Functions and parameters

# Set some global variables
TARGET_DIR=$HOME
DOT_DIR="${HOME}/archdots"

# Verify we are in correct directory, then make a list of stow-able packages
if [[ $DOT_DIR != "$(pwd)" ]]; then
	echo "[ ] Changing directory ==> ${DOT_DIR}"
	cd $DOT_DIR
fi

# Symlink the dotfiles to the $HOME directory
add_dots () {
	# If there is no additional command line arguments, attempt to symlink every
	# folder in the current directory
	if [[ $# -eq 1 ]]; then
		printf '%s\n' "=> Linking all packages"
		PACKAGES=(*/)
	else
		tmp=("$@")
		PACKAGES=("${tmp[@]:1}")
	fi

	for PKG in "${PACKAGES[@]}"; do
		printf '%s\n' "==> Linking $PKG package"
		cd $PKG
		for FILE in $(ls -A .); do
			ln -vsrit "$HOME" "$FILE"
		done
		cd ..
	done
}

backup_dots () {
	echo "BACKING UP THE FILES"
}

print_usage () {
	echo "Usage: ./setup.sh [-add] [-backup] [PACKAGE[S]]"
}

# Parse script arguments
if [[ $# -gt 5 ]]; then
	printf "[!] Invalid number of arguments.\n\n"
	print_usage
	exit 1
fi

case "$1" in
	"-add") add_dots "$@";;
	"-backup") backup_dots "$@";;
	*) print_usage;;
esac
