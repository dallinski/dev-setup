#!/usr/bin/env bash

# usage:
#    ActivateOrLaunch.sh firefox-bin
#
# Will launch firefox-bin or activate the first window in the windows stack
# --- Remember to chmod a+x ActivateOrLaunch.sh in order to execute.

# pgrep looks through the currently running processes and lists the process
#       IDs which matches the selection criteria to stdout
#       for more information on pgrep http://linux.die.net/man/1/pgrep

# if process is found by pgrep then pipe through head to get firt instance in
#    case of multiple processes running. If process not found $pid will be empty
pid=$(pgrep ${1} | head -n 1)

# Using "-z" check if $pid is empty, if so execute the process
if [ -z "$pid" ]; then
   echo "$1 not running... executing..."
   $1 &
else
   # process was found, find the first visible window and activate it
   echo "Found process $1 with PID $pid"

   # using xdotool [http://www.semicomplete.com/projects/xdotool/] get the first
   # visible windows using $pid. Redirect stderr to /dev/null and only select
   # the first visible windows using head
   wid=$(xdotool search --onlyvisible --pid $pid 2>/dev/null | head -n 1)

   # if $wid is empty the process does not have any visible windows... do nothing
   if [ -z "$wid" ]; then
     echo "Didn't find any visible windows for process $1 with PID: $pid"
   else
     # send the window id ($wid) from the window stack to xdotool
     echo "Activating first windows in stack"
     xdotool windowactivate $wid
   fi
fi

# ******** NOTES **********
# In order for this script to work correctly you need to pass the complete process 
# name for it to find any visible windows. The process needs needs to be in the path
# for it to execute if not running.
#
# For example
#
# If you try it with firefox-bin on Ubuntu 10.10 it will find the running process and 
# activate the window, but it will not be able to launch the process since the executable 
# in the path is called firefox which is a link to firefox.sh
# (/usr/bin/firefox -> ../lib/firefox-3.6.12/firefox.sh) which in turn executes firefox-bin
# (not in path).
#
# Next, if you use firefox it will find a process but won't be able to find any windows 
# since it's a wrapper function calling firefox-bin and doesn't have any windows. 