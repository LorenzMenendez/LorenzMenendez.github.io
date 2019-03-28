set sourceFolder to choose folder

tell application "Finder"
	
	set theFolders to folders of sourceFolder
	
	repeat with aFolder in theFolders
		set sourceSubFolder to (aFolder as alias)
		set theFiles to files of folder sourceSubFolder
		repeat with aFile in theFiles
			set fileName to name of aFile
			
			if fileName contains "-" then
				set dashOffset to offset of "-" in fileName
				set folderName to text (dashOffset - 4) thru (dashOffset - 1) of fileName
				
				set newFolder to (sourceSubFolder as text) & folderName & ":"
				if not (exists folder newFolder) then
					make new folder at sourceSubFolder with properties {name:folderName}
				end if
				
				move aFile to folder newFolder
			end if
		end repeat
	end repeat
end tell