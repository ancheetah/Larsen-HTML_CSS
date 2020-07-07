#Checks for new files within a specified date range
#EXAMPLE CALL: 	& "$HOME\find-new.ps1"	#from anywhere in command line
#		find-new		#using alias set up in user profile

#Check working directory
Write-Host $pwd
$oldpath = $pwd
$choice = Read-Host "Is this the correct directory? (y/n) "
if ($choice.ToLower() -eq "n") {
  $workingDir = Read-Host "Enter path (no quotation marks) "
}
elseif ($choice.ToLower() -eq "y") {
	$workingDir = $pwd
}
else {
  Write-Host "Invalid entry... Aborting"
  return -1
}

Set-Location -LiteralPath $workingDir -PassThru

#Prompt user for date-range
$startDate = Read-Host "Enter start date"
$endDate = Read-Host "Enter end date" 

#Append time to list docs through end of day
$endDate = $endDate + " 11:59:59 pm"
#echo $endDate

#Locations to check:
$folders = @("11. Safety", "06. MOMs", "01. BOLs/06. Solar Modules", "05. EE Reports", "09. Photos - Progress")

#List all files in date range
Get-ChildItem $folders -Recurse | 
	Where-Object {$_.CreationTime -ge $startDate -and $_.CreationTime -le $endDate} | 
	Format-Table -Property Name, [Blank], CreationTime -GroupBy Directory

#Change back to user's original working directory
Set-Location -LiteralPath $oldpath -PassThru
Write-Host [Done]


#----------------------------
#Open Windows Explorer
#Invoke-Item "path-to-folder"
