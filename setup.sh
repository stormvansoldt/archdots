#!/bin/bash

## Functions and parameters

# Verify we are in correct directory, then make a list of stow-able packages
STOW_DIR="${HOME}/archdots"

if [[ $STOW_DIR != "$(pwd)" ]]; then
	echo "[ ] Changing directory ==> ${STOW_DIR}"
	cd $STOW_DIR
fi

PACKAGES=$(ls -d */)

# Symlink the dotfiles to the $HOME directory
add_dots () {
	echo "[ ] Stowing programs..."
	for pkg in $PACKAGES; do
		stow -vnS "$pkg"
	done
}

backup_dots () {
	echo "BACKING UP THE FILES"
}

check_stow () {
	command -v stow >/dev/null 2>&1 || {
		echo >&2 "[!] GNU Stow is not installed.";
		echo "To install Stow, run the following commands:";
		echo " curl -O https://ftp.gnu.org/gnu/stow/stow-latest.tar.gz"
		echo " tar -xvpzf stow-latest.tar.gz";
		echo " cd stow-VERSION";
		echo " ./configure && make && sudo make install";
   		exit 1;
	}
}

print_usage () {
	echo "Usage: setup.sh [add] [backup] [replace]"
}

## Verify GNU stow is installed

# Parse script arguments
if [[ $# -ne 1 ]]; then
	printf "[!] Invalid number of arguments.\n\n"
	print_usage
	exit 1
fi

case ${1} in
	"add") add_dots;;
	"backup") backup_dots;;
	"replace") replace_dots;;
	*) print_usage;;
esac

exit 0
