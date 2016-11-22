# The MIT License (MIT)
# Copyright (c) 2016 Jan T. Sott
#
# https://github.com/idleberg/sublime-makensis

If (-Not (Test-Path HKLM:)) {
    # This should never be shown when run from Sublime Text
    Write-Host "Error: This script is meant to be run on Windows only"
    Exit
}

If ($PSVersionTable.PSVersion.Major -lt 3) {
    # PowerShell 3.0 is integrated with Windows 8 and with Windows Server 2012
    Write-Host "Error: This script requires PowerShell 3.0 (or higher)"
    Exit
}

If ((Test-Path env:NSIS_HOME) -And (Test-Path "${env:NSIS_HOME}\makensis.exe")) {
    Write-Debug "Checking %NSIS_HOME% for makensis.exe"
    $makensis = "${env:NSIS_HOME}\makensis.exe"
} ElseIf (Get-Command "makensis.exe" -ErrorAction SilentlyContinue) {
    Write-Debug "Checking %PATH% for makensis.exe"
    $makensis = "makensis.exe"
} Else {
    Write-Debug "Checking registry for NSIS"
    If ([System.Environment]::Is64BitOperatingSystem) {
        $nsis_key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
    } Else {
        $nsis_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
    }

    $nsis_path = (Get-ItemProperty -Path $nsis_key -Name InstallLocation).InstallLocation
    $makensis = Join-Path -Path $nsis_path -ChildPath "makensis.exe"
}

Try {
    Start-Process -NoNewWindow -FilePath "$makensis" -ArgumentList "$args"
} Catch [System.Management.Automation.CommandNotFoundException] {
    Write-Host "Error: makensis.exe isn't in your PATH environment variable."
}
