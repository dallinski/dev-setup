-- This script can be used in conjunction with Better Touch Tool to display the currently playing track on the MacBook Pro TouchBar
-- More info here: https://lucatnt.com/2017/02/display-the-currently-playing-track-in-itunesspotify-on-the-touch-bar

on FormatSeconds(totalSeconds)
	set theMinutes to (totalSeconds div minutes)
	set theRemainderSeconds to (totalSeconds mod minutes)
	
	if length of (theRemainderSeconds as text) = 1 then
		set theRemainderSeconds to "0" & (theRemainderSeconds as text)
	end if
	
	set theTimeString to theMinutes & ":" & theRemainderSeconds as text
	
	return theTimeString
end FormatSeconds

on MillisToSeconds(millis)
	return round ((millis / 1000)) rounding down
end MillisToSeconds

if application "Spotify" is running then
	tell application "Spotify"
		if player state is playing then
			return (get artist of current track) & " - " & (get name of current track) & " (" & my FormatSeconds(get player position as integer) & "/" & my FormatSeconds(my MillisToSeconds(get duration of current track)) & ")"
		else
			return "Spotify"
		end if
	end tell
else
	return "Spotify"
end if