#get path (current directory)
#get string to append (e.g. "_IGEL")
#Iterate with a for loop

#Could we instead pass a user-defined list of filenames to iterate through?

SET "Src=C:\path"
SET "Str=_IGEL"
for %%a in ("%Src%\*.*") do ren "%%~a" "%%~Na%Str%%%~Xa

#reference: https://superuser.com/questions/1349126/batch-append-to-end-of-a-file-name-before-the-extension-with-ren-command

#-------------------------------------------------------------------------------------

#Powershell syntax

#Replace
Get-ChildItem *JHA*.pdf | Rename-Item -NewName { $_.Name -replace '.pdf','_IGEL.pdf' }

#Append
Get-ChildItem "*.pdf" | Rename-Item -NewName { "Submittal " + $_.Name }

#Filter files with a regex
Get-ChildItem | Where-Object { $_.Name -match "^\d" }


#the $_ automatic variable represents each file object
#reference: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-item?view=powershell-7
#Tip: You can also use $_.Extension
