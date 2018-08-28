#!/bin/zsh

# functions to simplify logic
can_pull_safely() {
  if [[ -z $(git status -s) ]]
  then
    return
  elif [[ $(git status -s) == "?? .idea/" ]]
  then
    # the only changes are in the .idea directory
    return
  elif [[ $(git status -s) == *".iml" ]]
  then
    # the only change is a .iml file from IntelliJ
    return
  else
    echo "\e[1;31mChanges exist. Not pulling.\e[0m"
    git status -s
    false
  fi
}

print_branch_info() {
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
}

# store the current dir
CUR_DIR=$(pwd)

echo "Which branch do you want to checkout?"
read branch_to_checkout

echo "\n\e[1mAttempting to checkout branch containing '$branch_to_checkout' for all repositories...\e[0m\n"

# iterate through all git repositories
for i in $(find . -name ".git" | cut -c 3-); do
    # We have to go to the .git parent directory to call the pull command
    cd "$i"
    cd ..

    branch_pattern=`echo $branch_to_checkout | sed -e 's/^\\///' -e 's/\\/$//'`
    matching_branch=`git for-each-ref --sort=-committerdate --format='%(refname:short)' refs/heads/ | grep -E $branch_pattern | head -n1`
    if [[ $matching_branch ]] ; then
      print_branch_info
      echo "Matching branch found: \e[36m"$matching_branch"\e[0m"
      if can_pull_safely; then
        echo "\e[32mSafe to pull\e[0m"
        git checkout $matching_branch
      fi
    else
      # echo "No branch found matching $branch_to_checkout"
    fi

    # navigate back to CUR_DIR
    cd $CUR_DIR
done

echo "\n\e[32mComplete!\e[0m\n"