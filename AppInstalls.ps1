#Terminal and code editor
winget install --id=Microsoft.WindowsTerminal  -e
winget install --id=Microsoft.VisualStudioCode  -e
winget install --id=JanDeDobbeleer.OhMyPosh  -e
winget install --id=Microsoft.Git  -e

#install NERD font, used for custom prompts
winget install --id=DEVCOM.JetBrainsMonoNerdFont -e

#language support
winget install Microsoft.Powershell --installer-type WIX --source winget #required due to update install method installing portable zip files
winget install --id=Python.Python.3.13 -e

#adding password manager
winget install --id=AgileBits.1Password -e

#Adding Google Chrome
winget install --id=Google.Chrome  -e

#update all
winget update --all

#Install WSL with default Ubuntu distrobution
wsl --install

# Set explorer to show hidden items and extensions
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
Set-ItemProperty $key Hidden 1
Set-ItemProperty $key HideFileExt 0
# Set-ItemProperty $key ShowSuperHidden 1
Stop-Process -processname explorer

#setup Oh-my-posh PowerShell profiles
$PSProfileRoot = $env:USERPROFILE + '\Documents'
$wPSDir = $PSProfileRoot + '\WindowsPowerShell'
$wPS = $wPSDir + '\Microsoft.PowerShell_profile.ps1'
$ps7Dir = $PSProfileRoot + '\PowerShell'
$ps7 = $ps7Dir + '\Microsoft.PowerShell_profile.ps1'

$wsprofile = Test-Path $wPS
$ps7profile = Test-Path $ps7

# Ensure PowerShell profiles exist
# Create folders if they don't exist
if (-not (Test-Path $wPSDir)) {
    Write-Host "Creating Windows PowerShell profile directory"
  try{    
    New-Item -ItemType Directory -Path $wPSDir -Force -Verbose
  }catch{
    Write-Host "could not create folder"
  }
}

if (-not (Test-Path $ps7Dir)) {
    Write-Host "Creating PS7 profile directory"
    New-Item -ItemType Directory -Path $ps7Dir -Force
}

# Create files if they don't exist
if (-not $wsprofile) {
    Write-Host "Creating Windows PowerShell profile file"
    New-Item -ItemType File -Path $wPS -Force
}
if (-not $ps7profile) {
    Write-Host "Creating PS7 profile file"
    New-Item -ItemType File -Path $ps7 -Force
} 
