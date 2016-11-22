@echo off

rem Check %NSIS_HOME% for makensis.exe
if defined NSIS_HOME (
    if exist "%NSIS_HOME%\makensis.exe" (
        set "nsis_path=%NSIS_HOME%"
        goto found
    )
)

rem Check %PATH% for makensis.exe
if not defined nsis_path (
    for %%X in (makensis.exe) do (set nsis_path=%%~dp$PATH:X)
)

rem Check registry for NSIS install path
if %PROCESSOR_ARCHITECTURE%==x86 (
    set RegQry=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
) else (
    set RegQry=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\NSIS
)

if not defined nsis_path (
    for /F "tokens=2*" %%a in ('reg query "%RegQry%" /v InstallLocation ^|findstr InstallLocation') do set nsis_path=%%b 
)

:found
set args=
:loop
    set args=%args% %1
    shift
if not "%~1"=="" goto loop

if defined nsis_path (
    "%nsis_path%\makensis.exe" %args%
) else (
    echo 'makensis.exe' is not recognized as an internal or external command, operable program or batch file.
)
