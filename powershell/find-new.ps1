#Checks for new files within a specified date range

#Check working directory
Write-Host Get-Location
$choice = Read-Host "Is this the working directory? (y/n) "
if ($choice.ToLower() == "n") {
  $workingDir = Read-Host "Enter path: "
  Set-Location -Path $workingDir -PassThru
}
elseif ($choice.ToLower() != "y") {
  Write-Host "Invalid entry... Aborting"
  return -1
}

#Prompt user for date-range
$startDate = Read-Host "Enter start date: "
$endDate = Read-Host "Enter end date: "

#Locations to check:
$folders = @("11. Safety", "06. MOMs", "01. BOLs/06. Solar Modules", "05. EE Reports", "09. Photos - Progress")

#List all files in date range
$folders | ForEach-Object {Get-ChildItem $_ -recurse | Where-Object {$_.CreationTime -ge $startDate -and $_.CreationTime -le $endDate} }


#----------------------------
#Open Windows Explorer
#Invoke-Item "path-to-folder"
