#Create folders in the working directory for Clearway projects based on a *.csv file with Project IDs (col 1) and Project Names (col 2)

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

#Read the data into a variable
$filename = Read-Host "Enter filename (no quotes) " 
$data = Import-Csv -Path $filename -Header 'ID', 'Name'

#Remove the first part (state) of the Project Name
$subname = $data.name.substring(4)
#echo $subname

#Concatenate col 1 and the substring from col 2
#Create new folders based on the concatenated names
#foldernames = @()
for ($i=0; $i -lt $subname.length; $i++) {
	$foldernames += ,($data.id[$i] + ' -' + $subname[$i])
}
#echo $foldernames

#Create the new folders
for ($i=0; $i -lt $subname.length; $i++)  {
	mkdir $foldernames[$i] > $null
}

ls -name
