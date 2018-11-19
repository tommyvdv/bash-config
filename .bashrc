#!/bin/bash
# set preferences and..
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="$BLUE%d/%m/%y %T $NORMAL"
# ..set variables and..
DIR_BASH=". ${HOME}/.bash"
DIR_ROOT_PROJECT_GOTO='/root/projects/' # trailing slash, please
# ..source files and..
source "${HOME}/.bash/alias/app"
source "${HOME}/.bash/alias/color"
source "${HOME}/.bash/alias/ls"
source "${HOME}/.bash/alias/symfony"
# ..load scripts and..
alias file_largest="$DIR_BASH/information/file_largest"
alias project_autocomplete_load="$DIR_BASH/navigation/project_goto_autocomplete_load"
alias project_goto="$DIR_BASH/navigation/project_goto"
alias make_file_autocomplete_load="$DIR_BASH/make/make_file_autocomplete_load"
alias finder_cd="$DIR_BASH/osx/finder_cd"
alias ssh_config_autocomplete_load="$DIR_BASH/ssh/ssh_config_autocomplete_load"
alias ssh_configure_host="$DIR_BASH/ssh/ssh_configure_host"
alias ssh_configure_test="$DIR_BASH/ssh/ssh_configure_test"
# ..source files that contain references to these aliases..
source "${HOME}/.bash/completions"
# end with your temporary additions
echo "Have a nice day!"
