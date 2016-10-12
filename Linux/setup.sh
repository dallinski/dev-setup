#!/bin/bash
# Simple setup.sh for configuring my Linux dev environment


# Setup git stuff
sudo apt-get install git
git config --global user.name "Dallin Christensen"
git config --global user.email dallin.christensen@gmail.com
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
sudo apt-get install meld
git config --global diff.tool meld
git config --global merge.tool meld


# Guake (dropdown terminal)
sudo apt-get install guake


# Setup oh-my-zsh
sudo apt-get install zsh
sudo apt-get install wget
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
export ZSH_THEME="afowler"


# Pithos (Pandora client)
sudo apt-get install pithos


# Darktable
# sudo add-apt-repository ppa:pmjdebruijn/darktable-release
# sudo apt-get update
# sudo apt-get install debhelper dpkg-dev fakeroot
# sudo apt-get build-dep darktable
# tar zxvf darktable_$VERSION.orig.tar.gz
# cd darktable-$VERSION
# tar zxvf ../darktable_$VERSION.debian.tar.gz
# dpkg-buildpackage -rfakeroot


# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable


# Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer


# VLC
sudo apt-get install vlc
sudo apt-get install mozilla-plugin-vlc


# Play on Linux (and Wine)
sudo apt-get install wine
wget -q "http://deb.playonlinux.com/public.gpg" -O- | sudo apt-key add -
sudo wget http://deb.playonlinux.com/playonlinux_precise.list -O /etc/apt/sources.list.d/playonlinux.list
sudo apt-get update
sudo apt-get install playonlinux


# Pushbullet
sudo add-apt-repository ppa:atareao/atareao
sudo apt-get update
sudo apt-get install pushbullet-indicator


# Java 8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer


# Android Studio
sudo add-apt-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio


# alacarte
sudo apt-get install alacarte


# IntelliJ Professional
# First have to install ubuntu-make
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo apt-get update
sudo apt-get install ubuntu-make
umake ide idea-ultimate


# GRUB customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update
sudo apt-get install grub-customizer


