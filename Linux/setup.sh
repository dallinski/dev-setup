#!/bin/bash
# Simple setup.sh for configuring my Linux dev environment

# Setup git stuff
sudo apt-get install git
git config --global user.name "Dallin Christensen"
git config --global user.email dallin.christensen@gmail.com
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


# Setup oh-my-zsh
sudo apt-get install zsh
sudo apt-get install wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
export ZSH_THEME="afowler"


sudo apt-get install guake