@echo off

set nsis_path=

if defined NSIS_HOME (
    if exist "%NSIS_HOME%\makensis.exe" (
        set "nsis_path=%NSIS_HOME%"
        goto build
    )
)

if %PROCESSOR_ARCHITECTURE%==x86 (
    set RegQry=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
) else (
    set RegQry=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
)

if not defined nsis_path (
    for /F "tokens=2*" %%a in ('reg query "%RegQry%" /v InstallLocation ^|findstr InstallLocation') do set nsis_path=%%b
)

if not defined nsis_path (
    for %%X in (makensis.exe) do (set nsis_path=%%~dp$PATH:X)
)

set args=
:loop
    set args=%args% %1
    shift
if not "%~1"=="" goto loop

:build
if defined nsis_path (
    "%nsis_path%\makensis.exe" %args%
) else (
    echo "Error: makensis.exe isn't in your PATH environment variable."
)