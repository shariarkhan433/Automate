@echo off
setlocal

:: Define the path to 7-Zip
set "zipPath=C:\Program Files\7-Zip"

:: Get the current System PATH
for /f "tokens=*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH 2^>nul') do set "currentPath=%%A"

:: Add the 7-Zip path to the end of the System PATH
set "newPath=%currentPath%;%zipPath%"

:: Update the System PATH
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PATH /t REG_EXPAND_SZ /d "%newPath%" /f

:: Broadcast the change to running applications
%SystemRoot%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

echo 7-Zip path added to the System PATH.

endlocal
exit /b
