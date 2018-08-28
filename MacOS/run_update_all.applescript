if application "Terminal" is running then
	tell application "Terminal"
		-- do script without "in window" will open a new window    
		do script "cd ~/dev && ./update_all_git_repos.sh"
		activate
	end tell
else
	tell application "Terminal"
		-- window 1 is guaranteed to be recently opened window        
		do script "cd ~/dev && ./update_all_git_repos.sh" in window 1
		activate
	end tell
end if
