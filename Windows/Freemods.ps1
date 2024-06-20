#description: Helpful script
#execution mode: IndividualWithRestart
#tags: Preview

<# Notes:
    This script will do some things!
#>


$ErrorActionPreference = 'Stop'
$VHDCompactDisk = $SecureVars.$VHDCompactDisk

Set-ItemProperty -Path HKLM:\Software\FSlogix\Apps -Type Dword -Name $VHDCompactDisk -Value $VHDCompactDisk