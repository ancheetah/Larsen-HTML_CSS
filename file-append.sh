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

Get-ChildItem *JHA*.pdf | Rename-Item -NewName { $_.Name -replace '.pdf','_IGEL.pdf' }

#the $_ automatic variable represents each file object
#reference: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/rename-item?view=powershell-7
