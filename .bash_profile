#!/bin/bash
# set preferences and..
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTFILESIZE=-1
export HISTSIZE=1000000
export HISTTIMEFORMAT="$BLUE%d/%m/%y %T $NORMAL"
export HISTFILE=$HOME/.bash_history
# ..btw, how verbose do you allow me to be..
export BASHCONFIGLOADERVERBOSITY=1
# ├── 0: keep quiet
# ├── 1: verbose
# ├── 2: very verbose
# └── 3: debug mode
# ..set variables and..
export DIR_BASH_CONFIG="$HOME/bash-config"
export DIR_BASH="$DIR_BASH_CONFIG/.bash"
export DIR_BASH_VAR="$DIR_BASH_CONFIG/var"
export PATH_GIT_PROMPT="/usr/local/etc/bash_completion.d/git-prompt.sh"
export DIR_ROOT_PROJECT_GOTO="$HOME/projects/" # trailing slash, please
export DIR_SSH="$HOME/.ssh"
# ..source externals and..
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete g _git
# ..source internals and..
source "$DIR_BASH/prompt" 2>&1 >/dev/null
source "$DIR_BASH/alias/app"
source "$DIR_BASH/alias/docker"
source "$DIR_BASH/alias/color"
source "$DIR_BASH/alias/git"
source "$DIR_BASH/alias/ls"
source "$DIR_BASH/alias/symfony"
source "$DIR_BASH/alias/motd"
source "$DIR_BASH/less/lesspipe"
# ..load sourcers and..
alias project_autocomplete_load=". $DIR_BASH/navigation/project_goto_autocomplete_load";
alias make_file_autocomplete_load=". $DIR_BASH/make/make_file_autocomplete_load"
alias ssh_config_autocomplete_load=". $DIR_BASH/ssh/ssh_config_autocomplete_load"
# ..load scripts and..
alias backup_file_list="$DIR_BASH/file/backup_list"
alias file_largest="$DIR_BASH/information/file_largest"
alias project_goto=". $DIR_BASH/navigation/project_goto"
alias finder_cd="$DIR_BASH/osx/finder_cd"
alias ssh_configure_host=". $DIR_BASH/ssh/ssh_configure_host"
alias ssh_configure_test="$DIR_BASH/ssh/ssh_configure_test"
alias git_get_object_link="$DIR_BASH/git/get_object_link"
alias git_get_commit_score="$DIR_BASH/git/get_commit_score"
alias git_rewrite_author="$DIR_BASH/git/rewrite_author"
# ..source files that contain references to these aliases..
source "$DIR_BASH/completions"
# ..add known paths..
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/sbin:/usr/local/bin

# ..expand this setup with external tools..
# [php] LIIP PHP, see https://php-osx.liip.ch/
export PATH=/usr/local/php5/bin:$PATH # LIIP PHP goes before $PATH as we want it more than any other
export XDEBUG_CONFIG="idekey=phpstorm"
# [brew] RVM, see https://rvm.io/
export PATH=$PATH:$HOME/.rvm/bin # RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [brew] NVM, see https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# [brew] GO, see https://golang.org/
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# [brew] RabbitMq, see https://www.rabbitmq.com/
export PATH=$PATH:/usr/local/opt/rabbitmq/sbin
# [general] Make sure /usr/bin is used above all else.
# This actually prevents using PHP curl instead of system in this instance.
export PATH=/usr/bin:$PATH
# ..great the user..
echo -n "* port 80 scan results: " && nc -zv 127.0.0.1 80 > /dev/null 2>&1 && echo "open" || echo "closed"
if [ "$BASHCONFIGLOADERVERBOSITY" -gt "0" ]; then
  cat_otd
fi
# ..end with your temporary additions
