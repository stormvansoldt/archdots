#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#####################
###   VARIABLES   ###
#####################

# Color code variables
BLK="$(tput setaf 0)"
RED="$(tput setaf 1)"
GRN="$(tput setaf 2)"
YLW="$(tput setaf 3)"
BLU="$(tput setaf 4)"
PRP="$(tput setaf 5)"
CYN="$(tput setaf 6)"
WHT="$(tput setaf 7)"
RST="$(tput sgr0)"
BOLD="$(tput bold)"

shopt -s extglob
# Source our exports file
if [ -f ~/.exports ]; then
	. ~/.exports
fi

# All alias definitions are going into the .bash_aliases file
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Source our other bash files
if [ -f ~/.functions ]; then
	. ~/.functions
fi

force_color_prompt=yes

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

PROMPT_COMMAND=prompt_command
