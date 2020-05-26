#get path (current directory)
#get string to append (e.g. "_IGEL")
#Iterate with a for loop

#Could we instead pass a user-defined list of filenames to iterate through?

SET "Src=C:\path"
SET "Str=_IGEL"
for %%a in ("%Src%\*.*") do ren "%%~a" "%%~Na%Str%%%~Xa
