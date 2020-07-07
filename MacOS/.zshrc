# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/dallin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias update_all='cd ~/dev; ./update_all_git_repos.sh; cd -'
alias gitprune='git remote prune origin; git branch -r | awk '\''{print $1}'\'' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '\''{print $1}'\'' | xargs git branch -d'
alias kill8080='kill $(lsof -t -i:8080)'

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

export JAVA_HOME=$(/usr/libexec/java_home -v 11)
export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
