#!/bin/bash
# set preferences and..
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTFILESIZE=10000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="$BLUE%d/%m/%y %T $NORMAL"
# ..set variables and..
export DIR_BASH="${HOME}/.bash"
export PATH_GIT_PROMPT="/etc/bash_completion.d/git-prompt"
export DIR_ROOT_PROJECT_GOTO='/root/projects/' # trailing slash, please
export DIR_SSH="${HOME}/.ssh"
# ..source files and..
source "${HOME}/.bash/prompt"
source "${HOME}/.bash/alias/app"
source "${HOME}/.bash/alias/color"
source "${HOME}/.bash/alias/git"
source "${HOME}/.bash/alias/ls"
source "${HOME}/.bash/alias/symfony"
source "${HOME}/.bash/less/lesspipe"
# ..load sourcers and..
alias project_autocomplete_load=". ${DIR_BASH}/navigation/project_goto_autocomplete_load";
alias make_file_autocomplete_load=". $DIR_BASH/make/make_file_autocomplete_load"
alias ssh_config_autocomplete_load=". $DIR_BASH/ssh/ssh_config_autocomplete_load"
# ..load scripts and..
alias file_largest="$DIR_BASH/information/file_largest"
alias project_goto="$DIR_BASH/navigation/project_goto"
alias finder_cd="$DIR_BASH/osx/finder_cd"
alias ssh_configure_host="$DIR_BASH/ssh/ssh_configure_host"
alias ssh_configure_test="$DIR_BASH/ssh/ssh_configure_test"
alias git_get_object_link="$DIR_BASH/git/get_object_link"
alias git_rewrite_author="$DIR_BASH/git/rewrite_author"
# ..source files that contain references to these aliases..
source "${HOME}/.bash/completions"
# ..add known paths..
export PATH="$PATH:$HOME/bin"
# end with your temporary additions
echo "Have a nice day!"
