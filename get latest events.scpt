(*
	"get latest events" - Script to scrape event data from BFA API events list by PATRICK RAFANAN 

	v3.91v	2016-05-17 changes pagedown to command+downarrow
	v3.9v	2016-05-16 disable paste in gsheet; add pageNumber variable
	v3.9	2016-05-10 more page down in gsheet; delete blank columns; copy data to gsheet
	v3.8		2016-05-04 corrects May event dates
	v3.66	2016-04-27 find last event ID in sheet
	v3		2016-04-20 restores uploads column (UTC time) to be used as an upload time stamp	
	v2.4		2016-04-18 move subroutines/functions to top. fix line break after UTC; simple reformat dates
	v2.3b4	2016-04-06 name change. Deletes empty columns. Selects last cell.
	v2.3b3	2016-03-30 increase delay when launching url.
	v2.3b2	2016-03-24 pause before deleting last line.
	v2.2		2016-03-18 Reorder, reinstate other column data. Remove "/BFA.com". Delete headers.
	v2.1		2016-03-15 Written from the ground up for AV tracking sheet.
	
	feature request pipeline: 
	- format dates "YYYY-MM-DD"
		TRY replacing "YYYYMM" with "YYYY-MM-"
	- prompt for how many event pages to grab
		OR ask to run again for next page OR ask which page number
	- make textedit plaintext?
		IGNORE if menu item doesn't exist
	-UTC time converter for upload times
	
	
	INSTRUCTIONS
	Before using this script:
	1. Log into BFA API: https://api.bfa.com/users/sign_in
	2. Set TextEdit preferences to plain text
	
*)


-- A sub-routine for replacing characters in strings:
-- https://gist.github.com/benwaldie/6227266

on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars

set pageNumber to 1

tell application "Google Chrome"
	activate
	
	open location "https://docs.google.com/spreadsheets/d/1buShUHrvAWUjDwpPo_8x5NdcU9NyV30_vYgCZP2Qi_g" --open spreadsheet
	
	open location "https://api.bfa.com/events?page=" & pageNumber
	
	--	open location "https://api.bfa.com/events?name=hamptons&page=3" -search by event
	delay 5
	tell application "System Events"
		keystroke "a" using command down --select all
		delay 1
		keystroke "c" using command down --copy
		delay 1
		keystroke "w" using command down --close window
	end tell
	
end tell


