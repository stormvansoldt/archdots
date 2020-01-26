#  _               _              
# | |__   __ _ ___| |__  _ __ ___ 
# | '_ \ / _` / __| '_ \| '__/ __|
# | |_) | (_| \__ \ | | | | | (__ 
# |_.__/ \__,_|___/_| |_|_|  \___|
#                                

shopt -s extglob

# All alias definitions are going into the .bash_aliases file
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

force_color_prompt=yes

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

GIT_ICON=""

# The Editor variable needs to be exported for the system for some reason. no idea why.
export EDITOR='vim'
export PATH=$PATH:/home/storm/.gem/ruby/2.6.0/bin

#####################
###   FUNCTIONS   ###
#####################

## Used to extract a wide range of files with one simple command
extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
            *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                   c=(bsdtar xvf);;
            *.7z)  c=(7z x);;
            *.Z)   c=(uncompress);;
            *.bz2) c=(bunzip2);;
            *.exe) c=(cabextract);;
            *.gz)  c=(gunzip);;
            *.rar) c=(unrar x);;
            *.xz)  c=(unxz);;
            *.zip) c=(unzip);;
            *)     echo "$0: unrecognized file extension: \`$i'" >&2
                   continue;;
        esac

        command "${c[@]}" "$i"
        ((e = e || $?))
    done
    return "$e"
}


## Used to justify text to the right side of the screen
rightprompt() {
	PS1L=$PWD
	if [[ $PS1L/ = "$HOME"/* ]]; then PS1L=\~${PS1L#$HOME}; fi
	PS1R=$USER@$HOSTNAME
	printf "%s%$(($COLUMNS-${#PS1L}))s" "$PS1L" "$PS1R"
}


## Set the PS1 prompt 
prompt_command() {
  # First let's check to see which git branch we are in
  BRANCH="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"

  PS1='\[$RED\][\[$WHT\]\u\[$RED\]@\[$WHT\]\h\[$RED\]] \[$BLU\][\[$WHT\]\w\[$BLU\]] '

  # If we are in a git repo, add the branch to the PS1 line and check to see
  # if changes need to be staged or committed to the branch
  if [ -n "$BRANCH" ]; then
	PS1+='\[$GRN\]['
	if [ "$(git status -s | wc -l)" -gt 0 ]; then
		PS1+='\[$RED\]'
	else
		PS1+='\[$BLU\]'
	fi
	PS1+=' \[$WHT\]$BRANCH\[$GRN\]] '

  fi
  PS1+='\[$WHT\]\[$BOLD\]\$\[$RST\] '
  #PS1+='\[$RST\][\[$RED\]\u \[$WHT\]\w]:\[$BOLD\]$\[$RST\] '
}

PROMPT_COMMAND=prompt_command
#PROMPT_COMMAND=rightprompt

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

###############
## VARIABLES ##
###############
export EDITOR='vim'
