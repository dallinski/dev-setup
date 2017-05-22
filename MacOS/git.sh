#!/usr/bin/env bash

git config --global user.name "Dallin Christensen"
git config --global user.email dallin.christensen@gmail.com
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global diff.tool meld
git config --global merge.tool meld