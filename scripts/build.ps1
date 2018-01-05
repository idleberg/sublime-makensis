# The MIT License (MIT)
# Copyright (c) 2016-2018 Jan T. Sott
#
# https://github.com/idleberg/sublime-makensis

$DebugPreference = "SilentlyContinue"

# PowerShell 3.0 is integrated with Windows 8 and with Windows Server 2012
If ($PSVersionTable.PSVersion.Major -lt 3) {
    Write-Host "Error: This script requires PowerShell 3.0 (or higher)"
    Exit
}

If (Get-Command "makensis" -ErrorAction SilentlyContinue) {
    Write-Debug "'makensis' found in %PATH%"
    $makensis = "makensis"
} ElseIf (Test-Path HKLM:) {
    Write-Debug "Checking Windows Registry for NSIS installation path"

    If ([System.Environment]::Is64BitOperatingSystem) {
        $nsis_key = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
    } Else {
        $nsis_key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS'
    }

    $nsis_path = (Get-ItemProperty -Path $nsis_key -Name InstallLocation).InstallLocation

    If (-Not ([string]::IsNullOrEmpty($nsis_path))) {
        $makensis = Join-Path -Path $nsis_path -ChildPath "makensis.exe"
    }
}

If (-Not $makensis) {
    Write-Host "'makensis' is not recognized as an internal or external command, operable program or batch file."
} Else {
    Write-Debug "Executing `"$makensis $args`""
    Start-Process -NoNewWindow -FilePath "$makensis" -ArgumentList "$args"
}
