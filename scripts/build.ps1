# The MIT License (MIT)
# Copyright (c) 2016 Jan T. Sott
#
# https://github.com/idleberg/sublime-makensis

if (!(Test-Path HKLM:)) {
    Write-Host "Error: This script runs on PowerShell for Windows only"
    Exit
}

if ($PSVersionTable.PSVersion.Major -lt 3) {
    Write-Error "Error: This script requires PowerShell 3 (or higher)"
    Exit
}

if ([System.Environment]::Is64BitOperatingSystem) {
    $key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
} else {
    $key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
}

$nsis = (Get-ItemProperty -Path $key -Name InstallLocation).InstallLocation
$makensis = Join-Path -Path $nsis -ChildPath "makensis.exe"

try {
    Start-Process -NoNewWindow -FilePath "$makensis" -ArgumentList "$args"

} catch [System.Management.Automation.CommandNotFoundException] {
    Write-Error "Error: makensis.exe isn't in your PATH or NSIS_HOME environment variable."
}