tell application "TextEdit"
	activate
	make new document
	
	(*
	-- make Plain Text based on https://discussions.apple.com/thread/2272116?tstart=0
		tell application "System Events" to tell process "TextEdit"
			if menu item "Make Plain Text" of menu 1 of menu bar item "Format" of menu bar 1 exists then
				keystroke "t" using {shift down, command down}
			end if
		end tell
	*)
	
	tell application "System Events"
		keystroke "v" using command down
	end tell
	
	-- Find and replace
	-- delete header nav
	set text of front document to replace_chars(text of front document, " Authorized Events
 Admin Tools 
 Shopping Cart
 Logout
events
users
content
orders
reports
subscriptions
photo stats
qbo customers
organizations
all downloads
", "") of me
	
	-- delete search
	set text of front document to replace_chars(text of front document, "Search
Event Name

 Search
", "") of me
	
	-- delete username
	set text of front document to replace_chars(text of front document, "BFA
 Patrick Rafanan
", "") of me
	
	-- delete footer
	set text of front document to replace_chars(text of front document, "
Copyright © 2016 BFA NYC, LLC All Rights Reserved.
 Back to top", "") of me
	
	-- delete buttons
	set text of front document to replace_chars(text of front document, "	
 Edit Delete Bulk Tag View on BFA View on API
", "
") of me
	
	-- delete thumbnail text
	(*set text of front document to replace_chars(text of front document, "

Thumb bfa ", "") of me*)
	
	set text of front document to replace_chars(text of front document, "
", "	") of me
	
	set text of front document to replace_chars(text of front document, "	Actions	", "
") of me
	
	-- Events new line
	set text of front document to replace_chars(text of front document, "Events	", "Events
") of me
	
	-- tab tab
	set text of front document to replace_chars(text of front document, "		", "	") of me
	
	-- replace column headers
	set text of front document to replace_chars(text of front document, "Id	Position	date created (iptc date)	Name	Author	Created at", "Event ID	thumbnail	photos	keywords	Position	event date (IPTC)	Event Name	photographer	uploaded") of me
	
	-- break apart photos / keywords
	set text of front document to replace_chars(text of front document, " photos / ", "	") of me
	
	-- delete "keywords"
	set text of front document to replace_chars(text of front document, " keywords", "") of me
	
	-- delete "/BFA.com"
	set text of front document to replace_chars(text of front document, "/BFA.com", "") of me
	
	-- line break after UTC
	set text of front document to replace_chars(text of front document, "UTC	", "UTC
") of me
	
	-- reformat date
	set text of front document to replace_chars(text of front document, "201604", "2016-04-") of me
	set text of front document to replace_chars(text of front document, "201605", "2016-05-") of me
	
	-- find / replace
	set text of front document to replace_chars(text of front document, "this", "that") of me
	
	
	tell application "System Events"
		keystroke "a" using command down --select all
		delay 0.5
		keystroke "x" using command down --cut
		delay 0.5
		keystroke "w" using command down --close window
		delay 0.5
		key code 51 using command down --delete (don't save)
		delay 0.5
		keystroke "w" using command down --close window
	end tell
	
	
	
	
end tell

tell application "Numbers"
	activate
	make new document
	tell table 1 of sheet 1 of document 1
		
		-- set selection range to first cell
		set value of cell 1 to ""
		
		tell application "System Events"
			-- paste & match style
			keystroke "v" using {option down, shift down, command down}
			delay 1
		end tell
		
		-- Format spreadsheet
		
		set the selection range to row "2"
		delay 1
		tell application "System Events"
			keystroke "x" using command down --cut row 2
		end tell
		set the selection range to the first row
		tell application "System Events"
			-- paste & match style
			keystroke "v" using {option down, shift down, command down} --paste row 1
			keystroke "0" using {command down, shift down} --zoom to selection
			--keystroke "," using {command down, shift down} --zoom out window
			--keystroke "," using {command down, shift down} --zoom out window
		end tell
		
	end tell
	
	tell table 1 of sheet 1 of document 1
		sort by column 1 direction ascending -- sort by Event ID
		delay 1
		remove last row -- blank
		remove last row -- foot nav
		
		--clear range "b:b" --thumbnail
		--clear range "d:d" --keywords
		--clear range "e:e" --Position
		--clear range "i:i" --uploaded
		
		set selection range to range "G:G" --cut Event Name
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "B:B" --paste Event Name
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		set selection range to range "H:H" --cut Photographer
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "D:D" --paste Photographer
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		
		set selection range to range "I:I" --cut UTC
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "E:E" --paste UTC
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		
		set selection range to range "C:C" --cut Photos
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "G:G" --paste Photos
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		
		set selection range to range "A:A" --cut Event ID
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "C:C" --paste Event ID
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		
		set selection range to range "F:F" --cut Event Date
		tell application "System Events"
			keystroke "x" using command down
		end tell
		set selection range to range "A:A" --paste Event Date
		tell application "System Events"
			keystroke "v" using {option down, shift down, command down}
		end tell
		
		delete column 6 --delete blank
		delete last column --delete blank
		delete last column --delete blank
		
		(*
		repeat 4 times
			delete column 5
		end repeat
		
		set selection range to range "b:b" --select event name column
		
		*)
		
		(* -- needs assistive access
		tell application "System Events"	
			tell (process 1 where frontmost is true)
				click menu item "Wrap Text" of menu 1 of menu bar item "Table" of menu bar 1 --uncheck wrap text
			end tell
		end tell
			*)
		
		delete first row
		
		set selection range to range "e20:e20" --select last cell
		
	end tell
	
end tell

tell application "Google Chrome"
	activate
	delay 0.5
	tell application "System Events"
		repeat 3 times
			key code 125 --downArrow
		end repeat
		repeat 50 times
			key code 125 using {command down} --downArrow to last filled row
			--			key code 121 --PageDown
			delay 0.1
		end repeat
		key code 126 using {command down} --upArrow to last filled row
		key code 116 --PageUp
		key code 125 using {command down} --downArrow to last filled row
		key code 124 --rightArrow
		delay 0.1
		key code 124 --rightArrow
		delay 0.1
		keystroke "c" using command down --copy Event ID
		delay 1
	end tell
end tell

tell application "Numbers" to activate

tell application "System Events"
	keystroke "f" using {command down} --Find
	keystroke "v" using {command down} --Paste Event ID
	delay 1
	keystroke "w" using {command down} --Close search
	key code 116 --PageUp
	key code 123 using command down --leftArrow (go to first cell in row)
	key code 124 using {shift down, command down} --rightArrow (to select row)
	key code 125 using {shift down, command down} --downArrow (to select all rows below)
	keystroke "c" using command down --copy
end tell

tell application "Google Chrome"
	activate
	delay 0.5
	tell application "System Events"
		key code 123 using command down --leftArrow (go to first cell in row)
		--keystroke "v" using {shift down, command down} -- paste & match style	
		delay 1
		key code 121 --PageDown
	end tell
end tell
