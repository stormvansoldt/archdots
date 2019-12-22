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
		printf '%s\n' "===> Linking all packages"
		PACKAGES=(*/)
	else
		tmp=("$@")
		PACKAGES=("${tmp[@]:1}")
	fi

	for PKG in "${PACKAGES[@]}"; do
		printf '%s\n' "==> Linking $PKG package"
		stow -vnS $PKG
		## TODO: Add error handling
		## Exit codes:
		## 0 : Success
		## 1 : Existing target is neither a link or a directory
		## 2 : Stow directory $DIR does not contain package $PKG
	done
}

backup_dots () {
	echo "BACKING UP THE FILES"
}

## Verify GNU stow is installed
check_stow () {
	command -v foo >/dev/null 2>&1 || {
		echo "ERROR: GNU Stow is not installed.";
		echo "To install Stow, run the following commands:";
		echo " curl -O https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz"
		echo " tar -xvpzf stow-latest.tar.gz";
		echo " cd stow-VERSION";
		echo " ./configure && make && sudo make install";
   		exit 1;
	}
}

print_usage () {
	echo "Usage: ./setup.sh [-add] [-backup] [-replace] [PACKAGE[S]]"
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
	"-replace") replace_dots "$@";;
	"-test") test_pkg "$@";;
	*) print_usage;;
esac
