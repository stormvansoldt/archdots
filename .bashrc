#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

force_color_prompt=yes
alias ls='ls --color=auto'

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

# The Editor variable needs to be exported for the system for some reason. no idea why.
export EDITOR='vim'
TMUXINATOR_CONFIG="${HOME}/.tmuxinator"

#####################
###   FUNCTIONS   ###
#####################

## Used to justify text to the right side of the screen
rightprompt() {
	printf '%s%*s%s' "$GRN" $COLUMNS "$1" "$RST"
}

## Set the PS1 prompt 
prompt_command() {
  # First let's check to see which git branch we are in
  BRANCH="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"

  PS1='\[$RED\][\[$WHT\]\u\[$RED\]@\[$WHT\]\h\[$RED\]] \[$BLU\][\[$WHT\]\w\[$BLU\]] '

  # If we are in a git repo, add the branch to the PS1 line and check to see
  # if changes need to be staged or committed to the branch
  if [ -n "$BRANCH" ]; then
    ## Command that sets the text aligned to the right of the terminal
    PS1+='\[$WHT\][ \[$GRN\]$BRANCH\[$WHT\]] '

  fi
  PS1+='\[$WHT\]\[$BOLD\]\$\[$RST\] '
  #PS1+='\[$RST\][\[$RED\]\u \[$WHT\]\w]:\[$BOLD\]$\[$RST\] '
}

PROMPT_COMMAND=prompt_command

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

###############
## VARIABLES ##
###############
export EDITOR='vim'

