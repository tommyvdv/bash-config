#!/bin/bash
# set variables and..
CSPROJECTROOT='/root/projects/' # trailing slash, please
# ..source files and..
source "${HOME}/.bash/alias/color"
# ..load scripts and..
alias project_autocomplete_load=". ${HOME}/.bash/navigation/project_goto_autocomplete_load"
project_autocomplete_load
alias project_goto=". ${HOME}/.bash/navigation/project_goto"
alias make_file_autocomplete_load=". ${HOME}/.bash/make/make_file_autocomplete_load"
make_file_autocomplete_load
alias finder_cd=". ${HOME}/.bash/osx/finder_cd"
alias ssh_config_autocomplete_load=". ${HOME}/.bash/ssh/ssh_config_autocomplete_load"
ssh_config_autocomplete_load
alias ssh_configure_host=". ${HOME}/.bash/ssh/ssh_configure_host"
# end with your temporary additions
echo "Have a nice day!"
