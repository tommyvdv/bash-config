#!/bin/bash
# set preferences and..
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000
# ..set variables and..
CSPROJECTROOT='/root/projects/' # trailing slash, please
# ..source files and..
source "${HOME}/.bash/alias/color"
source "${HOME}/.bash/alias/ls"
# ..load scripts and..
dir_bash=". ${HOME}/.bash"
alias project_autocomplete_load="$dir_bash/navigation/project_goto_autocomplete_load"
project_autocomplete_load
alias project_goto="$dir_bash/navigation/project_goto"
alias make_file_autocomplete_load="$dir_bash/make/make_file_autocomplete_load"
make_file_autocomplete_load
alias finder_cd="$dir_bash/osx/finder_cd"
alias ssh_config_autocomplete_load="$dir_bash/ssh/ssh_config_autocomplete_load"
ssh_config_autocomplete_load
alias ssh_configure_host="$dir_bash/ssh/ssh_configure_host"
alias ssh_configure_test="$dir_bash/ssh/ssh_configure_test"
# end with your temporary additions
echo "Have a nice day!"
