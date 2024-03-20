# Prompt the user to select a subject
Write-Host "Select a subject:"
Write-Host "1. Math"
Write-Host "2. Abu"
Write-Host "3. English"
Write-Host "4. Other"
$subjectChoice = Read-Host "Enter the number corresponding to the subject"

# Define the subject based on the user's choice
switch ($subjectChoice) {
    1 { $subject = "Math" }
    2 { $subject = "Abu" }
    3 { $subject = "English" }
    4 { $subject = "Other" }
    default { Write-Host "Invalid choice"; exit }
}

# Prompt the user to enter the name of the point
$pointName = Read-Host "Enter the name of the point"

# Get today's date
$currentDate = Get-Date -Format "yyyyMMdd"

# Construct the file name
$fileName = "$subject - $pointName - $currentDate.txt"

# Set the folder where the file will be saved
$folderPath = "C:\Your\Specific\Folder\Path"

# Create the full file path
$fullPath = Join-Path -Path $folderPath -ChildPath $fileName

# Create the folder if it doesn't exist
if (-not (Test-Path $folderPath)) {
    New-Item -ItemType Directory -Path $folderPath | Out-Null
}

# Write the information to the file
Set-Content -Path $fullPath -Value "Subject: $subject`nPoint Name: $pointName`nDate: $currentDate"

Write-Host "File saved to: $fullPath"
