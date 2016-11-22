# The MIT License (MIT)
# Copyright (c) 2016 Jan T. Sott
#
# https://github.com/idleberg/sublime-makensis

if (!(Test-Path HKLM:)) {
    # This should never be shown when run from Sublime Text
    Write-Host "Error: This script runs on PowerShell for Windows only"
    Exit
}

if ($PSVersionTable.PSVersion.Major -lt 3) {
    # PowerShell 3.0 is integrated with Windows 8 and with Windows Server 2012
    Write-Host "Error: This script requires PowerShell 3 (or higher)"
    Exit
}

if ([System.Environment]::Is64BitOperatingSystem) {
    $path = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
} else {
    $path = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
}

$nsis = (Get-ItemProperty -Path $path -Name InstallLocation).InstallLocation
$makensis = Join-Path -Path $nsis -ChildPath "makensis.exe"

try {
    Start-Process -NoNewWindow -FilePath "$makensis" -ArgumentList "$args"
} catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Error: makensis.exe isn't in your PATH environment variable."
}
