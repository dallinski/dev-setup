#!/bin/zsh

# store the current dir
CUR_DIR=$(pwd)

# Let the person running the script know what's going on.
echo "\n\e[1mPulling in latest changes for all repositories...\e[0m\n"

# Find all git repositories and update it to the latest revision of whichever branch is currently checked out
for i in $(find . -name ".git" | cut -c 3-); do
    echo "";

    # We have to go to the .git parent directory to call the pull command
    cd "$i";
    cd ..;

    if branch=$(git symbolic-ref --short -q HEAD)
    then
      if [ $branch = "develop" ]; then
        echo "\e[33m"$i" \e[0;32m" $branch "\e[0m"
      elif [ $branch = "master" ]; then
        echo "\e[33m"$i" \e[0;34m" $branch "\e[0m"
      else
        echo "\e[33m"$i" \e[0;35m" $branch "\e[0m"
      fi
    else
      echo "\e[33m"$i" \e[0;31mnot on any branch\e[0m"
    fi

    if [[ -z $(git status -s) ]]
    then
      git pull origin $branch;
    elif [[ $(git status -s) == "?? .idea/" ]]
    then
      # the only changes are in the .idea directory
      git pull origin $branch;
    elif [[ $(git status -s) == *".iml" ]]
    then
      # the only change is a .iml file from IntelliJ
      git pull origin $branch;
    else
      echo "\e[1;31mChanges exist. Not pulling.\e[0m"
      git status -s
    fi

    # lets get back to the CUR_DIR
    cd $CUR_DIR
done

echo "\n\e[32mComplete!\e[0m\n"
